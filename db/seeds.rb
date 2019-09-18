require 'mini_magick'

puts 'cleaning DB...'

User.destroy_all

puts 'creating users...'

user_hash = [
  {
    email: '1@1.com',
    user_name: 'Peter',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'zqNTltOGh5c',
    sc_url: 'https://soundcloud.com/lovelovesyousoo/sets/jazzhip7c',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus labore dolores illo voluptatem modi soluta incidunt ea laborum provident ab earum ducimus itaque vero non, nam quidem deleniti? Accusantium ea quibusdam laboriosam, vitae quam odio praesentium autem quisquam mollitia, tempore eos laborum repellendus laudantium ad corrupti adipisci cupiditate. Facere soluta harum reiciendis aliquam, obcaecati dicta magni delectus repellat. Nemo magnam reiciendis ab esse, quis animi impedit itaque repellat vel tempora eius magni perspiciatis ut commodi. Repellendus, laudantium facere necessitatibus, fugit ducimus alias eligendi tempora, nulla sed iure aliquid. Voluptas asperiores aliquam quaerat dicta neque doloremque, aut. Neque eius a voluptatibus?'
  },
  {
    email: '2@1.com',
    user_name: 'Beth',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'KNIZofPB8ZM',
    sc_url: 'https://soundcloud.com/lucia-goti/tracks',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus labore dolores illo voluptatem modi soluta incidunt ea laborum provident ab earum ducimus itaque vero non, nam quidem deleniti? Accusantium ea quibusdam laboriosam, vitae quam odio praesentium autem quisquam mollitia, tempore eos laborum repellendus laudantium ad corrupti adipisci cupiditate. Facere soluta harum reiciendis aliquam, obcaecati dicta magni delectus repellat. Nemo magnam reiciendis ab esse, quis animi impedit itaque repellat vel tempora eius magni perspiciatis ut commodi. Repellendus, laudantium facere necessitatibus, fugit ducimus alias eligendi tempora, nulla sed iure aliquid. Voluptas asperiores aliquam quaerat dicta neque doloremque, aut. Neque eius a voluptatibus?'
  },
  {
    email: '3@1.com',
    user_name: 'Roger',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'iaFK6AHhU8s',
    sc_url: 'https://soundcloud.com/randy-gerard-c-r/sets/study-electronic-chill',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus labore dolores illo voluptatem modi soluta incidunt ea laborum provident ab earum ducimus itaque vero non, nam quidem deleniti? Accusantium ea quibusdam laboriosam, vitae quam odio praesentium autem quisquam mollitia, tempore eos laborum repellendus laudantium ad corrupti adipisci cupiditate. Facere soluta harum reiciendis aliquam, obcaecati dicta magni delectus repellat. Nemo magnam reiciendis ab esse, quis animi impedit itaque repellat vel tempora eius magni perspiciatis ut commodi. Repellendus, laudantium facere necessitatibus, fugit ducimus alias eligendi tempora, nulla sed iure aliquid. Voluptas asperiores aliquam quaerat dicta neque doloremque, aut. Neque eius a voluptatibus?'
  },
  {
    email: '4@1.com',
    user_name: 'Kevin',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: '-BP1_1DpeBE',
    sc_url: 'https://soundcloud.com/astrtv/astr-operate'
  },
  {
    email: '5@1.com',
    user_name: 'Danny',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'WMqM4lZGiK0',
    sc_url: 'https://soundcloud.com/boniver/hey-ma'
  },
  {
    email: '6@1.com',
    user_name: 'Tom',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'DD0JjcYv6Sg',
    sc_url: 'https://soundcloud.com/lucia-goti/tracks'
  },
  {
    email: '7@1.com',
    user_name: 'Cyril',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 's88r_q7oufE',
    sc_url: 'https://soundcloud.com/randy-gerard-c-r/sets/study-electronic-chill'
  },
  {
    email: '8@1.com',
    user_name: 'Tara',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: '01yUzXQctcM',
    sc_url: 'https://soundcloud.com/astrtv/astr-operate'
  },
  {
    email: '9@1.com',
    user_name: 'Simone',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'ZYb_8MM1tGQ',
    sc_url: 'https://soundcloud.com/boniver/hey-ma'
  },
  {
    email: '10@1.com',
    user_name: 'Darryl',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'xnI8JEW7Ty4',
    sc_url: 'https://soundcloud.com/lucia-goti/tracks'
  },
  {
    email: '11@1.com',
    user_name: 'Simon',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'LOtkH5amC7s',
    sc_url: 'https://soundcloud.com/lovelovesyousoo/sets/jazzhip7c'
  },
  {
    email: '12@1.com',
    user_name: 'Walter',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'DD0JjcYv6Sg',
    sc_url: 'https://soundcloud.com/randy-gerard-c-r/sets/study-electronic-chill'
  },
  {
    email: '13@1.com',
    user_name: 'Stuart',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'WMqM4lZGiK0',
    sc_url: 'https://soundcloud.com/boniver/hey-ma'

  },
  {
    email: '14@1.com',
    user_name: 'Gerald',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'iaFK6AHhU8s',
    sc_url: 'https://soundcloud.com/lucia-goti/tracks'
  },
  {
    email: '15@1.com',
    user_name: 'Carl',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'zqNTltOGh5c',
    sc_url: 'https://soundcloud.com/lovelovesyousoo/sets/jazzhip7c'
  },
  {
    email: '16@1.com',
    user_name: 'Larry',
    age: 35,
    latitude: 30.12345,
    longitude: 155.65432,
    password: 'password',
    password_confirmation: 'password',
    youtube_vid_id: 'iaFK6AHhU8s',
    sc_url: 'https://soundcloud.com/randy-gerard-c-r/sets/study-electronic-chill'
  }
]

