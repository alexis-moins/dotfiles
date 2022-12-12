-- Keymappings
require 'config.mappings'

-- Package manager
require 'config.packer'

-- packages configuration
-- require 'config.packages.feline'
require 'config.packages.lualine'

require 'config.packages.lsp'
require 'config.packages.debug'

require 'config.packages.cmp'
require 'config.packages.snippets'

require 'config.packages.telescope'
require 'config.packages.treesitter'

require 'config.packages.dressing'
require 'config.packages.gitsigns'

require 'config.packages.surround'
require 'nvim-autopairs'.setup()
