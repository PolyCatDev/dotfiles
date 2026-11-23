local config_modules = {
	"markdown",
	"git",
	"cpp",
	"gdscript",
	"commands",
}

for _, module in ipairs(config_modules) do
	require("config.modules." .. module)
end
