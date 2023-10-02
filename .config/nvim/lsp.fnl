(fn use-picker [name]
  "Open the telescope picker with the given name"
  (vim.cmd.Telescope [name]))

(fn on-attach []
  "Function called when a buffer is connecting to the LSP client"
  (local {: map-local} (require :jev.core.keymaps))

  (map-local :n :gd #(use-picker :lsp_definitions) "Go to definitions")
  (map-local :n :gt #(use-picker :lsp_type_definitions)
             "Go to type definitions")

  (map-local :n :gi #(use-picker :lsp_implementations) "Go to implementations")
  (map-local :n :gr #(use-picker :lsp_references) "Go to references")

  (map-local :n :<Leader>fs #(use-picker :lsp_document_symbols)
             "Show document symbols")

  (map-local :n :<Leader>d #(use-picker :dignostics) "Show buffer diagnostics")
  (map-local :n :<Leader>w #(use-picker :dignostics)
             "Show workspace diagnostics")

  (map-local :n :<Leader>rn vim.lsp.buf.rename "Rename symbol under the cursor")
  (map-local :n :<Leader>ca vim.lsp.buf.code_action "Code actions")
  (map-local :n :<Leader>lr vim.cmd.LspRestart "Restart Lsp client"))

{:1 :nvim/nvim-lspconfig
 :lazy false

 :dependencies [:williamboman/mason-nvim
                :williamboman/mason-lspconfig.nvim
                {:1 :folke/neodev.nvim :config true}]

 :keys [{:1 :<Leader>lm :2 vim.cmd.Mason :desc "Open Mason" :silent true}
        {:1 :<Leader>li :2 vim.cmd.LspInfo> :desc "Show Lsp info" :silent true}]

 :config (fn []
           (let [mason (require :mason)]
             (mason.setup {:ui {:icon {:package_installed "*"
                                       :package_pending "~"
                                       :package_uninstalled "-"}}}))

           (local mason-lspconfig (require :mason-lspconfig))
           (mason-lspconfig.setup)
           (local client-capabilities
                  (vim.lsp.protocol.make_client_capabilities))
           (local cmp-lsp (require :cmp_nvim_lsp))
           (cmp-lsp.default_capabilities client-capabilities)
           (mason-lspconfig.setup_handlers {:1 (fn [server-name]
                                                 (let [lspconfig (require :lspconfig)]
                                                   (. lspconfig server-name)))}

                                           :lua_ls (fn []
                                                     )
                                           ))}
