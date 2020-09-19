local M = {}

function M.new()
    local bus = {}

    local handlers = {}

    --- Subscribe to an event.
    --
    -- Register an event handler.
    -- @tparam string event the event name
    -- @tparam function handler the event handler
    -- @tparam[opt] int index the index at which to insert the handler (1 is the highest priority)
    bus.on = function (event, handler, index)
        if not event then error('Invalid event name') end
        if type(handler) ~= 'function' then error('Invalid event handler') end
        if not handlers[event] then handlers[event] = {} end
        bus.off(event, handler)
        table.insert(handlers[event], index or #handlers[event] + 1, handler)
    end

    --- Unsubscribe from an event.
    --
    -- Remove a registered event handler.
    -- @tparam string event the event name
    -- @tparam function handler the event handler to unsubscribe
    -- @treturn bool whether the handler was successfully removed
    bus.off = function (event, handler)
        local h = handlers[event]
        if not h then return end
        for i = 1, #h do
            if h[i] == handler then
                table.remove(h, i)
                return true
            end
        end

        return false
    end

    --- Generate event.
    --
    -- Invokes all event handlers in the order they were registered.
    -- Passes all arguments to the handler. The first handler which returns a non `nil`
    -- value terminates the event propagation. The other handlers will not be called.
    --
    -- @tparam string event the event name
    -- @tparam ... ... the remaining paramters are passed on to the handler
    bus.emit = function (event, ...)
        local h = handlers[event]
        if not h then return end
        for i = 1, #h do
            local ret = h[i](...)
            if type(ret) ~= 'nil' then return ret end
        end
    end

    return bus
end

return M
