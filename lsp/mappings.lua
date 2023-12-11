return {
  n = {
    -- treesj
    ["<leader>m"] = { require('treesj').toggle, desc = "toggle split/join"},
    ["<leader>s"] = { require('treesj').split, desc = "split"},
    ["<leader>j"] = { require('treesj').join, desc = "join"},
   }
 }
