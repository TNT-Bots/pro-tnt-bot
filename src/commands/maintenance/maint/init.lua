--- Вкл/Выкл режима maintenance
--
local bot = require('bot')
local config = require('conf.config')
local Command = require('src.classes.Command')
local commandType = require('src.enums.command_type')

local COMMAND_INFO = [[
Вкл/Выкл режима maintenance.
При котором, происходит обновлеание ботаю.

<b>Синтаксис</b>
/maint [on/off]
]]

local command = Command:new {
  commands = { '/maint' },
  info = COMMAND_INFO,
  type = commandType.MAINTENANCE,
  type_reply = commandType.UNANSWERED,
}

command.call = function(ctx)
  local arguments = ctx:getArguments({ count = 2 })
  if not arguments[2] then
    return
  end

  local maintenance = arguments[2] == 'on'

  config.maintenance = maintenance

  -- Отправка результата
  bot:sendMessage {
    text = '<b>Maintenance</b>: ' .. tostring(maintenance and 'on' or 'off'),
    chat_id = ctx:getChatId()
  }
end

return command
