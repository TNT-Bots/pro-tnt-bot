---
--
local User = require('src.models.User')
local crud_users = require('src.services.users')

local function run(user)
  local model, errs = User(user, { init = true })
  if errs then
    return false, errs
  end

  local _, err = crud_users.create(model)
  if err then
    return false, errs
  end

  return true, model
end

return run
