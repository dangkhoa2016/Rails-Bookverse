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

# Create Authors
authors = [
  { name: 'J.K. Rowling', bio: 'Author of the Harry Potter series' },
  { name: 'George R.R. Martin', bio: 'Author of A Song of Ice and Fire' },
  { name: 'J.R.R. Tolkien', bio: 'Author of The Lord of the Rings' },
  { name: 'Agatha Christie', bio: 'Queen of Crime, author of detective novels' },
  { name: 'Stephen King', bio: 'Master of horror, author of The Shining' },
  { name: 'Margaret Atwood', bio: 'Author of The Handmaid\'s Tale' },
  { name: 'Haruki Murakami', bio: 'Author of surreal fiction and jazz-infused narratives' },
  { name: 'Isabel Allende', bio: 'Author of The House of the Spirits' },
  { name: 'Neil Gaiman', bio: 'Author of American Gods' },
  { name: 'Isaac Asimov', bio: 'Author of Foundation and robot series' }
]

authors.each do |author|
  Author.find_or_create_by!(name: author[:name]) do |a|
    a.bio = author[:bio]
  end
end

# Create Publishers
publishers = [
  { name: 'Bloomsbury', address: 'London, UK' },
  { name: 'Bantam Books', address: 'New York, USA' },
  { name: 'Penguin Random House', address: 'New York, USA' },
  { name: 'HarperCollins', address: 'New York, USA' },
  { name: 'Macmillan', address: 'London, UK' },
  { name: 'Hachette', address: 'Paris, France' },
  { name: 'Simon & Schuster', address: 'New York, USA' },
  { name: 'Scholastic', address: 'New York, USA' },
  { name: 'Random House', address: 'New York, USA' },
  { name: 'Little, Brown and Company', address: 'New York, USA' },
  { name: 'Houghton Mifflin', address: 'Boston, USA' },
  { name: 'Collins Crime Club', address: 'London, UK' },
  { name: 'Doubleday', address: 'New York, USA' },
  { name: 'McClelland and Stewart', address: 'Toronto, Canada' },
  { name: 'Kodansha', address: 'Tokyo, Japan' },
  { name: 'Plaza & Janés', address: 'Barcelona, Spain' },
  { name: 'Headline Review', address: 'London, UK' },
  { name: 'Gnome Press', address: 'New York, USA' }
]

publishers.each do |publisher|
  Publisher.find_or_create_by!(name: publisher[:name]) do |p|
    p.address = publisher[:address]
  end
end

# Create Categories
categories = ['Fantasy', 'Adventure', 'Mystery', 'Science Fiction', 'Thriller', 'Romance', 'Historical Fiction', 'Drama', 'Horror', 'Young Adult']
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Create Books
books = [
  { title: 'Harry Potter and the Sorcerer\'s Stone', published_date: '1997-06-26', author_name: 'J.K. Rowling', publisher_name: 'Bloomsbury' },
  { title: 'A Game of Thrones', published_date: '1996-08-06', author_name: 'George R.R. Martin', publisher_name: 'Bantam Books' },
  { title: 'The Hobbit', published_date: '1937-09-21', author_name: 'J.R.R. Tolkien', publisher_name: 'Houghton Mifflin' },
  { title: 'Murder on the Orient Express', published_date: '1934-01-01', author_name: 'Agatha Christie', publisher_name: 'Collins Crime Club' },
  { title: 'The Shining', published_date: '1977-01-28', author_name: 'Stephen King', publisher_name: 'Doubleday' },
  { title: 'The Handmaid\'s Tale', published_date: '1985-08-29', author_name: 'Margaret Atwood', publisher_name: 'McClelland and Stewart' },
  { title: 'Norwegian Wood', published_date: '1987-09-04', author_name: 'Haruki Murakami', publisher_name: 'Kodansha' },
  { title: 'The House of the Spirits', published_date: '1982-11-01', author_name: 'Isabel Allende', publisher_name: 'Plaza & Janés' },
  { title: 'American Gods', published_date: '2001-06-19', author_name: 'Neil Gaiman', publisher_name: 'Headline Review' },
  { title: 'Foundation', published_date: '1951-06-01', author_name: 'Isaac Asimov', publisher_name: 'Gnome Press' }
]

books.each do |book|
  author = Author.find_by!(name: book[:author_name])
  publisher = Publisher.find_by!(name: book[:publisher_name])
  created_book = Book.find_or_create_by!(title: book[:title], published_date: book[:published_date], author: author, publisher: publisher)
  
  # Assign random categories to each book (up to 3 categories per book)
  created_book.categories = Category.order("RANDOM()").limit(rand(1..4))
end

# Create Reviews
Book.all.each do |book|
  3.times do
    Review.create!(content: "Great book!", rating: rand(1..5), book: book)
  end
end

# Create Libraries
libraries = [
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
  Library.find_or_create_by!(name: library[:name]) do |l|
    l.address = library[:address]
  end
end

# Create Members
10.times do |i|
  library = Library.order("RANDOM()").first
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: ['.', '_', '-'].sample)
  Member.find_or_create_by!(email: email) do |m|
    m.first_name = first_name
    m.last_name = last_name
    m.library = library
  end
end

# Create Book Loans
Book.all.each do |book|
  Member.all.sample(2).each do |member|
    BookLoan.find_or_create_by!(book: book, member: member, borrowed_on: Faker::Date.between(from: 2.months.ago, to: Date.today), status: [:borrowed, :returned].sample)
  end
end

# Create Author Profiles
Author.all.each do |author|
  AuthorProfile.find_or_create_by!(author: author) do |profile|
    profile.bio = "#{author.name} is a well-known author in the world of literature."
  end
end

puts "Sample data created!"
