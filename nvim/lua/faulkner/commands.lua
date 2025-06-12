local reserved_args = {
  "debug",
}

local function contains(table, element)
  for _, value in ipairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

local function strip_reserved_args(table)
  local result = ""
  for _, value in ipairs(table) do
    if not contains(reserved_args, value) then
      result = result .. value
    end
  end
  return result
end

vim.api.nvim_create_user_command("AutoRunTests", function(args)
  local debug = contains(args.fargs, "debug")
  if debug then
    print("Length of args: ", #args.fargs)
    print("Args", vim.inspect(args))
  end
  if args.bang then
    vim.api.nvim_del_augroup_by_name("AutoRunTests")
  else
    local stripped_args = strip_reserved_args(args.fargs)
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("AutoRunTests", { clear = true }),
      callback = function()
        if debug then
          print("Running autocommand:")
          print(":TestFile " .. stripped_args)
        end
        vim.cmd(":TestFile ")
      end,
    })
  end
end, {
  nargs = "*",
  desc =
  "Run tests for current file. Parameters can be passed, which will be postfixed to the callto TestFiles. If bang is included, the autocommand will be removed. Otherwise, it will run on every bufferWrite event.",
  bang = true,
}
)
