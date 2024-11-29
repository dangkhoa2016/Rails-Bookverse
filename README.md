# Rails Bookverse

Rails Bookverse is a comprehensive web application for managing books, authors, publishers, libraries, members, and book loans. Built with Ruby on Rails, the platform aims to provide an easy-to-use, efficient, and scalable system for managing a wide variety of data related to books and reading activities.

## Features

- **Book Management**: Store and manage details about books, including title, author, publisher, published date, and categories.
- **Author Profiles**: Create and manage author profiles with biographical information and social media links.
- **Publisher Management**: Manage publishers and their information.
- **Category System**: Categorize books for better search and organization.
- **Member Management**: Manage library members, track their information, and link them to a specific library.
- **Book Loans**: Track book loans, including borrow and return dates, and loan statuses.
- **Book Reviews**: Allow users to write and view reviews and ratings for books.
- **Library System**: Manage multiple libraries, including their address and associated members.

## Technologies Used

- Ruby on Rails (version 7.x)
- Sqlite3 (or any other supported database)
- ActiveRecord ORM
- Bootstrap 5 (for frontend UI)
- RSpec (for testing)

## Installation

To get started with Rails Bookverse locally, follow the steps below:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/dangkhoa2016/Rails-Bookverse.git
    cd Rails-Bookverse
    ```

2. **Install dependencies:**
    ```bash
    bundle install
    ```

3. **Setup the database:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed  # Optional: Seed the database with initial data
    ```

4. **Start the Rails server:**
    ```bash
    rails server
    ```

    Now, navigate to `http://localhost:3000` in your browser.

## License

Rails Bookverse is open source and available under the MIT License. See the [LICENSE](LICENSE) file for more information.
