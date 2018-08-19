# Oxid
Oxid is an arcade-style game where you fight waves of monsters in a fixed-screen maze. This is more or less a clone of [Verminian Trap](http://locomalito.com/verminian_trap.php) (2013, Locomalito). Verminian Trap was originally inspired by [Wizard of Wor](https://en.wikipedia.org/wiki/Wizard_of_Wor) (1980, Midway). Oxid is currently not nearly as fun as Verminian Trap, see TODO.md for planned features.

The project is very early in development, but it's playable. No screenshots yet.

Oxid is written in the [Zig](https://ziglang.org) programming language.

## How to play
* Install [SDL2](https://www.libsdl.org/), SDL2_mixer and [libepoxy](https://github.com/anholt/libepoxy)
* Install [Zig](https://ziglang.org/download/) (get it from master, version 0.2.0 is too old)
* Depending on your version of Git, you may have to explicitly update the submodules: `git submodule init` followed by `git submodule update`
* `zig build play`

Controls:
* arrow keys: move
* space: shoot
* tab: pause
* backquote: fast forward
* esc: quit
* backspace: reset
* enter/return: skip to next wave (cheat)
* F2: toggle rendering of move boxes (debug feature)
* F3: toggle god mode (cheat)
* F4: toggle profiling spam (debug feature)

## Notes
Low-level graphics code was lifted from andrewrk's [Tetris](https://github.com/andrewrk/tetris) demo for Zig.

Sound effects from https://opengameart.org/content/512-sound-effects-8-bit-style

Uses my [zigutils](https://gitlab.com/dbandstra/zigutils) and [zig-comptime-pcx](https://gitlab.com/dbandstra/zig-comptime-pcx) libraries.
