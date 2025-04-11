# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
ActiveRecord::Base.logger = Logger.new(STDOUT)


# Real Authors
authors = [
  {
    first_name: 'J.K.', last_name: 'Rowling',
    email: 'jk.rowling@hogwarts.com',
    bio: 'Author of the Harry Potter series, the best-selling book series in history.'
  },
  {
    first_name: 'George', last_name: 'Orwell',
    email: 'george.orwell@bigbrother.com',
    bio: 'Author of 1984, a dystopian novel that explores the dangers of totalitarianism.'
  },
  {
    first_name: 'Haruki', last_name: 'Murakami',
    email: 'murakami@bookworld.com',
    bio: 'Japanese author known for his surreal fiction and blending of Western and Japanese culture.'
  },
  {
    first_name: 'Jane', last_name: 'Austen',
    email: 'jane.austen@literature.com',
    bio: 'Author of Pride and Prejudice, a classic novel of manners set in Regency England.'
  },
  {
    first_name: 'J.R.R.', last_name: 'Tolkien',
    email: 'jrr.tolkien@middleearth.com',
    bio: 'Author of The Lord of the Rings, a high fantasy epic set in the world of Middle-earth.'
  },
  {
    first_name: 'Mark', last_name: 'Twain',
    email: 'mark.twain@riverboat.com',
    bio: 'American author known for his wit and humor, best known for The Adventures of Huckleberry Finn.'
  },
  {
    first_name: 'Stephen', last_name: 'King',
    email: 'stephen.king@darktower.com',
    bio: 'Master of horror and suspense, author of The Shining, It, and many other best-selling novels.'
  },
  {
    first_name: 'Agatha', last_name: 'Christie',
    email: 'agatha.christie@crimefrench.com',
    bio: 'Queen of mystery, author of the Hercule Poirot and Miss Marple detective series.'
  },
  {
    first_name: 'Isaac', last_name: 'Asimov',
    email: 'isaac.asimov@robotics.com',
    bio: 'Author of the Foundation series and creator of the Three Laws of Robotics.'
  },
  {
    first_name: 'F. Scott', last_name: 'Fitzgerald',
    email: 'fitzgerald@gatsby.com',
    bio: 'American author known for The Great Gatsby, a classic novel of the Jazz Age.'
  }
]

authors.each do |author|
  new_author = Author.create!(first_name: author[:first_name], last_name: author[:last_name], email: author[:email])

  # Author Profiles
  AuthorProfile.create!(
    author_id: new_author.id,
    bio: author[:bio],
    social_facebook: "https://facebook.com/#{Faker::Internet.user_name(specifier: new_author.full_name)}",
    social_twitter: "https://twitter.com/#{Faker::Internet.user_name(specifier: new_author.full_name)}",
    social_instagram: "https://instagram.com/#{Faker::Internet.user_name(specifier: new_author.full_name)}",
    social_linkedin: "https://linkedin.com/#{Faker::Internet.user_name(specifier: new_author.full_name)}",
    social_youtube: "https://youtube.com/#{Faker::Internet.user_name(specifier: new_author.full_name)}",
    active: true
  )
end

