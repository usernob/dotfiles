vim.filetype.add({
    extension = {
        rasi = "rasi",
    },
    pattern = {
        ["${XDG_CONFIG_HOME}/hypr/.*%.conf"] = "hyprlang",
        ["${HOME}/dotfiles/hypr/.config/hypr/.*%.conf"] = "hyprlang",
    },
})
