puts "Start seeding"

User.destroy_all
Tweet.destroy_all

puts "Seeding companies"
admin = User.create!(email: "admin@mail.com", password: "admin123", username: "admin", name: "admin", role: 1)
tweet1 = admin.tweets.create!(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet2 = admin.tweets.create!(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet3 = admin.tweets.create!(body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
admin.avatar.attach(io: File.open("db/images/avatar.jpg"), filename: "avatar")

member = User.create!(email: "member@mail.com", password: "user123", username: "member", name: "member", role: 0)
tweet1 = member.tweets.create!(body: "tweet 1 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet2 = member.tweets.create!(body: "tweet 2 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet3 = member.tweets.create!(body: "tweet 3 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet4 = member.tweets.create!(body: "tweet 3 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet5 = member.tweets.create!(body: "tweet 3 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
tweet6 = member.tweets.create!(body: "tweet 3 from member sit amet consectetur adipisicing elit. Expedita modi numquam tempore autem! Ea consequatur.")
member.avatar.attach(io: File.open("db/images/avatar.jpg"), filename: "avatar")

puts "End seeding"
