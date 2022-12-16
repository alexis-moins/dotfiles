-- Optimize up startup time
require 'impatient'

-- Default configuration
require 'alexis.options'
require 'alexis.mappings'

-- Plugin configuration
require 'alexis.packer'
require 'alexis.plugin.lualine'

require 'alexis.plugin.lsp'
require 'alexis.plugin.debug'

require 'alexis.plugin.cmp'
require 'alexis.plugin.snippets'

require 'alexis.plugin.telescope'
require 'alexis.plugin.treesitter'

require 'alexis.plugin.dressing'
require 'alexis.plugin.gitsigns'

require 'alexis.plugin.which-key'
require 'alexis.plugin.surround'

require 'nvim-autopairs'.setup()
