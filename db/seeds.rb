TimeSpending.create!([
                         {id: 15, name: "21:00 - 22:00", position: 15, time_start: "2000-01-01 21:00:00"},
                         {id: 14, name: "20:00 - 21:00", position: 14, time_start: "2000-01-01 20:00:00"},
                         {id: 13, name: "19:10 - 20:00", position: 13, time_start: "2000-01-01 19:10:00"},
                         {id: 12, name: "19:00 - 20:00", position: 12, time_start: "2000-01-01 19:00:00"},
                         {id: 11, name: "18:00 - 19:00", position: 11, time_start: "2000-01-01 18:00:00"},
                         {id: 10, name: "17:00 - 18:00", position: 10, time_start: "2000-01-01 17:00:00"},
                         {id: 9, name: "16:00 - 17:00", position: 9, time_start: "2000-01-01 16:00:00"},
                         {id: 8, name: "15:00 - 16:00", position: 8, time_start: "2000-01-01 15:00:00"},
                         {id: 7, name: "13:00 - 14:00", position: 7, time_start: "2000-01-01 13:00:00"},
                         {id: 6, name: "12:30 - 14:00", position: 6, time_start: "2000-01-01 12:30:00"},
                         {id: 5, name: "12:00 - 13:00", position: 5, time_start: "2000-01-01 12:00:00"},
                         {id: 4, name: "11:00 - 12:30", position: 4, time_start: "2000-01-01 11:00:00"},
                         {id: 3, name: "10:00 - 11:30", position: 3, time_start: "2000-01-01 10:00:00"},
                         {id: 2, name: "10:00 - 11:00", position: 2, time_start: "2000-01-01 10:00:00"},
                         {id: 1, name: "9:00 - 10:00", position: 1, time_start: "2000-01-01 09:00:00"}
                     ])
DayWeek.create!([
                    {id: 1, name: "Понедельник"},
                    {id: 2, name: "Вторник"},
                    {id: 3, name: "Среда"},
                    {id: 4, name: "Четверг"},
                    {id: 5, name: "Пятница"},
                    {id: 6, name: "Суббота"},
                    {id: 7, name: "Воскресенье"}
                ])
CashSort.create!([
                     {id: 1, name: "Личный"},
                     {id: 2, name: "Семейный"},
                     {id: 3, name: "Детский"}
                 ])
