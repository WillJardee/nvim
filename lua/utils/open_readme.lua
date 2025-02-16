
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local telescope = require("telescope")

local function open_readme()
    telescope.extensions.project.project({
        attach_mappings = function(prompt_bufnr, map)
            -- Replace the default select action
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local project_path = selection.path

                -- Define possible README file names
                local readme_files = { "README.md", "README.txt", "README" }

                -- Check for README and open it if found
                for _, filename in ipairs(readme_files) do
                    local readme_path = project_path .. "/" .. filename
                    local file = io.open(readme_path, "r")
                    if file then
                        io.close(file)
                        vim.cmd("edit " .. readme_path) -- Open the README file
                        return
                    end
                end

                -- If no README, just open the project directory
                vim.cmd("edit " .. project_path)
            end)

            return true
        end,
    })
end

return open_readme

