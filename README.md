# Event Bus for lua

Event Bus (aka Event Emitter) for lua extracted from [vis](https://github.com/martanne/vis).

# LuaRocks

https://luarocks.org/modules/prabirshrestha/eventbus

```bash
luarocks install eventbus
```

# Usage

```lua
local EventBus = require('eventbus')

local bus = EventBus.new()

local cb = function (arg1, arg2)
    print(arg1, arg2)
end

bus.on('greet', cb)
bus.emit('greet', 'hello', 'world')
bus.off('greet', cb)
```

# LICENSE

Refer to [vis MIT license](https://github.com/martanne/vis/blob/2290224c844775d446fc8aaf3a98c0149d935875/LICENSE)
for more details
