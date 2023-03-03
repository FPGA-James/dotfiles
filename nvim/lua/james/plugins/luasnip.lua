local success, ls = pcall(require, "luasnip")
if not success then return end
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local r = ls.restore_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

---#Config
ls.config.set_config({
    -- Remember the last snippet I was in
    history = true,

    -- Update snippet text in _real time_
    updateevents = "TextChanged,TextChangedI",

    -- Show virtual text hints for node types
    ext_opts = {
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "Operator" } },
            },
        },
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "Constant" } },
            },
        },
    },
})