# Real Books
books = [
  { title: 'Harry Potter and the Sorcerer\'s Stone', isbn: '9780747532743', pages: 309, price: 19.99, stock: 500 },
  { title: '1984', isbn: '9780451524935', pages: 328, price: 15.99, stock: 350 },
  { title: 'Norwegian Wood', isbn: '9780099448570', pages: 296, price: 14.99, stock: 400 },
  { title: 'Pride and Prejudice', isbn: '9781503290563', pages: 279, price: 10.99, stock: 600 },
  { title: 'The Fellowship of the Ring', isbn: '9780618574940', pages: 423, price: 25.00, stock: 450 },
  { title: 'The Adventures of Huckleberry Finn', isbn: '9780451530912', pages: 366, price: 13.99, stock: 300 },
  { title: 'The Shining', isbn: '9780385121675', pages: 659, price: 21.99, stock: 500 },
  { title: 'Murder on the Orient Express', isbn: '9780062693662', pages: 256, price: 12.99, stock: 700 },
  { title: 'I, Robot', isbn: '9780553382563', pages: 320, price: 16.99, stock: 350 },
  { title: 'The Great Gatsby', isbn: '9780743273565', pages: 180, price: 10.50, stock: 450 },
  { title: 'To Kill a Mockingbird', isbn: '9780061120084', pages: 281, price: 18.99, stock: 600 },
  { title: 'The Catcher in the Rye', isbn: '9780316769488', pages: 277, price: 14.99, stock: 400 },
  { title: 'The Hunger Games', isbn: '9780439023528', pages: 374, price: 14.99, stock: 550 },
  { title: 'The Road', isbn: '9780307387899', pages: 287, price: 16.99, stock: 300 },
  { title: 'Brave New World', isbn: '9780060850524', pages: 268, price: 13.99, stock: 450 },
  { title: 'The Hobbit', isbn: '9780618968633', pages: 310, price: 15.99, stock: 500 },
  { title: 'Wuthering Heights', isbn: '9780141439556', pages: 416, price: 12.50, stock: 400 },
  { title: 'The Picture of Dorian Gray', isbn: '9780141439570', pages: 254, price: 10.99, stock: 300 },
  { title: 'Frankenstein', isbn: '9780486282114', pages: 280, price: 9.99, stock: 350 },
  { title: 'Slaughterhouse-Five', isbn: '9780440180296', pages: 275, price: 12.99, stock: 450 },
  { title: 'The Silent Patient', isbn: '9781250301697', pages: 325, price: 19.99, stock: 400 },
  { title: 'Where the Crawdads Sing', isbn: '9780735219090', pages: 384, price: 16.99, stock: 450 },
  { title: 'Educated', isbn: '9780399590504', pages: 352, price: 18.00, stock: 350 },
  { title: 'Becoming', isbn: '9781524763138', pages: 448, price: 27.99, stock: 400 },
  { title: 'The Goldfinch', isbn: '9780316055437', pages: 771, price: 24.99, stock: 500 },
  { title: 'Circe', isbn: '9780316556347', pages: 400, price: 17.99, stock: 450 },
  { title: 'A Little Life', isbn: '9780804172707', pages: 720, price: 19.99, stock: 300 },
  { title: 'Normal People', isbn: '9781984822178', pages: 269, price: 15.99, stock: 350 },
  { title: 'The Night Circus', isbn: '9780307744432', pages: 387, price: 22.00, stock: 400 },
  { title: 'Big Little Lies', isbn: '9780399587207', pages: 460, price: 15.99, stock: 450 }
]

books.each do |book|
  new_book = Book.create!(
    title: book[:title],
    isbn: book[:isbn],
    pages: book[:pages],
    price: book[:price],
    stock: book[:stock],
    active: true
  )
end

# Real Categories
categories = [
  { name: 'Fantasy', description: 'Books involving magical elements and fantastical worlds.' },
  { name: 'Science Fiction', description: 'Books about futuristic concepts, advanced technology, space exploration.' },
  { name: 'Mystery', description: 'Books with suspenseful plots centered on solving a mystery.' },
  { name: 'Historical Fiction', description: 'Books set in a specific historical period, blending fact with fiction.' },
  { name: 'Romance', description: 'Books focused on relationships and love stories.' },
  { name: 'Thriller', description: 'Books characterized by high tension, excitement, and fast-paced action.' },
  { name: 'Horror', description: 'Books designed to evoke fear, dread, or terror in the reader.' },
  { name: 'Adventure', description: 'Books that focus on exciting and often dangerous journeys or quests.' },
  { name: 'Biography', description: 'Books that tell the life story of an individual, based on factual events.' },
  { name: 'Non-fiction', description: 'Books based on factual information, including history, science, and self-help.' },
  { name: 'Self-Help', description: 'Books designed to provide guidance or advice on personal improvement.' },
  { name: 'Young Adult (YA)', description: 'Books primarily targeted at a teenage audience, often featuring coming-of-age stories.' },
  { name: 'Children\'s Fiction', description: 'Books written for a young audience, typically with simple language and imaginative stories.' },
  { name: 'Poetry', description: 'Books containing works of verse, often expressing feelings and ideas in a rhythmic form.' },
  { name: 'Graphic Novels', description: 'Books that use a combination of text and graphic art to tell a story.' },
  { name: 'Cookbooks', description: 'Books providing recipes and guidance on preparing food.' },
  { name: 'Travel', description: 'Books that explore different parts of the world, focusing on places, cultures, and experiences.' },
  { name: 'Philosophy', description: 'Books that explore fundamental questions about existence, knowledge, and ethics.' },
  { name: 'Art', description: 'Books focused on visual arts, including painting, sculpture, photography, and design.' },
  { name: 'Health & Fitness', description: 'Books focused on maintaining physical and mental well-being.' },
  { name: 'Business', description: 'Books that discuss topics related to commerce, management, entrepreneurship, and finance.' },
  { name: 'Psychology', description: 'Books that examine the mind and behavior, often exploring mental health and human development.' },
  { name: 'Politics', description: 'Books that discuss political theory, governance, and current events.' },
  { name: 'Religion', description: 'Books exploring religious beliefs, practices, and spiritual experiences.' },
  { name: 'Humor', description: 'Books that entertain and make readers laugh, often through satire, comedy, or wit.' },
  { name: 'Literary Fiction', description: 'Books known for their artistic merit, often focused on character development and theme rather than plot.' },
  { name: 'Classics', description: 'Books that are considered exemplary or noteworthy works of literature from the past.' },
  { name: 'Crime', description: 'Books focusing on criminal activities, law enforcement, and justice.' },
  { name: 'Environmental', description: 'Books that focus on nature, the environment, and the relationship between humans and the planet.' }
]

