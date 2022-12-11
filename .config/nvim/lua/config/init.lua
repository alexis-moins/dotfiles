-- Keymappings
require 'config.mappings'

-- Package manager
require 'config.packer'

-- packages configuration
require 'config.packages.lsp'
require 'config.packages.debug'

require 'config.packages.cmp'
require 'config.packages.snippets'

require 'config.packages.telescope'
require 'config.packages.treesitter'

require 'config.packages.dressing'
require 'config.packages.gitsigns'

require 'nvim-surround'.setup()
require 'nvim-autopairs'.setup()
