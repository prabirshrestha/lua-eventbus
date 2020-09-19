package = "event-emitter"
version = "0.0.1-1"

source = {
    url = "git://github.com/prabirshrestha/lua-event-emitter.git",
    tag = "v0.0.1-1"
}

description = {
    summary = "Event emitter for Lua",
    homepage = "https://github.com/prabirshrestha/lua-event-emitter",
    license = "MIT",
    maintainer = "mail@prabir.me",
    detailed = [[
        Event emitter for lua
    ]]
}

build = {
    type = "builtin",
    modules = { callbag = "event-emitter.lua" }
}
