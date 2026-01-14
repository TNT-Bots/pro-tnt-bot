---
--
local crud_users = require('src.services.users')

local function run(fields, where)
  local user, err = crud_users.update(fields, where)
  if err then
    return false, err
  end

  return true, user
end

return run