categories.each do |category|
  Category.create!(name: category[:name], description: category[:description], active: true)
end

# Real Genres
genres = [
  { name: 'Space Fantasy', description: 'A blend of fantasy elements and space exploration, often set in distant galaxies.' },
  { name: 'Apocalyptic', description: 'Books set in a post-apocalyptic world, often dealing with survival and the collapse of society.' },
  { name: 'Contemporary Fiction', description: 'Books set in modern-day settings, often focusing on relationships and personal struggles.' },
  { name: 'Historical Adventure', description: 'Books set in a historical period, focused on action-packed adventures and explorations.' },
  { name: 'Satire', description: 'Books that use humor, irony, or ridicule to criticize or mock human vice and folly.' },
  { name: 'Metaphysical Fiction', description: 'Books that explore abstract philosophical concepts, often blending reality with speculative ideas.' },
  { name: 'Political Thriller', description: 'Books that combine suspense and political intrigue, often involving conspiracy or government corruption.' },
  { name: 'Cyberpunk Noir', description: 'A subgenre of cyberpunk with a dark, pessimistic tone and emphasis on moral ambiguity and dystopian settings.' },
  { name: 'Mythology', description: 'Books based on or inspired by ancient myths, gods, and legendary creatures from various cultures.' },
  { name: 'Alternate Reality', description: 'Books that explore parallel universes, alternate dimensions, or different versions of reality.' },
  { name: 'Techno-thriller', description: 'Books that incorporate technology into a thriller, often featuring hacking, artificial intelligence, or high-tech gadgets.' },
  { name: 'Espionage', description: 'Books centered around spying, covert operations, and the tension between intelligence agencies and foreign governments.' },
  { name: 'Urban Fiction', description: 'Books set in modern urban environments, often dealing with issues such as crime, love, and personal conflict.' },
  { name: 'Psychological Horror', description: 'Books that evoke fear through psychological tension and the exploration of disturbed minds.' },
  { name: 'Eco-fiction', description: 'Books that focus on the environment, sustainability, and ecological issues.' },
  { name: 'Cozy Mystery', description: 'Mystery books featuring amateur sleuths, often set in small communities with little graphic violence.' },
  { name: 'Romantic Comedy', description: 'Books that mix romance and humor, often with quirky characters and light-hearted plots.' },
  { name: 'Surrealism', description: 'Books that explore the bizarre, often blending dream-like scenarios with everyday life.' },
  { name: 'Military Fiction', description: 'Books that focus on war, military life, and the experiences of soldiers, often with tactical or strategic themes.' },
  { name: 'Space Opera', description: 'A subgenre of science fiction focused on large-scale space adventures, often with interstellar conflict and deep space exploration.' },
  { name: 'Cultural Fiction', description: 'Books that explore the experiences, challenges, and values of a particular culture or ethnicity.' },
  { name: 'Legal Thriller', description: 'Books focused on legal battles, courtrooms, and legal proceedings, often with a fast-paced, suspenseful plot.' },
  { name: 'Feminist Fiction', description: 'Books that explore women’s experiences, gender equality, and feminist themes.' },
  { name: 'Absurdist Fiction', description: 'Books that focus on the absurdity of human existence, often challenging conventional ideas of meaning and reality.' },
  { name: 'Southern Gothic', description: 'Books set in the American South, characterized by dark, eerie settings and often dealing with themes of decay, violence, and social issues.' },
  { name: 'LGBTQ+ Fiction', description: 'Books that explore the experiences, identities, and relationships within the LGBTQ+ community.' },
  { name: 'Survival Fiction', description: 'Books focused on characters overcoming dire situations, often in remote or dangerous environments.' },
  { name: 'Revenge Fiction', description: 'Books centered on characters seeking vengeance or justice, often involving morally complex characters.' }
]

