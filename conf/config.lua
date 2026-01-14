--- Конфиг
--
local config = {
  maintenance = false,
  admins = {
    os.getenv("BOT_CREATOR_ID"),
  },
  bot = {
    username = os.getenv("BOT_USERNAME")
  }
}

config.isAdmin = function (id)
  for i = 1, #config.admins do
    if config.admins[i] == id then
      return true
    end
  end
  return false
end

return config
