if vim.g.colors_name ~= nil then
	vim.cmd("highlight clear")
end

vim.g.colors_name = "catppuccin-macchiato"

-- Highlight groups
local hi = vim.api.nvim_set_hl

--
-- Syntax
--
hi(0, "Comment", { fg = "#6e738d", italic = true })
hi(0, "Constant", { fg = "#f5a97f" })
hi(0, "String", { fg = "#a6da95" })
hi(0, "Character", { fg = "#8bd5ca" })
hi(0, "Number", { fg = "#f5a97f" })
hi(0, "Boolean", { fg = "#f5a97f" })
hi(0, "Float", { fg = "#f5a97f" })
hi(0, "Identifier", { fg = "#f0c6c6" })
hi(0, "Function", { fg = "#8aadf4" })

hi(0, "Changed", { fg = "#eed49f" })
hi(0, "Removed", { fg = "#ed8796" })
hi(0, "Added", { fg = "#a6da95" })

--
-- Interface
--
hi(0, "Cursor", { bg = "#cad3f5", fg = "#24273a" })
hi(0, "CursorIM", { bg = "#cad3f5", fg = "#24273a" })
hi(0, "CursorColumn", { bg = "#1e2030" })
hi(0, "CursorLine", { bg = "#303347" })
hi(0, "CursorLineNr", { fg = "#b7bdf8" })

hi(0, "Search", { bg = "#494d64" })
hi(0, "CurSearch", { bg = "#ed8796", fg = "#1e2030" })
hi(0, "IncSearch", { bg = "#86c5d2", fg = "#1e2030" })

hi(0, "Error", { bg = "#373043", fg = "#ed8796", italic = true })
hi(0, "MoreMsg", { fg = "#6e738d" })
hi(0, "ErrorMsg", { bg = "#373043", fg = "#ed8796", italic = true })
hi(0, "Question", { fg = "#cad3f5" })

hi(0, "MatchParen", { bg = "#373744", fg = "#eed49f", underline = true })

