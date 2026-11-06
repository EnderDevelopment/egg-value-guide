# Roblox Script: Golden Egg Finder

Golden Egg Finder is a server-side Roblox script implemented as a Luau ModuleScript that locates the highest-value unclaimed egg in an experience you own. It supports Roblox Models and BaseParts, numeric attributes and value objects, customizable egg folders, claimed-egg filtering, and deterministic alphabetical tie handling.

## Install

1. Open your Roblox experience in Roblox Studio.
2. In `Workspace`, create a `Folder` named `Eggs`.
3. Add each egg as a `Model` or `BasePart` directly inside `Workspace.Eggs`.
4. Assign each egg a numeric `Value` attribute. The script also supports a numeric `EggValue` attribute.
5. As an alternative to attributes, add an `IntValue` or `NumberValue` child named `Value` or `EggValue` to an egg.
6. To exclude an egg from the search, set its boolean `Claimed` attribute to `true`.
7. Create a `ModuleScript` named `HighestValueEggFinder` inside `ServerScriptService`.
8. Copy the contents of `ServerScriptService/HighestValueEggFinder.lua` into the new ModuleScript.
9. Use the module from a server-side `Script` in `ServerScriptService`.

## Use

Require the module and call `FindHighestValueEgg`:

```lua
local finder = require(game.ServerScriptService.HighestValueEggFinder)
local egg, value = finder.FindHighestValueEgg()

if egg then
	print("Highest-value egg:", egg.Name, value)
else
	print("No unclaimed eggs with numeric values were found.")
end
```

You can provide a different folder or container:

```lua
local customFolder = workspace:WaitForChild("SpecialEggs")
local egg, value = finder.FindHighestValueEgg(customFolder)
```

The function checks direct children of the supplied folder. It returns the matching egg instance and its numeric value. If no eligible egg is found, it returns `nil, nil`. When multiple eligible eggs have the same value, the egg with the alphabetically earlier name is returned.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/6bc8b4c3-2492-430b-b9a3-dc706525c695?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=6bc8b4c3-2492-430b-b9a3-dc706525c695
