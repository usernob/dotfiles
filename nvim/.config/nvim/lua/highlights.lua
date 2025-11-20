local J = {}
J.source_matugen = function()
    -- Update this with the location of your output file
    local matugen_path = os.getenv("HOME") .. "/.config/nvim/lua/colors.lua" -- dofile doesn't expand $HOME or ~

    local file, err = io.open(matugen_path, "r")
    -- If the matugen file does not exist (yet or at all), we must initialize a color scheme ourselves
    if err ~= nil then
        -- Some placeholder theme, this will be overwritten once matugen kicks in
        vim.cmd("colorscheme base16-oxocarbon-dark")

        -- Optionally print something to the user
        vim.print(
            "A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!"
        )
    else
        dofile(matugen_path)
        io.close(file)
    end
end

return J
