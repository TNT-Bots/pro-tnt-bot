--- Роль обработки нового дня
--
local log = require('bot.libs.logger')
local fiber = require('fiber')
local sql = require('bot.ext.sql')

local Role = {}

function Role.init()
  local count = 0

  local fb = fiber.create(function ()
    while true do
      for _, tuple in box.space.users:pairs() do
        count = count + 1

        local energy = tuple.energy
        local health = tuple.health

        if energy < 10 then
          energy = energy + 1
        end

        if health < 100 then
          health = math.min(100, health + 10)
        end

        local _, err = sql.update('users', {
          energy = energy,
          health = health
        }, { id = tuple.id })

        if err then
          log.error(err)
        end

        if count % 1000 == 0 then
          fiber.yield()
        end
      end

      -- Каждые 10 минут
      fiber.sleep(60 * 10)
    end
  end)

  fb:name('increase_user_stats')
end

return Role
