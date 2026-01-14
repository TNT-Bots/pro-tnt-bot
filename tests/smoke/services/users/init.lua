local create = require('tests.smoke.services.users.create')
local upsert = require('tests.smoke.services.users.upsert')
local update = require('tests.smoke.services.users.update')

return {
  create = create,
  upsert = upsert,
  update = update,
}