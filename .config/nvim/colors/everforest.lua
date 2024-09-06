-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end
vim.g.colors_name = "everforest-chad"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@annotation", { fg = "#c85552" })
hi(0, "@attribute", { fg = "#8da101" })
hi(0, "@attribute.builtin", { link = "Special" })
hi(0, "@character", { fg = "#5f9b93" })
hi(0, "@character.special", { link = "SpecialChar" })
hi(0, "@comment", { fg = "#a39d8c" })
hi(0, "@comment.danger", { bg = "#c85552", fg = "#f0ead9" })
hi(0, "@comment.error", { link = "DiagnosticError" })
hi(0, "@comment.note", { bg = "#272f35", fg = "#f0ead9" })
hi(0, "@comment.todo", { bg = "#272f35", fg = "#b3ad9c" })
hi(0, "@comment.warning", { bg = "#b67996", fg = "#f0ead9" })
hi(0, "@constant", { fg = "#5f9b93" })
hi(0, "@constant.builtin", { fg = "#b67996" })
hi(0, "@constant.macro", { fg = "#5f9b93" })
hi(0, "@constructor", { fg = "#3a94c5" })
hi(0, "@definition", { sp = "#ddd7c6", underline = true })
hi(0, "@diff.delta", { fg = "#857f6e" })
hi(0, "@diff.minus", { fg = "#c85552" })
hi(0, "@diff.plus", { fg = "#5da111" })
hi(0, "@error", { fg = "#5f9b93" })
hi(0, "@function", { fg = "#87a060" })
hi(0, "@function.builtin", { fg = "#87a060" })
hi(0, "@function.call", { fg = "#87a060" })
hi(0, "@function.macro", { fg = "#5f9b93" })
hi(0, "@function.method", { fg = "#87a060" })
hi(0, "@function.method.call", { fg = "#87a060" })
hi(0, "@ibl.indent.char.1", { fg = "#e8e2d1", nocombine = true })
hi(0, "@ibl.scope.char.1", { fg = "#b3ad9c", nocombine = true })
hi(0, "@ibl.scope.underline.1", { sp = "#b3ad9c", underline = true })
hi(0, "@ibl.whitespace.char.1", { fg = "#e5dfce" })
hi(0, "@keyword", { fg = "#c85552" })
hi(0, "@keyword.conditional", { fg = "#c85552" })
hi(0, "@keyword.conditional.ternary", { fg = "#c85552" })
hi(0, "@keyword.directive", { fg = "#8da101" })
hi(0, "@keyword.directive.define", { fg = "#c85552" })
hi(0, "@keyword.exception", { fg = "#5f9b93" })
hi(0, "@keyword.function", { fg = "#c85552" })
hi(0, "@keyword.import", { fg = "#87a060" })
hi(0, "@keyword.operator", { fg = "#c85552" })
hi(0, "@keyword.repeat", { fg = "#8da101" })
hi(0, "@keyword.return", { fg = "#c85552" })
hi(0, "@keyword.storage", { fg = "#8da101" })
hi(0, "@lsp.mod.deprecated", { link = "DiagnosticDeprecated" })
hi(0, "@lsp.type.class", { link = "@type" })
hi(0, "@lsp.type.comment", { link = "@comment" })
hi(0, "@lsp.type.decorator", { link = "@attribute" })
hi(0, "@lsp.type.enum", { link = "@type" })
hi(0, "@lsp.type.enumMember", { link = "@constant" })
hi(0, "@lsp.type.event", { link = "@type" })
hi(0, "@lsp.type.function", { link = "@function" })
hi(0, "@lsp.type.interface", { link = "@type" })
hi(0, "@lsp.type.keyword", { link = "@keyword" })
hi(0, "@lsp.type.macro", { link = "@constant.macro" })
hi(0, "@lsp.type.method", { link = "@function.method" })
hi(0, "@lsp.type.modifier", { link = "@type.qualifier" })
hi(0, "@lsp.type.namespace", { link = "@module" })
hi(0, "@lsp.type.number", { link = "@number" })
hi(0, "@lsp.type.operator", { link = "@operator" })
hi(0, "@lsp.type.parameter", { link = "@variable.parameter" })
hi(0, "@lsp.type.property", { link = "@property" })
hi(0, "@lsp.type.regexp", { link = "@string.regexp" })
hi(0, "@lsp.type.string", { link = "@string" })
hi(0, "@lsp.type.struct", { link = "@type" })
hi(0, "@lsp.type.type", { link = "@type" })
hi(0, "@lsp.type.typeParameter", { link = "@type.definition" })
hi(0, "@lsp.type.variable", { link = "@variable" })
hi(0, "@markup.heading", { fg = "#87a060" })
hi(0, "@markup.link", { fg = "#5f9b93" })
hi(0, "@markup.link.label", { fg = "#ef615e" })
hi(0, "@markup.link.url", { fg = "#b67996", underline = true })
hi(0, "@markup.list", { fg = "#5f9b93" })
hi(0, "@markup.quote", { bg = "#f0ead9" })
hi(0, "@markup.raw", { fg = "#b67996" })
hi(0, "@module", { fg = "#5f9b93" })
hi(0, "@module.builtin", { link = "Special" })
hi(0, "@number", { fg = "#b67996" })
hi(0, "@number.float", { fg = "#b67996" })
hi(0, "@operator", { fg = "#495157" })
hi(0, "@parenthesis", { link = "@punctuation.bracket" })
hi(0, "@property", { fg = "#5f9b93" })
hi(0, "@punctuation.bracket", { fg = "#c85552" })
hi(0, "@punctuation.delimiter", { fg = "#c85552" })
hi(0, "@punctuation.special", { link = "Special" })
hi(0, "@reference", { fg = "#495157" })
hi(0, "@scope", { bold = true })
hi(0, "@string", { fg = "#d59600" })
hi(0, "@string.escape", { fg = "#ef615e" })
hi(0, "@string.regex", { fg = "#ef615e" })
hi(0, "@string.regexp", { link = "@string.special" })
hi(0, "@string.special", { link = "SpecialChar" })
hi(0, "@string.special.url", { fg = "#879a39" })
hi(0, "@symbol", { fg = "#d59600" })
hi(0, "@tag", { fg = "#f7954f" })
hi(0, "@tag.attribute", { fg = "#5f9b93" })
hi(0, "@tag.builtin", { link = "Special" })
hi(0, "@tag.delimiter", { fg = "#c85552" })
hi(0, "@text", { fg = "#495157" })
hi(0, "@text.emphasis", { fg = "#b67996" })
hi(0, "@text.strike", { fg = "#c85552", strikethrough = true })
hi(0, "@type.builtin", { fg = "#8da101" })
hi(0, "@variable", { fg = "#495157" })
hi(0, "@variable.builtin", { fg = "#b67996" })
hi(0, "@variable.member", { fg = "#495157" })
hi(0, "@variable.member.key", { fg = "#5f9b93" })
hi(0, "@variable.parameter", { fg = "#5f9b93" })
hi(0, "@variable.parameter.builtin", { link = "Special" })
hi(0, "Bold", { bold = true })
hi(0, "Boolean", { fg = "#b67996" })
hi(0, "Character", { fg = "#5f9b93" })
hi(0, "CmpBorder", { fg = "#a39d8c" })
hi(0, "CmpDoc", { bg = "#f5efde" })
hi(0, "CmpDocBorder", { bg = "#f5efde", fg = "#f5efde" })
hi(0, "CmpItemAbbr", { fg = "#272f35" })
hi(0, "CmpItemAbbrDeprecatedDefault", { fg = "#565c64" })
hi(0, "CmpItemAbbrMatch", { bold = true, fg = "#3a94c5" })
hi(0, "CmpItemKindClass", { fg = "#69a59d" })
hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindCodeium", { fg = "#87a060" })
hi(0, "CmpItemKindColor", { fg = "#272f35" })
hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstant", { fg = "#b67996" })
hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstructor", { fg = "#3a94c5" })
hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindCopilot", { fg = "#5da111" })
hi(0, "CmpItemKindDefault", { fg = "#56b6c2" })
hi(0, "CmpItemKindEnum", { fg = "#3a94c5" })
hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEnumMember", { fg = "#b67996" })
hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEvent", { fg = "#dfa000" })
hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindField", { fg = "#5f9b93" })
hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFile", { fg = "#272f35" })
hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFolder", { fg = "#272f35" })
hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFunction", { fg = "#87a060" })
hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindIdentifier", { fg = "#5f9b93" })
hi(0, "CmpItemKindInterface", { fg = "#5da111" })
hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindKeyword", { fg = "#272f35" })
hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindMethod", { fg = "#87a060" })
hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindModule", { fg = "#8da101" })
hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindOperator", { fg = "#495157" })
hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindProperty", { fg = "#5f9b93" })
hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindReference", { fg = "#495157" })
hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindSnippet", { fg = "#c85552" })
hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStruct", { fg = "#c85552" })
hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStructure", { fg = "#c85552" })
hi(0, "CmpItemKindTabNine", { fg = "#ce8196" })
hi(0, "CmpItemKindText", { fg = "#d59600" })
hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindType", { fg = "#8da101" })
hi(0, "CmpItemKindTypeParameter", { fg = "#5f9b93" })
hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindUnit", { fg = "#c85552" })
hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindValue", { fg = "#89bfdc" })
hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindVariable", { fg = "#c85552" })
hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
hi(0, "CmpPmenu", { bg = "#fff9e8" })
hi(0, "CmpSel", { bg = "#5f9b93", fg = "#fff9e8" })
hi(0, "ColorColumn", { bg = "#f0ead9" })
hi(0, "Comment", { fg = "#a39d8c" })
hi(0, "Conceal", {})
hi(0, "Conditional", { fg = "#c85552" })
hi(0, "Constant", { fg = "#5f9b93" })
hi(0, "Cursor", { bg = "#495157", fg = "#fff9e8" })
hi(0, "CursorColumn", { bg = "#f6f0df" })
hi(0, "CursorLine", { bg = "#f0ead9" })
hi(0, "CursorLineNr", { fg = "#272f35" })
hi(0, "Debug", { fg = "#5f9b93" })
hi(0, "Define", { fg = "#c85552" })
hi(0, "Delimiter", { fg = "#c85552" })
hi(0, "DiagnosticError", { fg = "#c85552" })
hi(0, "DiagnosticHint", { fg = "#b67996" })
hi(0, "DiagnosticInfo", { fg = "#5da111" })
hi(0, "DiagnosticWarn", { fg = "#dfa000" })
hi(0, "DiffAdd", { fg = "#5da111" })
hi(0, "DiffAdded", { fg = "#5da111" })
hi(0, "DiffChange", { fg = "#857f6e" })
hi(0, "DiffChangeDelete", { fg = "#c85552" })
hi(0, "DiffDelete", { fg = "#c85552" })
hi(0, "DiffModified", { fg = "#f7954f" })
hi(0, "DiffRemoved", { fg = "#c85552" })
hi(0, "DiffText", { bg = "#f0ead9", fg = "#272f35" })
hi(0, "Directory", { fg = "#87a060" })
hi(0, "Error", { bg = "#5f9b93", fg = "#fff9e8" })
hi(0, "ErrorMsg", { bg = "#fff9e8", fg = "#5f9b93" })
hi(0, "Exception", { fg = "#5f9b93" })
hi(0, "Float", { fg = "#b67996" })
hi(0, "FloatBorder", { fg = "#3a94c5" })
hi(0, "FoldColumn", { bg = "#f6f0df", fg = "#ef615e" })
hi(0, "Folded", { bg = "#f0ead9", fg = "#857f6e" })
hi(0, "Function", { fg = "#87a060" })
hi(0, "GitSignsStagedAdd", { fg = "#597b60" })
hi(0, "GitSignsStagedAddLn", { fg = "#305777" })
hi(0, "GitSignsStagedAddNr", { fg = "#597b60" })
hi(0, "GitSignsStagedChange", { fg = "#467c7b" })
hi(0, "GitSignsStagedChangeLn", { fg = "#37393d" })
hi(0, "GitSignsStagedChangeNr", { fg = "#467c7b" })
hi(0, "GitSignsStagedChangedelete", { fg = "#467c7b" })
hi(0, "GitSignsStagedChangedeleteLn", { fg = "#37393d" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#467c7b" })
hi(0, "GitSignsStagedDelete", { fg = "#7f605c" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#7f605c" })
hi(0, "GitSignsStagedTopdelete", { fg = "#7f605c" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#7f605c" })
hi(0, "IblChar", { fg = "#e8e2d1" })
hi(0, "IblIndent", { link = "NonText" })
hi(0, "IblScope", { fg = "#42464e" })
hi(0, "IblScopeChar", { fg = "#b3ad9c" })
hi(0, "IblWhitespace", { link = "NonText" })
hi(0, "Identifier", { fg = "#5f9b93" })
hi(0, "IncSearch", { bg = "#b67996", fg = "#f6f0df" })
hi(0, "Include", { fg = "#87a060" })
hi(0, "Italic", { italic = true })
hi(0, "Keyword", { fg = "#c85552" })
hi(0, "Label", { fg = "#8da101" })
hi(0, "LazyButton", { bg = "#e0dac9", fg = "#9d9788" })
hi(0, "LazyCommit", { fg = "#5da111" })
hi(0, "LazyCommitIssue", { fg = "#ef6590" })
hi(0, "LazyDir", { fg = "#495157" })
hi(0, "LazyH1", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "LazyH2", { bold = true, fg = "#c85552", underline = true })
hi(0, "LazyNoCond", { fg = "#c85552" })
hi(0, "LazyOperator", { fg = "#272f35" })
hi(0, "LazyProgressDone", { fg = "#5da111" })
hi(0, "LazyReasonCmd", { fg = "#d1b171" })
hi(0, "LazyReasonEvent", { fg = "#dfa000" })
hi(0, "LazyReasonFt", { fg = "#b67996" })
hi(0, "LazyReasonImport", { fg = "#272f35" })
hi(0, "LazyReasonKeys", { fg = "#69a59d" })
hi(0, "LazyReasonPlugin", { fg = "#c85552" })
hi(0, "LazyReasonRuntime", { fg = "#656c5f" })
hi(0, "LazyReasonSource", { fg = "#89bfdc" })
hi(0, "LazyReasonStart", { fg = "#272f35" })
hi(0, "LazySpecial", { fg = "#3a94c5" })
hi(0, "LazyTaskOutput", { fg = "#272f35" })
hi(0, "LazyUrl", { fg = "#495157" })
hi(0, "LazyValue", { fg = "#69a59d" })
hi(0, "LineNr", { fg = "#b3ad9c" })
hi(0, "LspInlayHint", { bg = "#efe9d9", fg = "#857f6e" })
hi(0, "LspReferenceRead", { bg = "#272f35", fg = "#f5efde" })
hi(0, "LspReferenceText", { bg = "#272f35", fg = "#f5efde" })
hi(0, "LspReferenceWrite", { bg = "#272f35", fg = "#f5efde" })
hi(0, "LspSignatureActiveParameter", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "Macro", { fg = "#5f9b93" })
hi(0, "MasonHeader", { bg = "#c85552", fg = "#fff9e8" })
hi(0, "MasonHeaderSecondary", { link = "MasonHighlightBlock" })
hi(0, "MasonHighlight", { fg = "#3a94c5" })
hi(0, "MasonHighlightBlock", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "MasonHighlightBlockBold", { link = "MasonHighlightBlock" })
hi(0, "MasonMuted", { fg = "#857f6e" })
hi(0, "MasonMutedBlock", { bg = "#e0dac9", fg = "#857f6e" })
hi(0, "MatchParen", { link = "MatchWord" })
hi(0, "MatchWord", { bg = "#b3ad9c", fg = "#272f35" })
hi(0, "ModeMsg", { fg = "#d59600" })
hi(0, "MoreMsg", { fg = "#d59600" })
hi(0, "NonText", { fg = "#e5dfce" })
hi(0, "Normal", { bg = "#fff9e8", fg = "#495157" })
hi(0, "NormalFloat", { bg = "#f5efde" })
hi(0, "Number", { fg = "#b67996" })
hi(0, "NvChAsciiHeader", { fg = "#3a94c5" })
hi(0, "NvChHeadbaby_pink", { bg = "#ce8196", fg = "#fff9e8" })
hi(0, "NvChHeadblue", { bg = "#3a94c5", fg = "#fff9e8" })
hi(0, "NvChHeadcyan", { bg = "#89bfdc", fg = "#fff9e8" })
hi(0, "NvChHeadgreen", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "NvChHeading", { bg = "#3a94c5", bold = true, fg = "#fff9e8" })
hi(0, "NvChHeadorange", { bg = "#f7954f", fg = "#fff9e8" })
hi(0, "NvChHeadpurple", { bg = "#b67996", fg = "#fff9e8" })
hi(0, "NvChHeadred", { bg = "#c85552", fg = "#fff9e8" })
hi(0, "NvChHeadteal", { bg = "#69a59d", fg = "#fff9e8" })
hi(0, "NvChHeadvibrant_green", { bg = "#87a060", fg = "#fff9e8" })
hi(0, "NvChHeadwhite", { bg = "#272f35", fg = "#fff9e8" })
hi(0, "NvChHeadyellow", { bg = "#dfa000", fg = "#fff9e8" })
hi(0, "NvChSection", { bg = "#f0ead9" })
hi(0, "NvDashAscii", { bg = "#3a94c5", fg = "#fff9e8" })
hi(0, "NvDashButtons", { bg = "#f0ead9", fg = "#272f35" })
hi(0, "NvimInternalError", { fg = "#c85552" })
hi(0, "NvimTreeCursorLine", { bg = "#f0ead9" })
hi(0, "NvimTreeEmptyFolderName", { fg = "#747b6e" })
hi(0, "NvimTreeEndOfBuffer", { fg = "#f5efde" })
hi(0, "NvimTreeFolderArrowClosed", { fg = "#a39d8c" })
hi(0, "NvimTreeFolderArrowOpen", { fg = "#747b6e" })
hi(0, "NvimTreeFolderIcon", { fg = "#747b6e" })
hi(0, "NvimTreeFolderName", { fg = "#4e565c" })
hi(0, "NvimTreeGitDeleted", { fg = "#c85552" })
hi(0, "NvimTreeGitDirty", { fg = "#c85552" })
hi(0, "NvimTreeGitIgnored", { fg = "#857f6e" })
hi(0, "NvimTreeGitNew", { fg = "#dfa000" })
hi(0, "NvimTreeIndentMarker", { fg = "#d1cbba" })
hi(0, "NvimTreeNormal", { bg = "#f5efde" })
hi(0, "NvimTreeNormalNC", { bg = "#f5efde" })
hi(0, "NvimTreeOpenedFolderName", { fg = "#747b6e" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#c85552" })
hi(0, "NvimTreeSpecialFile", { bold = true, fg = "#dfa000" })
hi(0, "NvimTreeWinSeparator", { bg = "#f5efde", fg = "#f5efde" })
hi(0, "NvimTreeWindowPicker", { bg = "#f0ead9", fg = "#c85552" })
hi(0, "Operator", { fg = "#495157" })
hi(0, "Pmenu", { bg = "#f0ead9" })
hi(0, "PmenuSbar", { bg = "#e0dac9" })
hi(0, "PmenuSel", { bg = "#5f9b93", fg = "#fff9e8" })
hi(0, "PmenuThumb", { bg = "#b3ad9c" })
hi(0, "PreProc", { fg = "#8da101" })
hi(0, "Question", { fg = "#87a060" })
hi(0, "QuickFixLine", { bg = "#f6f0df" })
hi(0, "RenamerBorder", { fg = "#c85552" })
hi(0, "RenamerTitle", { bg = "#c85552", fg = "#fff9e8" })
hi(0, "Repeat", { fg = "#8da101" })
hi(0, "Search", { bg = "#8da101", fg = "#f6f0df" })
hi(0, "SignColumn", { fg = "#e5dfce" })
hi(0, "Special", { fg = "#ef615e" })
hi(0, "SpecialChar", { fg = "#c85552" })
hi(0, "SpecialKey", { fg = "#e5dfce" })
hi(0, "SpellBad", { sp = "#5f9b93", undercurl = true })
hi(0, "SpellCap", { sp = "#87a060", undercurl = true })
hi(0, "SpellLocal", { sp = "#ef615e", undercurl = true })
hi(0, "SpellRare", { sp = "#c85552", undercurl = true })
hi(0, "St_CommandMode", { bg = "#5da111", bold = true, fg = "#fff9e8" })
hi(0, "St_CommandModeSep", { bg = "#b3ad9c", fg = "#5da111" })
hi(0, "St_ConfirmMode", { bg = "#69a59d", bold = true, fg = "#fff9e8" })
hi(0, "St_ConfirmModeSep", { bg = "#b3ad9c", fg = "#69a59d" })
hi(0, "St_EmptySpace", { bg = "#d3cdbc", fg = "#b3ad9c" })
hi(0, "St_InsertMode", { bg = "#966986", bold = true, fg = "#fff9e8" })
hi(0, "St_InsertModeSep", { bg = "#b3ad9c", fg = "#966986" })
hi(0, "St_Lsp", { bg = "#ede7d6", fg = "#656c5f" })
hi(0, "St_LspHints", { bg = "#ede7d6", fg = "#b67996" })
hi(0, "St_LspInfo", { bg = "#ede7d6", fg = "#5da111" })
hi(0, "St_LspMsg", { bg = "#ede7d6", fg = "#5da111" })
hi(0, "St_NTerminalMode", { bg = "#dfa000", bold = true, fg = "#fff9e8" })
hi(0, "St_NTerminalModeSep", { bg = "#b3ad9c", fg = "#dfa000" })
hi(0, "St_NormalMode", { bg = "#656c5f", bold = true, fg = "#fff9e8" })
hi(0, "St_NormalModeSep", { bg = "#b3ad9c", fg = "#656c5f" })
hi(0, "St_ReplaceMode", { bg = "#f7954f", bold = true, fg = "#fff9e8" })
hi(0, "St_ReplaceModeSep", { bg = "#b3ad9c", fg = "#f7954f" })
hi(0, "St_SelectMode", { bg = "#3a94c5", bold = true, fg = "#fff9e8" })
hi(0, "St_SelectModeSep", { bg = "#b3ad9c", fg = "#3a94c5" })
hi(0, "St_TerminalMode", { bg = "#5da111", bold = true, fg = "#fff9e8" })
hi(0, "St_TerminalModeSep", { bg = "#b3ad9c", fg = "#5da111" })
hi(0, "St_VisualMode", { bg = "#89bfdc", bold = true, fg = "#fff9e8" })
hi(0, "St_VisualModeSep", { bg = "#b3ad9c", fg = "#89bfdc" })
hi(0, "St_cwd_icon", { bg = "#c85552", fg = "#e0dac9" })
hi(0, "St_cwd_sep", { bg = "#ede7d6", fg = "#c85552" })
hi(0, "St_cwd_text", { bg = "#d3cdbc", fg = "#272f35" })
hi(0, "St_file", { bg = "#d3cdbc", fg = "#272f35" })
hi(0, "St_file_sep", { bg = "#ede7d6", fg = "#d3cdbc" })
hi(0, "St_gitIcons", { bg = "#ede7d6", bold = true, fg = "#989383" })
hi(0, "St_lspError", { bg = "#ede7d6", fg = "#c85552" })
hi(0, "St_lspWarning", { bg = "#ede7d6", fg = "#dfa000" })
hi(0, "St_pos_icon", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "St_pos_sep", { bg = "#d3cdbc", fg = "#5da111" })
hi(0, "St_pos_text", { bg = "#d3cdbc", fg = "#272f35" })
hi(0, "Statement", { fg = "#5f9b93" })
hi(0, "StatusLine", { bg = "#ede7d6" })
hi(0, "StorageClass", { fg = "#8da101" })
hi(0, "String", { fg = "#d59600" })
hi(0, "Structure", { fg = "#c85552" })
hi(0, "Substitute", { bg = "#8da101", fg = "#f6f0df" })
hi(0, "TBTabTitle", { bg = "#3a94c5", fg = "#fff9e8" })
hi(0, "Tag", { fg = "#8da101" })
hi(0, "TbBufOff", { bg = "#f0ead9", fg = "#857f6e" })
hi(0, "TbBufOffClose", { bg = "#f0ead9", fg = "#857f6e" })
hi(0, "TbBufOffModified", { bg = "#f0ead9", fg = "#c85552" })
hi(0, "TbBufOn", { bg = "#fff9e8", fg = "#272f35" })
hi(0, "TbBufOnClose", { bg = "#fff9e8", fg = "#c85552" })
hi(0, "TbBufOnModified", { bg = "#fff9e8", fg = "#5da111" })
hi(0, "TbCloseAllBufsBtn", { bg = "#c85552", bold = true, fg = "#fff9e8" })
hi(0, "TbFill", { bg = "#f0ead9" })
hi(0, "TbLineThemeToggleBtn", { bg = "#e0dac9" })
hi(0, "TbTabCloseBtn", { bg = "#656c5f", fg = "#fff9e8" })
hi(0, "TbTabNewBtn", { bg = "#d1cbba", fg = "#272f35" })
hi(0, "TbTabOff", { bg = "#f0ead9", fg = "#272f35" })
hi(0, "TbTabOn", { fg = "#c85552" })
hi(0, "TbThemeToggleBtn", { bg = "#c2bcab", bold = true, fg = "#272f35" })
hi(0, "TelescopeBorder", { bg = "#f5efde", fg = "#f5efde" })
hi(0, "TelescopeMatching", { bg = "#e0dac9", fg = "#3a94c5" })
hi(0, "TelescopeNormal", { bg = "#f5efde" })
hi(0, "TelescopePreviewTitle", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "TelescopePromptBorder", { bg = "#f0ead9", fg = "#f0ead9" })
hi(0, "TelescopePromptNormal", { bg = "#f0ead9", fg = "#272f35" })
hi(0, "TelescopePromptPrefix", { bg = "#f0ead9", fg = "#c85552" })
hi(0, "TelescopePromptTitle", { bg = "#c85552", fg = "#fff9e8" })
hi(0, "TelescopeResultsDiffAdd", { fg = "#5da111" })
hi(0, "TelescopeResultsDiffChange", { fg = "#dfa000" })
hi(0, "TelescopeResultsDiffDelete", { fg = "#c85552" })
hi(0, "TelescopeResultsTitle", { bg = "#f5efde", fg = "#f5efde" })
hi(0, "TelescopeSelection", { bg = "#f0ead9", fg = "#272f35" })
hi(0, "Title", { fg = "#87a060" })
hi(0, "Todo", { bg = "#f6f0df", fg = "#8da101" })
hi(0, "TooLong", { fg = "#5f9b93" })
hi(0, "Type", { fg = "#8da101" })
hi(0, "Typedef", { fg = "#8da101" })
hi(0, "Variable", { fg = "#495157" })
hi(0, "Visual", { bg = "#ede7d6" })
hi(0, "VisualNOS", { fg = "#5f9b93" })
hi(0, "WarningMsg", { fg = "#5f9b93" })
hi(0, "WhichKey", { fg = "#272f35" })
hi(0, "WhichKeyDesc", { fg = "#272f35" })
hi(0, "WhichKeyGroup", { fg = "#5da111" })
hi(0, "WhichKeySeparator", { fg = "#857f6e" })
hi(0, "WhichKeyValue", { fg = "#5da111" })
hi(0, "WildMenu", { bg = "#8da101", fg = "#5f9b93" })
hi(0, "WinSeparator", { fg = "#e8e2d1" })
hi(0, "diffNewFile", { fg = "#3a94c5" })
hi(0, "diffOldFile", { fg = "#ce8196" })
hi(0, "gitcommitBranch", { bold = true, fg = "#b67996" })
hi(0, "gitcommitComment", { fg = "#e5dfce" })
hi(0, "gitcommitDiscarded", { fg = "#e5dfce" })
hi(0, "gitcommitDiscardedFile", { bold = true, fg = "#5f9b93" })
hi(0, "gitcommitDiscardedType", { fg = "#87a060" })
hi(0, "gitcommitHeader", { fg = "#c85552" })
hi(0, "gitcommitOverflow", { fg = "#5f9b93" })
hi(0, "gitcommitSelected", { fg = "#e5dfce" })
hi(0, "gitcommitSelectedFile", { bold = true, fg = "#d59600" })
hi(0, "gitcommitSelectedType", { fg = "#87a060" })
hi(0, "gitcommitSummary", { fg = "#d59600" })
hi(0, "gitcommitUnmergedFile", { bold = true, fg = "#5f9b93" })
hi(0, "gitcommitUnmergedType", { fg = "#87a060" })
hi(0, "gitcommitUntracked", { fg = "#e5dfce" })
hi(0, "gitcommitUntrackedFile", { fg = "#8da101" })
hi(0, "healthSuccess", { bg = "#5da111", fg = "#fff9e8" })
hi(0, "lCursor", { bg = "#bfc6d4", fg = "#1e1d2d" })
hi(0, "luaTSField", { fg = "#fa8d3e" })

-- No terminal colors defined