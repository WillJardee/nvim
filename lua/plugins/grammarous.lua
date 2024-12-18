return {
    "WillJardee/grammarous.nvim",
    config = function()
        vim.g["grammarous#languagetool_cmd"] = 'languagetool'
        vim.g["grammarous#show_first_error"] = 1
        vim.g["grammarous#use_vim_spelllang"] = 1
        vim.g["grammarous#enabled_rules"] = {["*"] = {"IT_IS_OBVIOUS"}}
        vim.g["grammarous#custom_rules"] = vim.g.config_path .. "/data/languagetool/pl-lt-rules.xml"
     end
}