--
-- Treesitter
--
hi(0, "@attribute", { link = "Constant" })
hi(0, "@character.special", { link = "SpecialChar" })
hi(0, "@conditional", { link = "Conditional" })
hi(0, "@constant.builtin", { fg = "#f5a97f" })
hi(0, "@constant.java", { fg = "#8bd5ca" })
hi(0, "@constant.macro", { link = "Macro" })
hi(0, "@constructor", { fg = "#7dc4e4" })
hi(0, "@constructor.lua", { fg = "#f0c6c6" })
hi(0, "@constructor.tsx", { fg = "#b7bdf8" })
hi(0, "@constructor.typescript", { fg = "#b7bdf8" })
hi(0, "@error", { link = "Error" })
hi(0, "@field", { fg = "#b7bdf8" })
hi(0, "@field.yaml", { fg = "#8aadf4" })
hi(0, "@function.builtin", { fg = "#f5a97f" })
hi(0, "@function.builtin.bash", { fg = "#ed8796", italic = true })
hi(0, "@function.call", { link = "Function" })
hi(0, "@function.macro", { fg = "#8bd5ca" })
hi(0, "@include", { link = "Include" })
hi(0, "@keyword.export", { fg = "#91d7e3" })
hi(0, "@keyword.function", { fg = "#c6a0f6" })
hi(0, "@keyword.operator", { fg = "#c6a0f6" })
hi(0, "@keyword.return", { fg = "#c6a0f6" })
hi(0, "@label.json", { fg = "#8aadf4" })
hi(0, "@lsp.type.boolean", { link = "@boolean" })
hi(0, "@lsp.type.builtinType", { link = "@type.builtin" })
hi(0, "@lsp.type.comment", { link = "@comment" })
hi(0, "@lsp.type.enum", { link = "@type" })
hi(0, "@lsp.type.enumMember", { link = "@constant" })
hi(0, "@lsp.type.escapeSequence", { link = "@string.escape" })
hi(0, "@lsp.type.formatSpecifier", { link = "@punctuation.special" })
hi(0, "@lsp.type.interface", { fg = "#f0c6c6" })
hi(0, "@lsp.type.keyword", { link = "@keyword" })
hi(0, "@lsp.type.namespace", { link = "@namespace" })
hi(0, "@lsp.type.number", { link = "@number" })
hi(0, "@lsp.type.operator", { link = "@operator" })
hi(0, "@lsp.type.parameter", { link = "@parameter" })
hi(0, "@lsp.type.property", { link = "@property" })
hi(0, "@lsp.type.selfKeyword", { link = "@variable.builtin" })
hi(0, "@lsp.type.typeAlias", { link = "@type.definition" })
hi(0, "@lsp.type.unresolvedReference", { link = "@error" })
hi(0, "@lsp.typemod.class.defaultLibrary", { link = "@type.builtin" })
hi(0, "@lsp.typemod.enum.defaultLibrary", { link = "@type.builtin" })
hi(0, "@lsp.typemod.enumMember.defaultLibrary", { link = "@constant.builtin" })
hi(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hi(0, "@lsp.typemod.keyword.async", { link = "@keyword.coroutine" })
hi(0, "@lsp.typemod.macro.defaultLibrary", { link = "@function.builtin" })
hi(0, "@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
hi(0, "@lsp.typemod.operator.injected", { link = "@operator" })
hi(0, "@lsp.typemod.string.injected", { link = "@string" })
hi(0, "@lsp.typemod.type.defaultLibrary", { link = "@type.builtin" })
hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hi(0, "@lsp.typemod.variable.injected", { link = "@variable" })
hi(0, "@method.call", { link = "Function" })
hi(0, "@method.call.php", { link = "Function" })
hi(0, "@method.php", { link = "Function" })
hi(0, "@namespace", { fg = "#b7bdf8", italic = true })
hi(0, "@number.css", { fg = "#f5a97f" })
hi(0, "@parameter", { fg = "#ee99a0" })
hi(0, "@property", { fg = "#b7bdf8" })
hi(0, "@property.class.css", { fg = "#eed49f" })
hi(0, "@property.cpp", { fg = "#cad3f5" })
hi(0, "@property.css", { fg = "#b7bdf8" })
hi(0, "@property.id.css", { fg = "#8aadf4" })
hi(0, "@property.toml", { fg = "#8aadf4" })
hi(0, "@property.typescript", { fg = "#b7bdf8" })
hi(0, "@punctuation.bracket", { fg = "#939ab7" })
hi(0, "@punctuation.delimiter", { link = "Delimiter" })
hi(0, "@punctuation.special", { link = "Special" })
hi(0, "@repeat", { link = "Repeat" })
hi(0, "@string.escape", { fg = "#f5bde6" })
hi(0, "@string.plain.css", { fg = "#f5a97f" })
hi(0, "@string.regex", { fg = "#f5a97f" })
hi(0, "@string.special", { link = "Special" })
hi(0, "@symbol", { fg = "#f0c6c6" })
hi(0, "@symbol.ruby", { fg = "#f0c6c6" })
hi(0, "@tag", { fg = "#c6a0f6" })
hi(0, "@tag.attribute", { fg = "#8bd5ca", italic = true })
hi(0, "@tag.attribute.tsx", { fg = "#c6a0f6", italic = true })
hi(0, "@tag.delimiter", { fg = "#91d7e3" })
hi(0, "@text", { fg = "#cad3f5" })
hi(0, "@text.danger", { bg = "#ed8796", fg = "#24273a" })
hi(0, "@text.diff.add", { link = "diffAdded" })
hi(0, "@text.diff.delete", { link = "diffRemoved" })
hi(0, "@text.emphasis", { fg = "#ee99a0", italic = true })
hi(0, "@text.environment", { fg = "#f5bde6" })
hi(0, "@text.environment.name", { fg = "#8aadf4" })
hi(0, "@text.literal", { fg = "#8bd5ca" })
hi(0, "@text.math", { fg = "#8aadf4" })
hi(0, "@text.note", { bg = "#8aadf4", fg = "#24273a" })
hi(0, "@text.reference", { link = "Tag" })
hi(0, "@text.strike", { fg = "#cad3f5", strikethrough = true })
hi(0, "@text.strong", { bold = true, fg = "#ee99a0" })
hi(0, "@text.title", { bold = true, fg = "#8aadf4" })
hi(0, "@text.todo", { bg = "#eed49f", fg = "#24273a" })
hi(0, "@text.todo.checked", { fg = "#a6da95" })
hi(0, "@text.todo.unchecked", { fg = "#8087a2" })
hi(0, "@text.underline", { link = "Underline" })
hi(0, "@text.uri", { fg = "#f4dbd6", italic = true, underline = true })
hi(0, "@text.warning", { bg = "#eed49f", fg = "#24273a" })
hi(0, "@type.builtin", { fg = "#eed49f" })
hi(0, "@type.builtin.c", { fg = "#eed49f" })
hi(0, "@type.builtin.cpp", { fg = "#eed49f" })
hi(0, "@type.css", { fg = "#b7bdf8" })
hi(0, "@type.definition", { link = "Type" })
hi(0, "@type.qualifier", { link = "Keyword" })
hi(0, "@type.tag.css", { fg = "#c6a0f6" })
hi(0, "@variable", { fg = "#cad3f5" })
hi(0, "@variable.builtin", { fg = "#ed8796" })
hi(0, "Bold", { bold = true })
hi(0, "ColorColumn", { bg = "#363a4f" })
hi(0, "Conceal", { fg = "#8087a2" })
hi(0, "Conditional", { fg = "#c6a0f6", italic = true })
hi(0, "Delimiter", { fg = "#939ab7" })

--
-- Diagnostic
--
hi(0, "DiagnosticWarn", { fg = "#eed49f", italic = true })
hi(0, "DiagnosticHint", { fg = "#8bd5ca", italic = true })
hi(0, "DiagnosticInfo", { fg = "#91d7e3", italic = true })
hi(0, "DiagnosticError", { fg = "#ed8796", italic = true })
hi(0, "DiagnosticOk", { fg = "#a6da95", italic = true })

--
-- Diagnistic floating window
--
hi(0, "DiagnosticFloatingError", { fg = "#ed8796" })
hi(0, "DiagnosticFloatingHint", { fg = "#8bd5ca" })
hi(0, "DiagnosticFloatingInfo", { fg = "#91d7e3" })
hi(0, "DiagnosticFloatingWarn", { fg = "#eed49f" })

--
-- Diagnostic signs
--
hi(0, "DiagnosticSignError", { fg = "#ed8796" })
hi(0, "DiagnosticSignHint", { fg = "#8bd5ca" })
hi(0, "DiagnosticSignInfo", { fg = "#91d7e3" })
hi(0, "DiagnosticSignWarn", { fg = "#eed49f" })

--
-- Diagnostic underline
--
hi(0, "DiagnosticUnderlineError", { sp = "#ed8796", underline = true })
hi(0, "DiagnosticUnderlineHint", { sp = "#8bd5ca", underline = true })
hi(0, "DiagnosticUnderlineInfo", { sp = "#91d7e3", underline = true })
hi(0, "DiagnosticUnderlineWarn", { sp = "#eed49f", underline = true })

--
-- Diagnostic virtual text
--
hi(0, "DiagnosticVirtualTextError", { bg = "#373043", fg = "#ed8796", italic = true })
hi(0, "DiagnosticVirtualTextHint", { bg = "#2e3848", fg = "#8bd5ca", italic = true })
hi(0, "DiagnosticVirtualTextInfo", { bg = "#2e384a", fg = "#91d7e3", italic = true })
hi(0, "DiagnosticVirtualTextWarn", { bg = "#373744", fg = "#eed49f", italic = true })

--
-- Diagnostic virtual line
--
hi(0, "DiagnosticVirtualLinesError", { bg = "#373043", fg = "#ed8796" })
hi(0, "DiagnosticVirtualLinesHint", { bg = "#2e3848", fg = "#8bd5ca" })
hi(0, "DiagnosticVirtualLinesInfo", { bg = "#2e384a", fg = "#91d7e3" })
hi(0, "DiagnosticVirtualLinesWarn", { bg = "#373744", fg = "#eed49f" })

--
-- Diff
--
hi(0, "DiffAdd", { bg = "#3b474a" })
hi(0, "DiffDelete", { bg = "#48384b", fg = "#1e2030" })
hi(0, "DiffChange", { fg = "#eed49f", bg = "#373744" }) -- MiniDiffOverContext
hi(0, "DiffText", { underline = true }) -- MiniDiffOverChange

-- hi(0, "DiffChange", { bg = "#303347", fg = "#6e738d" })
-- hi(0, "DiffText", { bg = "#434f72" })

hi(0, "Directory", { fg = "#8aadf4" })
hi(0, "EndOfBuffer", { fg = "#24273a" })
hi(0, "Exception", { fg = "#c6a0f6" })
hi(0, "FloatBorder", { fg = "#8aadf4" })
hi(0, "FloatTitle", { fg = "#a5adcb" })
hi(0, "FoldColumn", { link = "CursorLineNr" })
hi(0, "Folded", { bg = "#24273a", fg = "#8aadf4" })
hi(0, "GlyphPalette1", { fg = "#ed8796" })
hi(0, "GlyphPalette2", { fg = "#8bd5ca" })
hi(0, "GlyphPalette3", { fg = "#eed49f" })
hi(0, "GlyphPalette4", { fg = "#8aadf4" })
hi(0, "GlyphPalette6", { fg = "#8bd5ca" })
hi(0, "GlyphPalette7", { fg = "#cad3f5" })
hi(0, "GlyphPalette9", { fg = "#ed8796" })
hi(0, "IblIndent", { fg = "#363a4f" })
hi(0, "IblScope", { fg = "#cad3f5" })
hi(0, "IlluminatedWordRead", { bg = "#3e4257" })
hi(0, "IlluminatedWordText", { bg = "#3e4257" })
hi(0, "IlluminatedWordWrite", { bg = "#3e4257" })
hi(0, "Include", { fg = "#c6a0f6" })
hi(0, "Italic", { italic = true })
hi(0, "Keyword", { fg = "#c6a0f6" })
hi(0, "Label", { fg = "#7dc4e4" })
hi(0, "LineNr", { fg = "#494d64" })
hi(0, "LspCodeLens", { fg = "#6e738d" })
hi(0, "LspDiagnosticsDefaultError", { fg = "#ed8796" })
hi(0, "LspDiagnosticsDefaultHint", { fg = "#8bd5ca" })
hi(0, "LspDiagnosticsDefaultInformation", { fg = "#91d7e3" })
hi(0, "LspDiagnosticsDefaultWarning", { fg = "#eed49f" })
hi(0, "LspDiagnosticsError", { fg = "#ed8796" })
hi(0, "LspDiagnosticsHint", { fg = "#8bd5ca" })
hi(0, "LspDiagnosticsInformation", { fg = "#91d7e3" })
hi(0, "LspDiagnosticsUnderlineError", { sp = "#ed8796", underline = true })
hi(0, "LspDiagnosticsUnderlineHint", { sp = "#8bd5ca", underline = true })
hi(0, "LspDiagnosticsUnderlineInformation", { sp = "#91d7e3", underline = true })
hi(0, "LspDiagnosticsUnderlineWarning", { sp = "#eed49f", underline = true })
hi(0, "LspDiagnosticsVirtualTextError", { fg = "#ed8796", italic = true })
hi(0, "LspDiagnosticsVirtualTextHint", { fg = "#8bd5ca", italic = true })
hi(0, "LspDiagnosticsVirtualTextInformation", { fg = "#91d7e3", italic = true })
hi(0, "LspDiagnosticsVirtualTextWarning", { fg = "#eed49f", italic = true })
hi(0, "LspDiagnosticsWarning", { fg = "#eed49f", blend = 50 })
hi(0, "LspInfoBorder", { link = "FloatBorder" })
-- hi(0, "LspInlayHint", { bg = "#303347", fg = "#6e738d" })
hi(0, "LspInlayHint", { fg = "#6e738d" })
hi(0, "LspReferenceRead", { bg = "#494d64" })
hi(0, "LspReferenceText", { bg = "#494d64" })
hi(0, "LspReferenceWrite", { bg = "#494d64" })
hi(0, "LspSignatureActiveParameter", { fg = "#f5a97f" })
hi(0, "Macro", { fg = "#c6a0f6" })
hi(0, "MiniClueDescGroup", { fg = "#ed8796" })
hi(0, "MiniFilesBorderModified", { fg = "#ed8796" })
hi(0, "MiniPickMatchRanges", { link = "String" })
hi(0, "MiniPickNormal", { link = "Comment" })
hi(0, "MiniPickPrompt", { link = "Normal" })
hi(0, "MiniNotifyBorder", { fg = "#c6a0f6" })
hi(0, "MiniNotifyNormal", { link = "Comment" })
hi(0, "ModeMsg", { bold = true, fg = "#cad3f5" })
hi(0, "MsgSeparator", {})
hi(0, "NonText", { fg = "#494d64" })
hi(0, "Normal", { bg = "#24273a", fg = "#cad3f5" })
hi(0, "NormalFloat", { bg = "#24273a", fg = "#cad3f5" })
hi(0, "NormalNC", { bg = "#24273a", fg = "#cad3f5" })
hi(0, "NormalSB", { bg = "#181926", fg = "#cad3f5" })
hi(0, "NvimTreeEmptyFolderName", { fg = "#8aadf4" })
hi(0, "NvimTreeFolderIcon", { fg = "#8aadf4" })
hi(0, "NvimTreeFolderName", { fg = "#8aadf4" })
hi(0, "NvimTreeGitDeleted", { fg = "#ed8796" })
hi(0, "NvimTreeGitDirty", { fg = "#eed49f" })
hi(0, "NvimTreeGitNew", { fg = "#8aadf4" })
hi(0, "NvimTreeImageFile", { fg = "#cad3f5" })
hi(0, "NvimTreeIndentMarker", { fg = "#6e738d" })
hi(0, "NvimTreeNormal", { bg = "#1e2030", fg = "#cad3f5" })
hi(0, "NvimTreeOpenedFile", { fg = "#f5bde6" })
hi(0, "NvimTreeOpenedFolderName", { fg = "#8aadf4" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#b7bdf8" })
hi(0, "NvimTreeSpecialFile", { fg = "#f0c6c6" })
hi(0, "NvimTreeStatuslineNc", { bg = "#1e2030", fg = "#1e2030" })
hi(0, "NvimTreeSymlink", { fg = "#f5bde6" })
hi(0, "NvimTreeWinSeparator", { bg = "#24273a", fg = "#24273a" })
hi(0, "Operator", { fg = "#91d7e3" })
hi(0, "Pmenu", { bg = "#303347", fg = "#939ab7" })
hi(0, "PmenuSbar", { bg = "#494d64" })
hi(0, "PmenuSel", { bg = "#494d64", bold = true })
hi(0, "PmenuThumb", { bg = "#6e738d" })
hi(0, "PreProc", { fg = "#f5bde6" })
hi(0, "QuickFixLine", { bg = "#494d64", bold = true })
hi(0, "RainbowBlue", { blend = 0, fg = "#8aadf4" })
hi(0, "RainbowCyan", { blend = 0, fg = "#8bd5ca" })
hi(0, "RainbowDelimiterBlue", { fg = "#8aadf4" })
hi(0, "RainbowDelimiterCyan", { fg = "#8bd5ca" })
hi(0, "RainbowDelimiterGreen", { fg = "#a6da95" })
hi(0, "RainbowDelimiterOrange", { fg = "#f5a97f" })
hi(0, "RainbowDelimiterRed", { fg = "#ed8796" })
hi(0, "RainbowDelimiterViolet", { fg = "#c6a0f6" })
hi(0, "RainbowDelimiterYellow", { fg = "#eed49f" })
hi(0, "RainbowGreen", { blend = 0, fg = "#a6da95" })
hi(0, "RainbowOrange", { blend = 0, fg = "#f5a97f" })
hi(0, "RainbowRed", { blend = 0, fg = "#ed8796" })
hi(0, "RainbowViolet", { blend = 0, fg = "#c6a0f6" })
hi(0, "RainbowYellow", { blend = 0, fg = "#eed49f" })
hi(0, "Repeat", { fg = "#c6a0f6" })
hi(0, "SignColumn", { fg = "#494d64" })
hi(0, "SignColumnSB", { bg = "#181926", fg = "#494d64" })
hi(0, "Special", { fg = "#f5bde6" })
hi(0, "SpecialKey", { link = "NonText" })
hi(0, "Statement", { fg = "#c6a0f6" })
hi(0, "StatusLine", { bg = "#24273a", fg = "#24273a" })
hi(0, "StatusLineNC", { bg = "#1e2030", fg = "#494d64" })
hi(0, "StorageClass", { fg = "#eed49f" })
hi(0, "Structure", { fg = "#eed49f" })
hi(0, "Substitute", { bg = "#494d64", fg = "#f5bde6" })
hi(0, "TabLine", { bg = "#24273a", fg = "#5b6078" })
hi(0, "TabLineFill", {})
hi(0, "TabLineSel", { bg = "#24273a" })
hi(0, "Tag", { bold = true, fg = "#b7bdf8" })
hi(0, "TelescopeBorder", { fg = "#8aadf4" })
hi(0, "TelescopeMatching", { fg = "#a6da95" })
hi(0, "TelescopeNormal", { fg = "#5b6078" })
hi(0, "TelescopePromptPrefix", { fg = "#8aadf4" })
hi(0, "TelescopePromptTitle", { fg = "#a6da95" })
hi(0, "TelescopeSelection", { bg = "#24273a", bold = true, fg = "#cad3f5" })
hi(0, "TelescopeSelectionCaret", { fg = "#ed8796" })
hi(0, "Title", { bold = true, fg = "#8aadf4" })
hi(0, "Todo", { bg = "#eed49f", bold = true, fg = "#24273a" })
hi(0, "Type", { fg = "#eed49f" })
hi(0, "UfoFoldedEllipsis", { bg = "#8aadf4", fg = "#181926" })
hi(0, "UfoFoldedFg", { fg = "#b7bdf8" })
hi(0, "VertSplit", { fg = "#181926" })
hi(0, "Visual", { bg = "#494d64", bold = true })
hi(0, "VisualNOS", { bg = "#494d64", bold = true })
hi(0, "WarningMsg", { fg = "#eed49f" })
hi(0, "Whitespace", { fg = "#494d64" })
hi(0, "WildMenu", { bg = "#6e738d" })
hi(0, "WinBar", { fg = "#f4dbd6" })
hi(0, "WinBarNC", { link = "WinBar" })
hi(0, "WinSeparator", { fg = "#181926" })
hi(0, "debugBreakpoint", { bg = "#24273a", fg = "#6e738d" })
hi(0, "debugPC", { bg = "#181926" })
hi(0, "diffAdded", { fg = "#a6da95" })
hi(0, "diffChanged", { fg = "#8aadf4" })
hi(0, "diffFile", { fg = "#8aadf4" })
hi(0, "diffIndexLine", { fg = "#8bd5ca" })
hi(0, "diffLine", { fg = "#6e738d" })
hi(0, "diffNewFile", { fg = "#f5a97f" })
hi(0, "diffOldFile", { fg = "#eed49f" })
hi(0, "diffRemoved", { fg = "#ed8796" })
hi(0, "gitcommitSummary", { fg = "#f4dbd6", italic = true })
hi(0, "healthError", { fg = "#ed8796" })
hi(0, "healthSuccess", { fg = "#8bd5ca" })
hi(0, "healthWarning", { fg = "#eed49f" })
hi(0, "htmlH1", { bold = true, fg = "#f5bde6" })
hi(0, "htmlH2", { bold = true, fg = "#8aadf4" })
hi(0, "illuminatedCurWord", { bg = "#494d64" })
hi(0, "illuminatedWord", { bg = "#494d64" })
hi(0, "lCursor", { bg = "#cad3f5", fg = "#24273a" })
hi(0, "markdownCode", { fg = "#f0c6c6" })
hi(0, "markdownCodeBlock", { fg = "#f0c6c6" })
hi(0, "markdownH1", { link = "rainbow1" })
hi(0, "markdownH2", { link = "rainbow2" })
hi(0, "markdownH3", { link = "rainbow3" })
hi(0, "markdownH4", { link = "rainbow4" })
hi(0, "markdownH5", { link = "rainbow5" })
hi(0, "markdownH6", { link = "rainbow6" })
hi(0, "markdownHeadingDelimiter", { bold = true, fg = "#f5a97f" })
hi(0, "markdownLinkText", { fg = "#8aadf4", underline = true })
hi(0, "mkdCodeDelimiter", { bg = "#24273a", fg = "#cad3f5" })
hi(0, "mkdCodeEnd", { bold = true, fg = "#f0c6c6" })
hi(0, "mkdCodeStart", { bold = true, fg = "#f0c6c6" })
hi(0, "qfFileName", { fg = "#8aadf4" })
hi(0, "qfLineNr", { fg = "#eed49f" })
hi(0, "rainbow1", { fg = "#ed8796" })
hi(0, "rainbow2", { fg = "#f5a97f" })
hi(0, "rainbow3", { fg = "#eed49f" })
hi(0, "rainbow4", { fg = "#a6da95" })
hi(0, "rainbow5", { fg = "#7dc4e4" })
hi(0, "rainbow6", { fg = "#b7bdf8" })
hi(0, "zshKSHFunction", { link = "Function" })

--
-- LSP
--
hi(0, "@lsp.type.parameter.dockerfile", { link = "Normal" })
hi(0, "@lsp.typemod.function.readonly.vue", { link = "Function" })

--
-- Spell
--
hi(0, "SpellBad", { fg = "#ed8796", undercurl = true, italic = true })
hi(0, "SpellCap", { fg = "#eed49f", undercurl = true })
hi(0, "SpellLocal", { fg = "#8aadf4", undercurl = true })
hi(0, "SpellRare", { fg = "#a6da95", undercurl = true, italic = true })

--
-- Plugins
--

--
-- mini.hipatterns
--
hi(0, "MiniHipatternsTodo", { fg = "#eed49f" })
hi(0, "MiniHipatternsNote", { fg = "#8aadf4" })
hi(0, "MiniHipatternsFixme", { fg = "#ed8796" })
hi(0, "MiniHipatternsDeprecate", { fg = "#f5a97f" })

--
-- mini.indentscope
--
hi(0, "MiniIndentscopeSymbol", { link = "NonText" })

--
-- mini.icons
--
hi(0, "MiniIconsAzure", { fg = "#8aadf4" })
hi(0, "MiniIconsBlue", { fg = "#8aadf4" })
hi(0, "MiniIconsCyan", { fg = "#8aadf4" })
hi(0, "MiniIconsGreen", { fg = "#a6da95" })

hi(0, "MiniIconsPurple", { fg = "#b7bdf8" })
hi(0, "MiniIconsOrange", { fg = "#f5a97f" })
hi(0, "MiniIconsRed", { fg = "#ed8796" })
hi(0, "MiniIconsYellow", { fg = "#eed49f" })

--
-- mini.tabline
--
hi(0, "MiniTablineCurrent", { link = "TabLineSel" })
hi(0, "MiniTablineModifiedCurrent", { fg = "#ed8796", bg = "#373043" })
hi(0, "MiniTablineModifiedHidden", { fg = "#f5a97f", bg = "#373744" })
hi(0, "MiniTablineModifiedVisible", { fg = "#f5a97f", bg = "#373744" })
hi(0, "MiniTablineVisible", { link = "TabLine" })

--
-- mini.jump
--
hi(0, "MiniJump", { bg = "#373744", fg = "#eed49f", underline = true })

--
-- treesitter-context
--
hi(0, "TreesitterContextSeparator", { fg = "#8aadf4" })

--
-- Filetypes
--

--
-- Markdown
--
hi(0, "@markup.heading.1.markdown", { fg = "#ed8796" })
hi(0, "@markup.heading.2.markdown", { fg = "#f5a97f" })
hi(0, "@markup.heading.3.markdown", { fg = "#eed49f" })
hi(0, "@markup.heading.4.markdown", { fg = "#a6da95" })
hi(0, "@markup.heading.5.markdown", { fg = "#b7bdf8" })
hi(0, "@markup.heading.6.markdown", { fg = "#7dc4e4" })

hi(0, "@markup.italic.markdown_inline", { fg = "#f5a97f", italic = true })
hi(0, "@markup.strong.markdown_inline", { fg = "#ed8796", bold = true })
