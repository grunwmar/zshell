# List of ideas to implement

## python
* Implement `setvar` command to set/delete env variables. They are stored as `.json`
  and converted to `.sh` when running `setvar` command and then the new `.sh` file is sourced
* Coloring path location in prompt - different colors for directorie/file names and separators
* Track `.dotfiles` across the user-space in system. Create/edit list of such files
  and be able to export/import/transfer them easilly. Hypothetic example `dotf track/untrack [list of files]`, `dotf collect`, `dotf distribute`, `dotf export [filename]`etc.
## ZSH
* More adaptation to terminal width
* In case of usage with **Termux app** add some configuration for it