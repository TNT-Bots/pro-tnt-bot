return function ()
  box.cfg {
    -- Один час до очистки `мусора`
    checkpoint_interval = 7200,
    -- Количество snapshots
    checkpoint_count = 2,

    -- Кол-во памяти для кортежей
    memtx_memory = 512 * 1024 * 1024, -- байт
    -- Размер самого большого выделенного блока для хранилища memtx
    memtx_max_tuple_size = 524288, -- 512кб

    -- Директории хранений
    memtx_dir = 'storage/snap',
    wal_dir = 'storage/xlog',
  }
end
