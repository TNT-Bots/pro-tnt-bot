---
--
local users = require('src.spaces.users')
local chat_users = require('src.spaces.chat_users')
local chats = require('src.spaces.chats')
local commands_statistics = require('src.spaces.commands_statistics')

return {
  users = users,
  chat_users = chat_users,
  chats = chats,
  commands_statistics = commands_statistics
}
