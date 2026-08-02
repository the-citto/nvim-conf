return {
	"windwp/nvim-ts-autotag",
	opts = {
		-- Global configuration options
		opts = {
			enable_close = true, -- Auto close tags (e.g. <div> -> <div></div>)
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		},
		-- -- Override settings for specific filetypes
		-- per_filetype = {
		-- 	["html"] = {
		-- 		enable_close = true,
		-- 	},
		-- },
	},
}