genres.each do |genre|
  Genre.create!(name: genre[:name], description: genre[:description], active: true)
end

# Real Tags
tags = [
  { name: 'Dragons' },
  { name: 'Magic' },
  { name: 'Space' },
  { name: 'Time Travel' },
  { name: 'Aliens' },
  { name: 'British Literature' },
  { name: 'Crime' },
  { name: 'Suspense' },
  { name: 'Love Triangle' },
  { name: 'War' },
  { name: 'Historical' },
  { name: 'Young Adult' },
  { name: 'Drama' },
  { name: 'Horror' },
  { name: 'Comedy' }
]

tags.each do |tag|
  Tag.create!(name: tag[:name], active: true)
end

# Add Categories, Genres, and Tags to Books
Book.all.each do |book|
  book.categories = Category.order('random()').first(rand(1..3))
  book.genres = Genre.order('random()').first(rand(1..3))
  book.tags = Tag.order('random()').first(rand(1..3))
  book.authors = Author.reorder('random()').first(rand(1..3))
end

# Libraries
libraries = [
  { name: 'New York Public Library', address: '476 5th Ave, New York, NY 10018' },
  { name: 'Los Angeles Public Library', address: '630 W 5th St, Los Angeles, CA 90071' },
  { name: 'Chicago Public Library', address: '400 S State St, Chicago, IL 60605' },
  { name: 'San Francisco Public Library', address: '100 Larkin St, San Francisco, CA 94102' },
  { name: 'Boston Public Library', address: '700 Boylston St, Boston, MA 02116' },
  { name: 'Central Library', address: '123 Main St' },
  { name: 'Westside Library', address: '456 West St' },
  { name: 'East End Library', address: '789 East St' },
  { name: 'Downtown Library', address: '101 Downtown Ave' },
  { name: 'Uptown Library', address: '202 Uptown Rd' },
  { name: 'City Park Library', address: '303 City Park Ln' },
  { name: 'Northgate Library', address: '404 Northgate Dr' },
  { name: 'Riverfront Library', address: '505 River Rd' },
  { name: 'Mountainview Library', address: '606 Mountain Blvd' },
  { name: 'Southside Library', address: '707 South Rd' }
]

libraries.each do |library|
  Library.create!(name: library[:name], address: library[:address], active: true)
end

# Create Members
50.times do |i|
  library = Library.order("RANDOM()").first
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: [ '.', '_', '-' ].sample)
  Member.find_or_create_by!(email: email) do |m|
    m.first_name = first_name
    m.last_name = last_name
    m.library = library
  end
end

