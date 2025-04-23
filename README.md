# 🎨 color-tailor.nvim

A Neovim plugin to generate Tailwind-style color shades from any base hex color — directly inside your editor!

## ✨ Features

- 🔢 Generates full Tailwind color scales (from `50` to `950`)
- 📋 Copy Tailwind config output to clipboard
- 🧠 Written in pure Lua for speed and simplicity

## 🚀 Usage

``` vim
:ColorTailor <baseColor> <colorName> [action]
```

## Parameters
- `baseColor`: Hex code (e.g., #14b8a6)

- `colorName`: Name to use in config (e.g., teal)

- `action` (optional):
    - `copy`: Copies Tailwind config to clipboard
    - `file`: Saves the config to a local file

## Output file path
`~/.config/nvim/tailwind-colors/<colorName>.js`

## Examples
```
:ColorTailor #0ea5e9 sky
:ColorTailor #facc15 yellow copy
:ColorTailor #14b8a6 teal export
```

## 🤝 Contributing
- Feel free to open issues, suggest features, or submit PRs!

