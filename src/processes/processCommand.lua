--- Обработчик команд
--
local bot = require('bot')
local config = require('conf.config')
local log = require('bot.libs.logger')
local command_type = require('src.enums.command_type')
local chat_type = require('bot.enums.chat_type')
local userService = require('src.services.users')

-- TODO: Обработчик таймаута нажатий на callback
-- TODO: Антифлуддер

local PLEASE_WAIT_TEXT = [[
Сейчас меня обновляет разработчик
<b>Пожалуйста подождите...</b> ⏳
]]

local function notify_maintModeMsg(ctx)
  bot:sendMessage {
    text = PLEASE_WAIT_TEXT,
    chat_id = ctx:getChatId(),
    reply_to_message_id = ctx:getMessageId()
  }
end

local function notify_maintModeAnswerQuery(ctx)
  bot:answerCallbackQuery {
    text = PLEASE_WAIT_TEXT,
    callback_query_id = ctx:getQueryId(),
    show_alert = true
  }
end

local function processCommand(ctx, opts)
  local commandName
  local command

  if opts and opts.is_text_command then
    command = opts.command

    goto text_command
  end

  -- Нажали на callback кнопку
  if ctx.is_callback_query then
    commandName = ctx:getArguments({ count = 1 })[1]
  else
    -- Выполняем команды бота
    local entities = ctx:getEntities()
    if entities then
      commandName = ctx.message.text:split(' ', 1)[1]
    end
  end

  command = bot.commands[commandName]
  if command == nil then
    return
  end

  ::text_command::

  -- Пользователь
  local ufrom = ctx:getUserFrom()

  -- Определение типа команд
  if command.type == command_type.PRIVATE then
    if ctx:getChatType() ~= chat_type.PRIVATE then
      return
    end
  elseif command.type == command_type.MAINTENANCE then
    if not config.isAdmin(ufrom.id) then
      return
    end
  end

  -- Проверка работы режимы обслуживания
  --
  if config.maintenance then
    if not config.isAdmin(ufrom.id) then
      if ctx.is_callback_query then
        notify_maintModeAnswerQuery(ctx)
        return
      end

      notify_maintModeMsg(ctx)
      return
    end
  end

  -- Пропуска ботов
  --
  if ufrom.is_bot then
    return
  end

  -- Не разрешать каналам использовать команды
  --
  local senderChat = ctx:getSenderChat()
  if senderChat then
    return
  end

  -- Регистрация пользователя
  --
  local user, err = userService.upsert(ufrom)
  if err then
    log.error(err)
  end
  --

  -- Выполнение команды
  command.call(ctx, user)
end

return processCommand
