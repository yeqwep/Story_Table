local core = require 'gooey.internal.core'

local M = {}

M.TOUCH = hash('touch')

local checkboxes = {}

local CHECKBOX = {
    set_checked = function(checkbox, checked)
        checkbox.checked = checked
        if checkbox.refresh_fn then
            checkbox.refresh_fn(checkbox)
        end
    end,
    set_visible = function(checkbox, visible)
        gui.set_enabled(checkbox.node, visible)
    end,
    -- 表示を変える
    set_BLEND_MULT = function(button, blend)
        gui.set_blend_mode(button.node, blend)
    end,
    refresh = function(checkbox)
        if checkbox.refresh_fn then
            checkbox.refresh_fn(checkbox)
        end
    end
}

function M.checkbox(node_id, action_id, action, fn, refresh_fn)
    node_id = core.to_hash(node_id)
    local node = gui.get_node(node_id)
    assert(node)

    local checkbox = core.instance(node_id, checkboxes, CHECKBOX)
    checkbox.enabled = core.is_enabled(node)
    checkbox.node = node
    checkbox.refresh_fn = refresh_fn

    core.clickable(checkbox, action_id, action)
    checkbox.checked_now = checkbox.clicked and not checkbox.checked or false
    checkbox.unchecked_now = checkbox.clicked and checkbox.checked or false
    if checkbox.clicked then
        checkbox.checked = not checkbox.checked
        fn(checkbox)
    end

    checkbox.refresh()
    return checkbox
end

setmetatable(
    M,
    {
        __call = function(_, ...)
            return M.checkbox(...)
        end
    }
)

return M
