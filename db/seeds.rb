puts "Start seeding"

Like.destroy_all
Tweet.destroy_all
User.destroy_all

puts "Seeding "
admin = User.create(email: "admin@mail.com", password: "supersecret", username: "admin", name: "admin", role: 1)
tweet1 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet2 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet3 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")

admin.avatar.attach(io: File.open("db/images/avatar.jpg"), filename: "avatar")

tweet1.replies.create(body: "reply test 3", user_id: 1)
tweet1.replies.create(body: "reply test 2", user_id: 1)
tweet2.replies.create(body: "reply test 1", user_id: 1)
tweet1.likes.create(user_id: 1)
tweet2.likes.create(user_id: 1)

puts "End seeding"