# Real Publishers
publishers = [
  { name: 'Penguin Random House', address: '1745 Broadway, Chicago, IL 10019', phone_number: '212-366-2000', email: 'contact@penguinrandomhouse.com', website: 'https://www.penguinrandomhouse.com', ceo_name: 'Markus Dohle', established_year: 1927 },
  { name: 'HarperCollins', address: '195 Broadway, Los Angeles, CA 10007', phone_number: '212-207-7000', email: 'contact@harpercollins.com', website: 'https://www.harpercollins.com', ceo_name: 'Brian Murray', established_year: 1817 },
  { name: 'Macmillan', address: '120 Broadway, Boston, MA 10271', phone_number: '212-674-5151', email: 'info@macmillan.com', website: 'https://www.macmillan.com', ceo_name: 'John Sargent', established_year: 1843 },
  { name: 'Bloomsbury', address: '50 Bedford Square, London, WC1B 3DP', phone_number: '020-7631-5600', email: 'info@bloomsbury.local', website: 'https://www.bloomsbury.com', ceo_name: 'Nigel Newton', established_year: 1986 },
  { name: 'Bantam Books', address: '1745 Broadway, Dallas, TX 10019', phone_number: '212-782-9000', email: 'bantam.books@test.sample', website: 'https://www.bantambooks.com', ceo_name: 'Suzanne Herz', established_year: 1945 },
  { name: 'Hachette', address: '1290 Avenue of the Americas, Miami, FL 10104', phone_number: '212-364-1100', email: 'contact@hachette.local', website: 'https://www.hachette.com', ceo_name: 'Arnaud Nourry', established_year: 1826 },
  { name: 'Penguin Random House', address: '1745 Broadway, Chicago, IL 10019', phone_number: '212-366-2000', email: 'contact@penguinrandomhouse.com', website: 'https://www.penguinrandomhouse.com', ceo_name: 'Markus Dohle', established_year: 1927 },
  { name: 'HarperCollins', address: '195 Broadway, Los Angeles, CA 10007', phone_number: '212-207-7000', email: 'contact@harpercollins.com', website: 'https://www.harpercollins.com', ceo_name: 'Brian Murray', established_year: 1817 },
  { name: 'Macmillan', address: '120 Broadway, Boston, MA 10271', phone_number: '212-674-5151', email: 'info@macmillan.com', website: 'https://www.macmillan.com', ceo_name: 'John Sargent', established_year: 1843 },
  { name: 'Simon & Schuster', address: '1230 Avenue of the Americas, San Francisco, CA 10020', phone_number: '212-698-7000', email: 'contact@simonandschuster.com', website: 'https://www.simonandschuster.com', ceo_name: 'Jonathan Karp', established_year: 1924 },
  { name: 'Scholastic', address: '557 Broadway, Seattle, WA 10012', phone_number: '212-343-6100', email: 'info@scholastic.com', website: 'https://www.scholastic.com', ceo_name: 'Richard Robinson', established_year: 1920 },
  { name: 'Random House', address: '1745 Broadway, Houston, TX 10019', phone_number: '212-782-9000', email: 'contact@randomhouse.com', website: 'https://www.randomhouse.com', ceo_name: 'Markus Dohle', established_year: 1927 },
  { name: 'Little, Brown and Company', address: '237 Park Avenue, Denver, CO 10017', phone_number: '212-572-2080', email: 'info@hachettebookgroup.com', website: 'https://www.littlebrown.com', ceo_name: 'Michael Pietsch', established_year: 1837 },
  { name: 'Houghton Mifflin', address: '125 High Street, Boston, MA 02110', phone_number: '800-225-3362', email: 'customer.service@hmhco.com', website: 'https://www.hmhco.com', ceo_name: 'Jack Lynch', established_year: 1832 },
  { name: 'Collins Crime Club', address: '77-79 Great Peter Street, London SW1P 2EZ, UK', phone_number: '+44 20 7631 5600', email: 'info@harpercollins.co.uk', website: 'https://www.harpercollins.co.uk', ceo_name: 'Charlie Redmayne', established_year: 1930 },
  { name: 'Doubleday', address: '1745 Broadway, Phoenix, AZ 10019', phone_number: '212-366-2000', email: 'contact@doubleday.com', website: 'https://www.doubleday.com', ceo_name: 'Bertelsmann', established_year: 1897 },
  { name: 'McClelland and Stewart', address: '481 University Avenue, Toronto, ON M5G 2E9', phone_number: '416-979-2214', email: 'info@mcclelland.com', website: 'https://www.mcclelland.com', ceo_name: 'Doug Pepper', established_year: 1906 },
  { name: 'Kodansha', address: '1-14-5, Kanda-Jimbocho, Chiyoda-ku, Tokyo 101-8050, Japan', phone_number: '+81 3-3230-6161', email: 'info@kodansha.com', website: 'https://www.kodansha.com', ceo_name: 'Nobuyuki Idei', established_year: 1909 },
  { name: 'Plaza & Janés', address: 'Carrer de Pau Claris, 163, 08037 Barcelona, Spain', phone_number: '+34 93 410 46 00', email: 'contacto@plazajanes.com', website: 'https://www.plazajanes.com', ceo_name: 'José Ortega', established_year: 1991 },
  { name: 'Headline Review', address: '75 Varley Street, London E3 2EN, UK', phone_number: '+44 20 7873 8000', email: 'contact@headline.co.uk', website: 'https://www.headline.co.uk', ceo_name: 'Ian Chapman', established_year: 1986 },
  { name: 'Gnome Press', address: '16 East 52nd Street, Chicago, IL 10022', phone_number: '212-355-6600', email: 'info@gnomepress.com', website: 'https://www.gnomepress.com', ceo_name: 'Martin H. Greenberg', established_year: 1948 }
]

