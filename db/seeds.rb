puts "Start seeding"

User.destroy_all
Tweet.destroy_all

puts "Seeding companies"
admin = User.create(email: "admin@mail.com", password: "admin123", username: "admin", name: "admin", role: 1)
tweet1 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet2 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet3 = admin.tweets.create(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")

admin.avatar.attach(io: File.open("db/images/avatar.jpg"), filename: "avatar")

puts "End seeding"