users = User.create!(user_hash)

puts 'creating photos...'

photo_hash = [
  {
    user: users[0],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/peter1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simone1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simone1.jpeg")).height,
    position: 0
  },
  {
    user: users[1],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/beth1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/beth1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/beth1.jpeg")).height,
    position: 0
  },
  {
    user: users[2],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/roger1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/roger1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/roger1.jpeg")).height,
    position: 0
  },
  {
    user: users[3],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/kevin1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/kevin1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/kevin1.jpeg")).height,
    position: 0
  },
  {
    user: users[4],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/danny1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/danny1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/danny1.jpeg")).height,
    position: 0
  },
  {
    user: users[5],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/tom1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/tom1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/tom1.jpeg")).height,
    position: 0
  },
  {
    user: users[6],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/cyril1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/cyril1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/cyril1.jpeg")).height,
    position: 0
  },
  {
    user: users[7],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/tara1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/tara1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/tara1.jpeg")).height,
    position: 0
  },
  {
    user: users[8],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/simone1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simone1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simone1.jpeg")).height,
    position: 0
  },
  {
    user: users[9],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/darryl1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/darryl1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/darryl1.jpeg")).height,
    position: 0
  },
  {
    user: users[10],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/simon1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simon1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/simon1.jpeg")).height,
    position: 0
  },
  {
    user: users[11],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/walter1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/walter1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/walter1.jpeg")).height,
    position: 0
  },
  {
    user: users[12],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/stuart1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/stuart1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/stuart1.jpeg")).height,
    position: 0
  },
  {
    user: users[13],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/gerald1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/gerald1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/gerald1.jpeg")).height,
    position: 0
  },
  {
    user: users[14],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/carl1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/carl1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/carl1.jpeg")).height,
    position: 0
  },
  {
    user: users[15],
    photo: File.open(Rails.root.join("db/fixtures/profile_photos/larry1.jpeg")),
    width: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/larry1.jpeg")).width,
    height: MiniMagick::Image.open(Rails.root.join("db/fixtures/profile_photos/larry1.jpeg")).height,
    position: 0
  }
]

Photo.create!(photo_hash)


