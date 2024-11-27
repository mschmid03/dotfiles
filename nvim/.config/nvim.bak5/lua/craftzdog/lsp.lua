local M = {}

function M.toggleInlayHints()
	if vim.lsp.inlay_hint then
		vim.keymap.set("n", "<Leader>nh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end, { desc = "toggle inlay [h]ints" })
	end
end

return M
