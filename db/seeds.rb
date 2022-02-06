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

member = User.create(email: "member@mail.com", password: "supersecret", username: "member", name: "member", role: 0)
member.avatar.attach(io: File.open("db/images/avatar.jpg"), filename: "avatar")


tweet1.replies.create(body: "reply test 3", user_id: 1)
tweet1.replies.create(body: "reply test 2", user_id: 1)
tweet2.replies.create(body: "reply test 1", user_id: 1)
tweet1.likes.create(user_id: 1)
tweet2.likes.create(user_id: 1)

puts "End seeding"

puts "Extra seeding"

user = User.new(name: "Erina Nakiri", username: "ENakiri", email: "erina@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Erina.jpg'), filename: 'Erina.jpg')
user.save

user.tweets.create(body:"No te conozco. No me hables como si me conocieras.")

user = User.new(name: "Alice Nakiri", username: "ANakiri", email: "alice@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Alice.jpg'), filename: 'Alice.jpg')
user.save

user.tweets.create(body:"Holaaa Javi-kun!")

user = User.new(name: "Soy Goku", username: "Goku", email: "kakarotto@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/goku.png'), filename: 'goku.png')
user.save

user.tweets.create(body:"Hola! Soy Goku! Kamehame haaaaaaaaaaaaaaaaa")

user = User.new(name: "Yellow rabbid", username: "Pikachu", email: "pikachu@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Pikachu.jpg'), filename: 'Pikachu.jpg')
user.save

user.tweets.create(body:"Pika pi?")

user = User.new(name: "Player 456", username: "Unknown", email: "p456@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Player456.jpeg'), filename: 'Player456.jpeg')
user.save

user.tweets.create(body:"Quieres saber por que me pinte el pelo de rojo?")

user = User.new(name: "The Great Thanus", username: "Thanos", email: "thanos@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Thanos.jpeg'), filename: 'Thanos.jpeg')
user.save

user.tweets.create(body:"Que año es este?")

user = User.new(name: "Yisus", username: "Yisus", email: "yisus@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/Yisus.png'), filename: 'Yisus.png')
user.save

user.tweets.create(body:"Hola a todos! Ya estoy aqui!")

user = User.new(name: "Want a punch?", username: "Saitama", email: "saitama@mail.com", password: "letmein")
user.avatar.attach(io: File.open('app/assets/images/saitama.png'), filename: 'saitama.png')
user.save

user.tweets.create(body:"Holi?")
puts "End of seeds"