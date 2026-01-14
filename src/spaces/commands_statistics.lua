--- Статистика по используемым командам
--

--- Схема спейса
local formatSpace = {
  {
    name = 'command',
    type ='string',
  },
  {
    name = 'date',
    type ='number',
  },
  {
    name = 'count',
    type ='number',
  },
}

--- Индексы спейса
local index = {
  {
    name = 'command',
    options = {
      parts = { 'command' },
      unique = true,
      if_not_exists = true
    }
  }
}

--- export
--
return {
  format_space = formatSpace,
  index = index
}
