# Delphi palette collection

Returns the Delphi palette collection. Palette names use lowercase
letters and hyphens. For example, use `mayfair` or `perito-moreno`.

## Usage

``` r
delphi_palettes(category = NULL, colorblind_friendly = FALSE)
```

## Arguments

- category:

  An optional category. It must be one of `classic`, `nature`,
  `keycaps`, `vintage`, `modern`, `bold`, `soft`, `monochrome`,
  `seasonal`, or `artistic`.

- colorblind_friendly:

  If `TRUE`, returns only palettes that pass
  [`delphi_palette_colorblind()`](https://connorb.github.io/delphiPalettes/reference/delphi_palette_colorblind.md).

## Value

A named list. Each element is a character vector of hexadecimal colors.

## Examples

``` r
delphi_palettes("nature")
#> $ellesmere
#> [1] "#E4CAA7" "#735B47" "#4F4331" "#3B2919" "#120D03"
#> 
#> $sequoia
#> [1] "#1a0f0a" "#4a2c17" "#8b4513" "#2d5a3d" "#6b8e6b"
#> 
#> $mojave
#> [1] "#f5deb3" "#d4a574" "#c77b4a" "#8b4513" "#4a2c17"
#> 
#> $monterey
#> [1] "#1a3d4a" "#2e6b7a" "#5a9baa" "#8ab4c4" "#c9dce6"
#> 
#> $`big-sur`
#> [1] "#c9d4dc" "#dce4e8" "#e8f0f0" "#f5f8fa" "#5a7a8a"
#> 
#> $`muir-woods`
#> [1] "#4a1a0a" "#8b3a1a" "#1a3d1a" "#2e6b3d" "#4a8b5a"
#> 
#> $antelope
#> [1] "#8b4513" "#cd853f" "#deb887" "#f5deb3" "#2d1810"
#> 
#> $hoh
#> [1] "#0d0a14" "#1a142e" "#2e1a47" "#2e4a2e" "#4a6b4a"
#> 
#> $yellowstone
#> [1] "#1a1a1a" "#3d3d3d" "#ff4500" "#ff6347" "#ffa07a"
#> 
#> $`perito-moreno`
#> [1] "#e8f4f8" "#b8d8e8" "#88c4d8" "#58a8c8" "#2890b8"
#> 
#> $atacama
#> [1] "#f5deb3" "#d4a574" "#ff69b4" "#da70d6" "#8b4513"
#> 
#> $pantanal
#> [1] "#1a2e1a" "#2e4a2e" "#4a6b4a" "#6b8b6b" "#8bb88b"
#> 
#> $galapagos
#> [1] "#0a1a1a" "#1a3d3d" "#2e5c5c" "#4a8b7a" "#6bb89b"
#> 
#> $svalbard
#> [1] "#e8f0f0" "#c9d4dc" "#8ba8b8" "#5a7080" "#3d4a52"
#> 
#> $tromso
#> [1] "#0a0a1a" "#1a472a" "#2e8b57" "#48d1cc" "#9370db"
#> 
#> $dartmoor
#> [1] "#4a5c4a" "#6b8b6b" "#8ba88b" "#a8a8a0" "#6b6b5c"
#> 
#> $cairngorms
#> [1] "#6b8b6b" "#8ba88b" "#a8c4a8" "#c4d4b8" "#dce8c9"
#> 
#> $bialowieza
#> [1] "#4a3c2e" "#6b5c4a" "#8b7a6b" "#a89b8b" "#c9b8a8"
#> 
#> $stromboli
#> [1] "#1a1a1a" "#2d2d2d" "#ff4500" "#ff6347" "#ffd700"
#> 
#> $connemara
#> [1] "#1a120a" "#3d2914" "#5c4a2e" "#8b7a5c" "#a89b7a"
#> 
#> $plitvice
#> [1] "#0d1a26" "#1a3a5c" "#3d6b8a" "#8ab4c4" "#e8f0f5"
#> 
#> $cherrapunji
#> [1] "#1a2634" "#3d5066" "#5a7a8a" "#8ba8b8" "#c9d4dc"
#> 
#> $arashiyama
#> [1] "#6b8e23" "#9acd32" "#c4e854" "#f0f8e0"
#> 
#> $sundarbans
#> [1] "#1a2e1a" "#2e4a2e" "#4a6b4a" "#6b8b6b" "#c9a86c"
#> 
#> $zhangjiajie
#> [1] "#3d4a52" "#5a7080" "#7a9098" "#98b0b8" "#b8d0d8"
#> 
#> $socotra
#> [1] "#9b59b6" "#e74c8b" "#f39c12" "#27ae60" "#3498db"
#> 
#> $serengeti
#> [1] "#f5e6c8" "#d4b896" "#c9a227" "#8b6914" "#4a3c1a"
#> 
#> $namaqualand
#> [1] "#ff6347" "#ffd700" "#ff69b4" "#9acd32" "#8b4513"
#> 
#> $okavango
#> [1] "#1a1a2e" "#2e2e4a" "#4a4a6b" "#6b6b8b" "#ffd700"
#> 
#> $namib
#> [1] "#f5deb3" "#d4a574" "#c77b4a" "#8b4513" "#1a1a2e"
#> 
#> $`blue-mountains`
#> [1] "#3d5c4a" "#5a8b6b" "#8bb89b" "#a8d4b8" "#d4e8dc"
#> 
#> $tasmania
#> [1] "#0a1a1a" "#1a3d3d" "#2e5c5c" "#4a8b7a" "#8bb89b"
#> 
#> $`milford-sound`
#> [1] "#0d1a26" "#1a3a5c" "#3d6b8a" "#8ab4c4" "#c9dce8"
#> 
#> $palau
#> [1] "#0a3d5c" "#1a6b8a" "#ff6b6b" "#ffa07a" "#f5deb3"
#> 
#> $hokitika
#> [1] "#5c5c52" "#8b8b7a" "#a8a898" "#c4c4b8" "#e0e0d4"
#> 
#> $vieques
#> [1] "#0a0a1a" "#1a1a3d" "#00ffff" "#00ff7f" "#7fffd4"
#> 
#> $mcmurdo
#> [1] "#f0f8ff" "#e0f0f8" "#b0d8e8" "#80c0d8" "#50a8c8"
#> 
#> $karelia
#> [1] "#f5f5f0" "#e8e8dc" "#c9c9b8" "#5c5c4a" "#2d2d1a"
#> 
#> $naica
#> [1] "#2e1a47" "#5c3a8b" "#8b5cb8" "#b88bd4" "#d4b8e8"
#> 
delphi_palettes(colorblind_friendly = TRUE)
#> $hokitika
#> [1] "#5c5c52" "#8b8b7a" "#a8a898" "#c4c4b8" "#e0e0d4"
#> 
#> $oblivion
#> [1] "#1a1a1a" "#2d2d2d" "#4a4a4a" "#9acd32" "#f5f5f0"
#> 
#> $bento
#> [1] "#1a1a1a" "#2d2d2d" "#e04040" "#f5f5f0" "#f0a0a0"
#> 
#> $`evil-dolch`
#> [1] "#1a1a1a" "#2d2d2d" "#4a4a4a" "#8b0000" "#c40000"
#> 
#> $casablanca
#> [1] "#0a0a0a" "#1a1a1a" "#3d3d3d" "#6b6b6b" "#a0a0a0"
#> 
#> $canabalt
#> [1] "#111111" "#333333" "#666666" "#999999" "#ffffff"
#> 
#> $notion
#> [1] "#000000" "#37352f" "#9b9a97" "#e8e8e8" "#ffffff"
#> 
#> $vercel
#> [1] "#000000" "#171717" "#333333" "#666666" "#ffffff"
#> 
#> $linear
#> [1] "#000000" "#171717" "#5e6ad2" "#a1a5ff" "#ffffff"
#> 
#> $obsidian
#> [1] "#1e1e1e" "#262626" "#483699" "#7f6df2" "#d4c4ff"
#> 
#> $supabase
#> [1] "#1c1c1c" "#2e2e2e" "#3ecf8e" "#1c8656" "#f5f5f5"
#> 
#> $raycast
#> [1] "#1a1a1a" "#2d2d2d" "#ff6363" "#ff7eb3" "#ffffff"
#> 
#> $glassmorphism
#> [1] "#ffffff20" "#ffffff40" "#c9d4dc"   "#e8f0f0"   "#f5f8fa"  
#> 
#> $`dark-mode`
#> [1] "#0d0d0d" "#1a1a1a" "#2d2d2d" "#4a4a4a" "#6b6b6b"
#> 
#> $dove
#> [1] "#f5f5f5" "#e8e8e8" "#dcdcdc" "#d0d0d0" "#c4c4c4"
#> 
#> $porcelain
#> [1] "#fefefe" "#f8f8f8" "#f0f0f0" "#e8e8e8" "#e0e0e0"
#> 
#> $`charcoal-mono`
#> [1] "#1a1a1a" "#2d2d2d" "#404040" "#535353" "#666666"
#> 
#> $`rothko-chapel`
#> [1] "#1a1a1a" "#2d2d2d" "#3d3d3d" "#4a4a4a" "#5c5c5c"
#> 
#> $whistler
#> [1] "#2d2d2d" "#4a4a4a" "#6b6b6b" "#8b8b8b" "#ababab"
#> 
#> $caravaggio
#> [1] "#0a0a0a" "#1a1a1a" "#4a3c2e" "#8b6b52" "#c9a86c"
#> 
#> $escher
#> [1] "#000000" "#333333" "#666666" "#999999" "#ffffff"
#> 
```
