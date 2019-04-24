local M = {}

-- ボタンのイージング
function M.shake(node, initial_scale)
	gui.cancel_animation(node, "scale.x")
	gui.cancel_animation(node, "scale.y")
	gui.set_scale(node, initial_scale)
	local scale = gui.get_scale(node)
	gui.set_scale(node, scale * 1.05)
	gui.animate(node, "scale.x", scale.x, gui.EASING_OUTBOUNCE , 0.1)
	gui.animate(node, "scale.y", scale.y, gui.EASING_OUTBOUNCE , 0.1, 0.05, function()
		gui.set_scale(node, initial_scale)
	end)
end


return M