AdminUser.create!([
  {email: "admin@example.com", password: 'qwerez', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 16, current_sign_in_at: "2017-06-09 13:13:07", last_sign_in_at: "2017-06-07 17:26:08", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Meet.create!([
  {date: "2013-03-05", description: "drgdsgfdg gds fdsf ", time_start: "Начало в 18.00", image_file_name: "2.JPG", image_content_type: "image/jpeg", image_file_size: 1401860, image_updated_at: "2017-06-03 10:10:12"},
  {date: "2014-03-05", description: "Приглашаем всех на чаяпитие. Общение этоже так здорово", time_start: "Начало в 18.00", image_file_name: "2.JPG", image_content_type: "image/jpeg", image_file_size: 1401860, image_updated_at: "2017-06-03 10:23:15"}
])
Teacher.create!([
  {user_id: 1},
  {user_id: 2},
  {user_id: 3},
  {user_id: 5}
])

SelectCash.create!([
  {count: 100000, name: "безлимит", price: 7000, cash_sort_id: 1, subscription: true},
  {count: 20, name: "20 занятий", price: 5000, cash_sort_id: 1, subscription: true},
  {count: 15, name: "15 занятий", price: 4000, cash_sort_id: 1, subscription: true},
  {count: 5, name: "5 занятий", price: 2000, cash_sort_id: 1, subscription: true},
  {count: 1, name: "Разовое посещение", price: 400, cash_sort_id: 1, subscription: true},
  {count: 10, name: "10 занятий", price: 3000, cash_sort_id: 1, subscription: true},
  {count: 1, name: "Разовое посещение", price: 300, cash_sort_id: 3, subscription: true},
  {count: 5, name: "5 занятий", price: 1500, cash_sort_id: 3, subscription: true},
  {count: 10, name: "10 занятий", price: 2500, cash_sort_id: 3, subscription: true},
  {count: 15, name: "15 занятий", price: 3500, cash_sort_id: 3, subscription: true},
  {count: 20, name: "20 занятий", price: 5000, cash_sort_id: 2, subscription: true},
  {count: 100000, name: "безлимит ", price: 7000, cash_sort_id: 2, subscription: true}
])

Album.create!([
  {avatar_file_name: "1.JPG", avatar_content_type: "image/jpeg", avatar_file_size: 1152512, avatar_updated_at: "2017-06-03 15:03:21", name: "Общий"},
  {avatar_file_name: "2.JPG", avatar_content_type: "image/jpeg", avatar_file_size: 1401860, avatar_updated_at: "2017-06-03 15:03:41", name: "Тренировки"},
  {avatar_file_name: "3.JPG", avatar_content_type: "image/jpeg", avatar_file_size: 1599739, avatar_updated_at: "2017-06-03 15:04:37", name: "Тусовки"}
])
Cash.create!([
  {date_finish: "2017-05-11", cash_sort_id: 3, last_name: nil, cash_count: 0},
  {date_finish: nil, cash_sort_id: 2, last_name: nil, cash_count: 0},
  {date_finish: "2017-06-16", cash_sort_id: 1, last_name: nil, cash_count: 99963},
  {date_finish: "2017-05-16", cash_sort_id: 1, last_name: nil, cash_count: 99997},
  {date_finish: "2017-05-31", cash_sort_id: 2, last_name: nil, cash_count: -1},
  {date_finish: "2017-07-08", cash_sort_id: 1, last_name: nil, cash_count: 1},
  {date_finish: "2017-06-10", cash_sort_id: 1, last_name: nil, cash_count: -1},
  {date_finish: "2017-06-28", cash_sort_id: 1, last_name: nil, cash_count: 99999999},
  {date_finish: "2017-05-16", cash_sort_id: 1, last_name: nil, cash_count: -1},
  {date_finish: "2017-06-01", cash_sort_id: 1, last_name: nil, cash_count: -5},
  {date_finish: "2017-07-08", cash_sort_id: 1, last_name: nil, cash_count: 3},
  {date_finish: nil, cash_sort_id: 1, last_name: nil, cash_count: -2},
  {date_finish: "2017-07-03", cash_sort_id: 1, last_name: nil, cash_count: -1},
  {date_finish: "2017-05-17", cash_sort_id: 1, last_name: nil, cash_count: -3},
  {date_finish: "2017-05-11", cash_sort_id: 2, last_name: nil, cash_count: 0},
  {date_finish: "2017-07-02", cash_sort_id: 1, last_name: nil, cash_count: 9},
  {date_finish: "2017-05-19", cash_sort_id: 1, last_name: nil, cash_count: 0},
  {date_finish: "2017-05-11", cash_sort_id: 1, last_name: nil, cash_count: 7}
])

SlideImage.create!([
  {name: "Йога в гамаках", image_file_name: "4.JPG", image_content_type: "image/jpeg", image_file_size: 1860067, image_updated_at: "2017-03-18 14:01:10", position: 3},
  {name: "Растяжка", image_file_name: "3.JPG", image_content_type: "image/jpeg", image_file_size: 1599739, image_updated_at: "2017-03-18 14:01:28", position: 4},
  {name: "Табата", image_file_name: "2.JPG", image_content_type: "image/jpeg", image_file_size: 1401860, image_updated_at: "2017-03-20 01:26:13", position: 5},
  {name: "Pole dance", image_file_name: "2.JPG", image_content_type: "image/jpeg", image_file_size: 1401860, image_updated_at: "2017-03-18 14:02:15", position: 6},
  {name: "Exotic pole dance", image_file_name: "4.JPG", image_content_type: "image/jpeg", image_file_size: 1860067, image_updated_at: "2017-03-18 14:15:00", position: 7},
  {name: "TRX", image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, position: 8},
  {name: "Детская современная хореография", image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, position: 9},
  {name: "Хатха-йога", image_file_name: "2.JPG", image_content_type: "image/jpeg", image_file_size: 1401860, image_updated_at: "2017-06-03 09:22:07", position: 2},
  {name: "Пусть каждый день будет лучшим", image_file_name: "1.JPG", image_content_type: "image/jpeg", image_file_size: 1152512, image_updated_at: "2017-06-03 11:12:25", position: 1}
])
TrainingName.create!([
  {name: "Танец живота", name_shot: "tg"},
  {name: "Растяжка для детей", name_shot: "child"},
  {name: "Совр. хореог. для детей", name_shot: "child"},
  {name: "Strech-yoga", name_shot: "sy"},
  {name: "TRX", name_shot: "trx"},
  {name: "Pole dance", name_shot: "pd"},
  {name: "Pole exotic", name_shot: "pe"},
  {name: "Табата", name_shot: "ta"},
  {name: "Йога в гамаках", name_shot: "yg"},
  {name: "Растяжка", name_shot: "ras"},
  {name: "Хатха-йога", name_shot: "hy"}
])
Timetable.create!([
  {day_week_id: 1, time_spending_id: 15, training_name_id: 3, place: 10, user_id: 3},
  {day_week_id: 1, time_spending_id: 14, training_name_id: 6, place: 10, user_id: 3},
  {day_week_id: 1, time_spending_id: 12, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 1, time_spending_id: 11, training_name_id: 6, place: 10, user_id: 3},
  {day_week_id: 1, time_spending_id: 2, training_name_id: 1, place: 10, user_id: 3},
  {day_week_id: 1, time_spending_id: 1, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 2, time_spending_id: 13, training_name_id: 9, place: 10, user_id: 5},
  {day_week_id: 2, time_spending_id: 15, training_name_id: 3, place: 10, user_id: 2},
  {day_week_id: 2, time_spending_id: 14, training_name_id: 5, place: 10, user_id: 2},
  {day_week_id: 3, time_spending_id: 1, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 3, time_spending_id: 2, training_name_id: 1, place: 10, user_id: 3},
  {day_week_id: 3, time_spending_id: 11, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 3, time_spending_id: 12, training_name_id: 6, place: 10, user_id: 3},
  {day_week_id: 3, time_spending_id: 14, training_name_id: 3, place: 10, user_id: 3},
  {day_week_id: 3, time_spending_id: 15, training_name_id: 1, place: 10, user_id: 3},
  {day_week_id: 4, time_spending_id: 11, training_name_id: 6, place: 10, user_id: 2},
  {day_week_id: 4, time_spending_id: 12, training_name_id: 4, place: 10, user_id: 2},
  {day_week_id: 4, time_spending_id: 14, training_name_id: 5, place: 10, user_id: 2},
  {day_week_id: 4, time_spending_id: 15, training_name_id: 3, place: 10, user_id: 2},
  {day_week_id: 5, time_spending_id: 1, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 5, time_spending_id: 9, training_name_id: 1, place: 10, user_id: 3},
  {day_week_id: 5, time_spending_id: 10, training_name_id: 8, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 13, training_name_id: 9, place: 10, user_id: 5},
  {day_week_id: 6, time_spending_id: 1, training_name_id: 4, place: 10, user_id: 3},
  {day_week_id: 6, time_spending_id: 5, training_name_id: 10, place: 10, user_id: 5},
  {day_week_id: 6, time_spending_id: 3, training_name_id: 11, place: 10, user_id: 2},
  {day_week_id: 7, time_spending_id: 2, training_name_id: 5, place: 10, user_id: 2},
  {day_week_id: 7, time_spending_id: 4, training_name_id: 6, place: 10, user_id: 2},
  {day_week_id: 7, time_spending_id: 6, training_name_id: 4, place: 10, user_id: 2},
  {day_week_id: 7, time_spending_id: 10, training_name_id: 7, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 13, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 15, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 14, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 12, training_name_id: 2, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 10, training_name_id: 8, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 9, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 2, time_spending_id: 8, training_name_id: 2, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 2, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 8, training_name_id: 2, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 12, training_name_id: 2, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 14, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 5, time_spending_id: 15, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 6, time_spending_id: 5, training_name_id: 1, place: 10, user_id: 1},
  {day_week_id: 6, time_spending_id: 7, training_name_id: 3, place: 10, user_id: 1},
  {day_week_id: 7, time_spending_id: 9, training_name_id: 2, place: 10, user_id: 1},
  {day_week_id: 7, time_spending_id: 11, training_name_id: 8, place: 10, user_id: 1},
  {day_week_id: 7, time_spending_id: 12, training_name_id: 1, place: 10, user_id: 1}
])

Role.create!([
  {id: 1, name: "teacher", resource_type: nil, resource_id: nil},
  {id: 2, name: "admin", resource_type: nil, resource_id: nil},
  {id: 3, name: "user", resource_type: nil, resource_id: nil}
])

TablePublish.create!([
  {day_week: "Понедельник", time_spending: "9:00 - 10:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 09:00:00"},
  {day_week: "Понедельник", time_spending: "10:00 - 11:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Мария", place: 10, time_start: "2000-01-01 10:00:00"},
  {day_week: "Понедельник", time_spending: "18:00 - 19:00", training_name: "Растяжка", name_shot: "ras", teacher: "Мария", place: 10, time_start: "2000-01-01 18:00:00"},
  {day_week: "Понедельник", time_spending: "19:00 - 20:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 19:00:00"},
  {day_week: "Понедельник", time_spending: "20:00 - 21:00", training_name: "Растяжка", name_shot: "ras", teacher: "Мария", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Понедельник", time_spending: "21:00 - 22:00", training_name: "Pole exotic", name_shot: "pe", teacher: "Мария", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Вторник", time_spending: "15:00 - 16:00", training_name: "Табата", name_shot: "ta", teacher: "Юмна", place: 10, time_start: "2000-01-01 15:00:00"},
  {day_week: "Вторник", time_spending: "16:00 - 17:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 16:00:00"},
  {day_week: "Вторник", time_spending: "17:00 - 18:00", training_name: "Хатха-йога", name_shot: "hy", teacher: "Юмна", place: 10, time_start: "2000-01-01 17:00:00"},
  {day_week: "Вторник", time_spending: "19:00 - 20:00", training_name: "Табата", name_shot: "ta", teacher: "Юмна", place: 10, time_start: "2000-01-01 19:00:00"},
  {day_week: "Вторник", time_spending: "19:10 - 20:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 19:10:00"},
  {day_week: "Вторник", time_spending: "19:10 - 20:00", training_name: "Совр. хореог. для детей", name_shot: "child", teacher: "Катя", place: 10, time_start: "2000-01-01 19:10:00"},
  {day_week: "Вторник", time_spending: "20:00 - 21:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Вторник", time_spending: "20:00 - 21:00", training_name: "TRX", name_shot: "trx", teacher: "Наталия", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Вторник", time_spending: "21:00 - 22:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Вторник", time_spending: "21:00 - 22:00", training_name: "Pole exotic", name_shot: "pe", teacher: "Наталия", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Среда", time_spending: "9:00 - 10:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 09:00:00"},
  {day_week: "Среда", time_spending: "10:00 - 11:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Мария", place: 10, time_start: "2000-01-01 10:00:00"},
  {day_week: "Среда", time_spending: "18:00 - 19:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 18:00:00"},
  {day_week: "Среда", time_spending: "19:00 - 20:00", training_name: "Растяжка", name_shot: "ras", teacher: "Мария", place: 10, time_start: "2000-01-01 19:00:00"},
  {day_week: "Среда", time_spending: "20:00 - 21:00", training_name: "Pole exotic", name_shot: "pe", teacher: "Мария", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Среда", time_spending: "21:00 - 22:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Мария", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Четверг", time_spending: "18:00 - 19:00", training_name: "Растяжка", name_shot: "ras", teacher: "Наталия", place: 10, time_start: "2000-01-01 18:00:00"},
  {day_week: "Четверг", time_spending: "19:00 - 20:00", training_name: "Pole dance", name_shot: "pd", teacher: "Наталия", place: 10, time_start: "2000-01-01 19:00:00"},
  {day_week: "Четверг", time_spending: "20:00 - 21:00", training_name: "TRX", name_shot: "trx", teacher: "Наталия", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Четверг", time_spending: "21:00 - 22:00", training_name: "Pole exotic", name_shot: "pe", teacher: "Наталия", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Пятница", time_spending: "9:00 - 10:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 09:00:00"},
  {day_week: "Пятница", time_spending: "10:00 - 11:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 10:00:00"},
  {day_week: "Пятница", time_spending: "15:00 - 16:00", training_name: "Табата", name_shot: "ta", teacher: "Юмна", place: 10, time_start: "2000-01-01 15:00:00"},
  {day_week: "Пятница", time_spending: "16:00 - 17:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Мария", place: 10, time_start: "2000-01-01 16:00:00"},
  {day_week: "Пятница", time_spending: "17:00 - 18:00", training_name: "Хатха-йога", name_shot: "hy", teacher: "Юмна", place: 10, time_start: "2000-01-01 17:00:00"},
  {day_week: "Пятница", time_spending: "19:00 - 20:00", training_name: "Табата", name_shot: "ta", teacher: "Юмна", place: 10, time_start: "2000-01-01 19:00:00"},
  {day_week: "Пятница", time_spending: "19:10 - 20:00", training_name: "Совр. хореог. для детей", name_shot: "child", teacher: "Катя", place: 10, time_start: "2000-01-01 19:10:00"},
  {day_week: "Пятница", time_spending: "20:00 - 21:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 20:00:00"},
  {day_week: "Пятница", time_spending: "21:00 - 22:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 21:00:00"},
  {day_week: "Суббота", time_spending: "9:00 - 10:00", training_name: "Pole dance", name_shot: "pd", teacher: "Мария", place: 10, time_start: "2000-01-01 09:00:00"},
  {day_week: "Суббота", time_spending: "10:00 - 11:30", training_name: "Танец живота", name_shot: "tg", teacher: "Наталия", place: 10, time_start: "2000-01-01 10:00:00"},
  {day_week: "Суббота", time_spending: "12:00 - 13:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 12:00:00"},
  {day_week: "Суббота", time_spending: "12:00 - 13:00", training_name: "Растяжка для детей", name_shot: "child", teacher: "Катя", place: 10, time_start: "2000-01-01 12:00:00"},
  {day_week: "Суббота", time_spending: "13:00 - 14:00", training_name: "Pole exotic", name_shot: "pe", teacher: "Юмна", place: 10, time_start: "2000-01-01 13:00:00"},
  {day_week: "Воскресенье", time_spending: "10:00 - 11:00", training_name: "TRX", name_shot: "trx", teacher: "Наталия", place: 10, time_start: "2000-01-01 10:00:00"},
  {day_week: "Воскресенье", time_spending: "11:00 - 12:30", training_name: "Растяжка", name_shot: "ras", teacher: "Наталия", place: 10, time_start: "2000-01-01 11:00:00"},
  {day_week: "Воскресенье", time_spending: "12:30 - 14:00", training_name: "Pole dance", name_shot: "pd", teacher: "Наталия", place: 10, time_start: "2000-01-01 12:30:00"},
  {day_week: "Воскресенье", time_spending: "16:00 - 17:00", training_name: "Табата", name_shot: "ta", teacher: "Юмна", place: 10, time_start: "2000-01-01 16:00:00"},
  {day_week: "Воскресенье", time_spending: "17:00 - 18:00", training_name: "Strech-yoga", name_shot: "sy", teacher: "Юмна", place: 10, time_start: "2000-01-01 17:00:00"},
  {day_week: "Воскресенье", time_spending: "18:00 - 19:00", training_name: "Хатха-йога", name_shot: "hy", teacher: "Юмна", place: 10, time_start: "2000-01-01 18:00:00"},
  {day_week: "Воскресенье", time_spending: "19:00 - 20:00", training_name: "Йога в гамаках", name_shot: "yg", teacher: "Юмна", place: 10, time_start: "2000-01-01 19:00:00"}
])
# User.create!([
#   {id: 3, email: "asq@example.com", password: 'qwerez', reset_password_token: "10ede03658a3b4ebe571884a61777a5a93ce600a2e9da365536e8f1f82ab522a", reset_password_sent_at: "2017-06-07 18:02:54", remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-16 22:15:09", last_sign_in_at: "2017-04-16 22:15:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Мария", last_name: "Гординская", specialty: nil, phone: nil, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, cash_sort_id: 1, birth_date: nil},
#   {id: 5, email: "worldnillin@gmail.com", password: 'qwerez', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-03-22 19:10:54", last_sign_in_at: "2017-03-22 19:10:54", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Катя", last_name: "Петрова", specialty: "", phone: "", avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, cash_sort_id: nil, birth_date: nil},
#   {id: 1, email: "a@example.com",  password: 'qwerez', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 60, current_sign_in_at: "2017-06-09 13:01:49", last_sign_in_at: "2017-06-07 18:41:49", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Юмна", last_name: "Васильева", specialty: "", phone: "", avatar_file_name: "depositphotos_25277965-Pink-abstract-doodle-flowers-seamless-pattern.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 359555, avatar_updated_at: "2017-06-01 12:39:01", cash_sort_id: 1, birth_date: "2017-02-22"},
#   {id: 2, email: "zzzzmail@ya.ru",  password: 'qwerez', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-12 16:51:45", last_sign_in_at: "2017-04-12 16:51:45", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Наталья", last_name: "Васильев", specialty: "Very simple Roles library without any authorization enforcement supporting scope on resource objects ", phone: "", avatar_file_name: "3.JPG", avatar_content_type: "image/jpeg", avatar_file_size: 1599739, avatar_updated_at: "2017-04-12 17:00:02", cash_sort_id: 1, birth_date: nil}
# ])

Content.create!([
                    {slide_image_id: 1, name: "Йога в гамаках", name_shot: "yg", description: "Занятия, на которых выполняются асаны и упражнения, направленные на мягкое растяжение позвоночника, плечевого пояса, мышц, и суставов ног и рук. Занятие в гамаках настоящее удовольствие для тела и души!"},
                    {slide_image_id: 3, name: "Табата", name_shot: "ta", description: "Табата - жиросжигающая высокоинтенсивная интервальная тренировка. Сама табата длится 4 минуты: 8 циклов по 20 секунд интенсивной работы и 10 секунд отдыха. Перед самой табатой на занятии идёт 20-минутный разогрев в виде кардио-треировки, а после - растяжка на расслабление мышц. Первые результаты от таких тренировок при регулярных занятиях 2-3 раза в неделю можно увидеть уже через 25-30 дней."},
                    {slide_image_id: 4, name: "Pole dance", name_shot: "pd", description: "Pole dance - необыкновенный вид спорта, в котором сочетается сила, пластика, акробатика и хореография. Женщины, что занимаются танцем на пилоне, становятся уверенными в своей силе, красоте, гибкости и способности добиваться поставленных целей."},
                    {slide_image_id: 5, name: "Exotic pole dance", name_shot: "pe", description: "Exotic pole dance - самый необычный танец, разрывающий все представления об остальных видах танца.Его исполняют у шеста, на нём и в партере (на полу). Самый красивый и завораживающих танец и даже своего рода терапия для женщин, чувствующих неуверенность в своём теле и своей неотразимости. Он помогает раскрыть свою красоту, грацию, силу и сексуальность, что есть в каждой женщине."},
                    {slide_image_id: 6, name: "TRX", name_shot: "trx", description: "TRX - силовые тренировки с многофункциональными петлями TRX. Работа на таких петлях подходит всем, т.к. нагрузку во время выполнения упражнения легко регулировать. При таких регулярных тренировках результат можно почувствовать уже через несколько занятий - тело станет более подтянутым и выносливым, уменьшится процент жира в теле."},
                    {slide_image_id: 8, name: "Хатха-йога", name_shot: "hy", description: "Классическое занятие йогой. Оно направлено на устранение зажимов в теле, растяжение и расслабление всех групп мышц. После занятий йогой появляется ощущение лёгкости и бодрости тела."},
                    {slide_image_id: 2, name: "Растяжка", name_shot: "ras", description: "Растяжка - занятие, необходимое всем, кто хочет свободно двигаться, иметь красивую осанку, крепкие мышцы и связки. А так же тем, кто хочет уметь садиться на шпагаты и иметь умопомрачительно гибкую спину!"}
                ])

# User::HABTM_Roles.create!([
#                               {user_id: 1, role_id: 1},
#                               {user_id: 2, role_id: 1},
#                               {user_id: 3, role_id: 1},
#                               {user_id: 5, role_id: 1},
#
#                           ])


