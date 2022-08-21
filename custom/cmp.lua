local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local sources = {
  {name = "copilot" },
}


cmp.setup {
  sources = sources
}