publishers.each do |publisher|
  Publisher.create!(
    name: publisher[:name],
    address: publisher[:address],
    phone_number: publisher[:phone_number],
    email: publisher[:email],
    website: publisher[:website],
    ceo_name: publisher[:ceo_name],
    established_year: publisher[:established_year],
    active: true
  )
end

book_editions = [
  'first edition',
  'special edition',
  'deluxe edition',
  'paperback edition',
  'hardcover edition',
  'eBook edition',
  'audiobook edition',
  'collector\'s edition',
  'limited edition',
  'anniversary edition',
  'revised edition',
  'illustrated edition',
  'signed edition',
  'international edition',
  'reprint edition',
  'boxed set edition',
  'screenplay edition',
  'advance reader\'s copy (ARC)',
  'library edition',
  'digital edition'
]

# Published Dates for Books
book_editions.each do |edition|
  Book.reorder('random()').first(rand(1..3)).each do |book|
    Publisher.reorder('random()').first(rand(1..2)).each do |publisher|
      PublishedDate.create!(
        book_id: book.id,
        publisher_id: publisher.id,
        published_date: Faker::Date.between(from: 50.years.ago, to: Date.today),
        edition: edition.titleize
      )
    end
  end
end

review_comments = [
  'This is an amazing book. I couldn\'t put it down!',
  'A thrilling read from start to finish. Highly recommend!',
  'It\'s a masterpiece! The writing is beautiful, and the story is so captivating.',
  'I enjoyed it, but some parts felt a bit slow. Still worth reading.',
  'An absolute page-turner! I finished it in one sitting.',
  'The characters are so well-written, and the plot kept me on the edge of my seat!',
  'I was hooked from the first page. Truly an unforgettable read.',
  'The plot was interesting, but I wish the ending had been more satisfying.',
  'An emotional rollercoaster. I laughed, cried, and everything in between.',
  'A unique and thought-provoking story. One of the best books I\'ve read in a long time.',
  'While it wasn\'t my favorite genre, the book was well-written and engaging.',
  'An excellent book for fans of historical fiction. The attention to detail is impressive.',
  'A classic for a reason. This book has everything: romance, suspense, and great characters.',
  'The writing style didn\'t click with me, but I can see why others love it.',
  'A fun, lighthearted read. Perfect for a weekend getaway.',
  'So many twists and turns! Definitely keeps you guessing.',
  'I absolutely loved this book. The author really knows how to capture the reader\'s attention.',
  'It was good, but I felt like it dragged in some parts. Still a solid read.',
  'The themes in this book are incredibly important and handled with care.',
  'I didn\'t expect to love this book as much as I did. Totally exceeded my expectations!',
  'The book didn\'t resonate with me, but I can see its appeal for fans of the genre.'
]

# Reviews for Books
review_comments.each do |comment|
  Book.reorder('random()').first(rand(1..2)).each do |book|
    Review.create!(
      content: comment,
      rating: rand(1..10),
      book_id: book.id,
      active: true
    )
  end
end

# Create Book Loans
Book.all.each do |book|
  Member.reorder('random()').first(rand(1..4)).each do |member|
    BookLoan.find_or_create_by!(book: book, member: member, borrowed_on: Faker::Date.between(from: 2.months.ago, to: Date.today), status: BookLoan.statuses.keys.sample)
  end
end

puts "Sample data created!"
