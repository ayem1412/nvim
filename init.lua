--[[ if os.getenv("HOME") == nil then
    os.setenv("HOME", vim.env.USERPROFILE or vim.env.HOMEPATH)
end ]]

require 'xibe.core'
require 'xibe.lazy'
