User.create(name: "Lan", username: "lan123", password: "password")
User.create(name: "Micah", username: "mshute", password: "password")

jv = Author.create(name:"Jules Verne")
bs = Author.create(name: "Brandon Sanderson")

Book.create(title: "The Mysterious Island", year: 1874, author: jv)
Book.create(title: "Mistborn", year: 2006, author: bs)