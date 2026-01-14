---
--
local log = require('bot.libs.logger')
local users = require('tests.smoke.services.users.init')
local init_storage = require('tests.smoke.init_storage')
init_storage()

local function checkTest(test, status, err)
  if status == false then
    log.error('FAILED: [' .. test .. '] %s', err)
    os.exit(1)
  end

  log.info('PASSED: ' .. test)
end

local create = users.create
local upsert = users.upsert
local update = users.update

math.randomseed(os.time())
local user = {
  id = 1234567890 + math.random(0, 9999999),
  first_name = 'Alex',
  last_name = 'Wazowsy',
  username = 'super_cool_us',
  language_code = 'ru',
  is_premium = true,
}

-- Create
checkTest('Create user', create(user))

-- Upsert
user.username = 'windows_explorer'
checkTest('Upsert user', upsert(user))

-- Update
checkTest('Update user', update({ first_name = 'Miroslaw' }, { id = user.id }))
