---
--
local crud_users = require('src.services.users')

local function run(data)
  local item, err = crud_users.upsert(data)
  if err then
    return false, err
  end

  return true, item
end

return run
