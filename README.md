# Fast Punches NMRIH

## Description
Fast Punches NMRIH is a plugin for the game No More Room in Hell (NMRIH) that allows players to punch faster. This plugin increases the speed of melee attacks, making punches more effective in combat.

## Version
1.0.2

## Author
[Blade](https://github.com/IIBladeII)

## Requirements
- SourceMod
- MetaMod:Source
- No More Room in Hell (NMRIH)

## Installation
1. Download the `fastpunch.smx` file
2. Place the .smx file in the `addons/sourcemod/plugins/` folder of your NMRIH server
3. Restart the server or load the plugin via server console using the command:
   ```
   sm plugins load fastpunch
   ```

## Configuration
The plugin automatically creates a configuration file in `cfg/sourcemod/fastpunch.cfg` with the following options:

- `sm_fastpunch_multiplier` (default: 1.1) - Punch speed multiplier
  - Minimum: 1.0 (normal speed)
  - Maximum: 1.5 (50% faster)

To adjust the configuration:
1. Edit the `cfg/sourcemod/fastpunch.cfg` file
2. Change the value of `sm_fastpunch_multiplier` as desired
3. Save the file and reload the plugin or restart the server

## Usage
Once installed and configured, the plugin will work automatically. Players will notice that their punches are faster when using fists in the game.

## Commands
There are no specific commands for players. The plugin works automatically.

## Notes
- The plugin has a maximum speed limit to maintain game balance
- Works only for human players, does not affect bots

## License
© [Blade](https://github.com/IIBladeII), [2024]. All rights reserved.

This plugin is provided as-is, without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this plugin.

Permission is granted to anyone to use this plugin for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

1. The origin of this plugin must not be misrepresented; you must not claim that you wrote the original plugin.
2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original plugin.
3. This notice may not be removed or altered from any source distribution.