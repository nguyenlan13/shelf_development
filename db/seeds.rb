User.create(name: "Lan", username: "lan123", password: "password")
User.create(name: "Micah", username: "thor", password: "password")

jv = Author.create(name:"Jules Verne")
bs = Author.create(name: "Brandon Sanderson")
tr = Author.create(name: "Tony Robbins")
bb = Author.create(name: "Brendon Burchard")
jc = Author.create(name: "James Clear")
dg = Author.create(name: "David Goggins")
zr = Author.create(name: "Zat Rana")
js = Author.create(name: "Jay Shetty")

Book.create(title: "The Mysterious Island", year: 1874, author: jv)
Book.create(title: "Mistborn", year: 2006, author: bs)
hph = Book.create(title: "High Performance Habits", year: 2017, author: bb)
Book.create(title: "Atomic Habits", year: 2018, author: jc)
Book.create(title: "Can't Hurt Me", year: 2018, author: dg)

Podcast.create(name: "The Tony Robbins Podcast", episode_title: "Why We Do What We Do | Tony Explains the 6 Human Needs - an update of his famous 2006 TED talk", year: 2016, source: "https://podcasts.apple.com/us/podcast/why-we-do-what-we-do-tony/id1098413063?i=1000375383394&mt=2", author: tr)
op = Podcast.create(name: "On Purpose", episode_title: "Ray Dalio: On How to Define Success for Yourself and Set Your Goals", year: 2019, source: "https://podcasts.apple.com/us/podcast/on-purpose-with-jay-shetty/id1450994021?i=1000441509613", author: js)

wice = Article.create(title: "Who is in charge of your emotions?", year: 2017, source: "https://link.medium.com/8jcwwUor8Y", author: tr)
Article.create(title: "Claude Shannon: How a Genius Solves Problems", year: 2018, source: "https://link.medium.com/YxUPCOPr8Y", author: zr)


# Comment.create(user: lan, content:"my favorite book!", commentable: hph)


# FaveQuote.create(user: lan, quote: "If you leave your growth to randomness, you'll always live in the land of mediocrity", quotable: hph)
# FaveQuote.create(user: lan, quote: "What if everything in your life, including the most painful and traumatic events, was happening for you, not to you?", quotable: wice)
# FaveQuote.create(user: lan, quote: "It’s easy for our brain to get stuck in mental loops, and the best way to break these mental loops is to change the reference point. We are not changing our intuitive understanding of the problem or the core we have identified, just how it is expressed.")
# FaveQuote.create(user: lan, quote: "If you don't sacrifice for what you want, what you want becomes the sacrifice.", quotable: op)
# FaveQuote.create(user: lan, quote: "Habits are the compound interest of self improvement.")
# FaveQuote.create(user: lan, quote: "In order to feel less judged, judge less.")
