-- Keymappings
require 'config.mappings'

-- Package manager
require 'config.packer'

-- packages configuration
require 'config.packages.lsp'
require 'config.packages.completion'

require 'config.packages.telescope'
require 'config.packages.treesitter'

require 'nvim-surround'.setup()
require 'nvim-autopairs'.setup()
