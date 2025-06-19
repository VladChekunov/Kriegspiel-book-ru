# Kriegspiel
The translation of the game rules [Kriegspiel](https://en.wikipedia.org/wiki/A_Game_of_War) into Russian.

## Builds
See Github's Release section. 

# Dependencies
## Pandoc
```bash
sudo apt-get install pandoc texlive-latex-base texlive-fonts-recommended texlive-extra-utils texlive-latex-extra texlive-xetex
```
## Just
https://github.com/casey/just#installation

# Split
Split `original.md` into parts `build/parts`. Then you can move it to src, make translations.
```bash
just split
```

# Build
Combine `build/parts` translation parts into single `translation.md` file and build pdf via pandas.
```bash
just build
```
