# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "hello seeds"

user_P = User.create!(email: 'patrickstar@gmail.com', password: 'secretpassword', password_confirmation: 'secretpassword', username: 'patricks')

pet_P = Pet.create!(name: 'Glary', user_id: user_P.id)

Post.create!(content: 'Snail life #hashtag', user_id: user_P.id, pet_id: pet_P.id)
Post.create!(content: 'Starfish daycare', user_id: user_P.id, pet_id: pet_P.id)
Post.create!(content: 'Can a crab be a pet?', user_id: user_P.id, pet_id: pet_P.id)
Post.create!(content: 'Glary for president.', user_id: user_P.id, pet_id: pet_P.id)
Post.create!(content: 'Glary', user_id: user_P.id, pet_id: pet_P.id)

user_S = User.create!(email: 'spongebob@gmail.com', password: 'anothersecret', password_confirmation: 'anothersecret', username: 'spongebob')

pet_S = Pet.create!(name: 'Gary', user_id: user_S.id)

Post.create!(content: 'Gary where are you?', user_id: user_S.id, pet_id: pet_S.id)
Post.create!(content: 'Has anyone seen Gary?', user_id: user_S.id, pet_id: pet_S.id)
Post.create!(content: 'Gary is missing!', user_id: user_S.id, pet_id: pet_S.id)
Post.create!(content: 'Nevermind, he was taking a nap.', user_id: user_S.id, pet_id: pet_S.id)
Post.create!(content: 'Patrick are you home?', user_id: user_S.id, pet_id: pet_S.id)

