local jdtls = require('jdtls')

local is_windows = vim.fn.has("win32") == 1
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

local function path_join(...)
    local separator = is_windows and "\\" or "/"
    return table.concat({...}, separator)
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = path_join(vim.fn.stdpath("data"), "jdtls-workspace", project_name)

local config_os = "config_linux"
if is_windows then config_os = "config_win" end
if vim.fn.has("mac") == 1 then config_os = "config_mac" end

local launcher_jar = vim.fn.glob(path_join(mason_path, "plugins", "org.eclipse.equinox.launcher_*.jar"), true)

local lombok_path = path_join(mason_path, "lombok.jar")

local cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. lombok_path,
    "-jar", launcher_jar,
    "-configuration", path_join(mason_path, config_os),
    "-data", workspace_dir,
}

local config = {
    cmd = cmd,
    root_dir = jdtls.setup.find_root({".git", "mvnw", "gradlew", "pom.xml"}),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
        }
    },
}

jdtls.start_or_attach(config)
