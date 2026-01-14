--- Класс команд
--
local Command = {}
Command.__index = Command

function Command:new(opts)
  local _command = {}

  _command.type = opts.type
  _command.commands = opts.commands
  _command.info = opts.info

  return setmetatable(_command, self)
end

return Command
