" Register command: :ColorTailor <hex> <colorName>
command! -nargs=+ ColorTailor lua require("color_tailor").run(<f-args>)
