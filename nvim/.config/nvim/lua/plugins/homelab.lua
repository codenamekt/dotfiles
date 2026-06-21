-- Homelab-oriented helpers.
-- The homelab repo is mostly Docker Compose/YAML, Python, Go, shell, JSON,
-- Markdown, Mermaid diagrams, and occasional infrastructure-as-code snippets.
-- Treesitter already covers Dockerfile, YAML, JSON, Markdown, Mermaid, Python,
-- Go, Lua, and shell, so this file only adds lightweight extras where they help.

return {
  {
    "aklt/plantuml-syntax",
    ft = { "markdown", "plantuml" },
  },
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "tfvars" },
  },
  {
    "pearofducks/ansible-vim",
    ft = { "ansible", "yaml", "yml" },
  },
}
