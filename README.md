# Rails Bookverse

> 🌐 Language / Ngôn ngữ: **English** | [Tiếng Việt](README.vi.md)

Rails Bookverse is a comprehensive web application for managing books, authors, publishers, libraries, members, and book loans. Built with Ruby on Rails 7.2, it provides a clean admin-style UI with full CRUD for all entities, dynamic search-enabled select fields, multi-language support, and multiple list view modes.

## Features

- **Dashboard**: Home page with summary charts and activity widgets powered by Chart.js.
- **Book Management**: Store and manage books with title, summary, ISBN, pages, price, and stock. Books can be linked to multiple authors, categories, genres, and tags.
- **Author Management**: Manage authors with full-name, email, and active status. Each author can have one or more author profiles.
- **Author Profiles**: Store biographical information and social media links (Facebook, Twitter, Instagram, LinkedIn, YouTube) per author.
- **Publisher Management**: Manage publishers with name, address, phone number, email, established year, website, and CEO name.
- **Published Dates**: Track edition and publication date for each book–publisher combination.
- **Category, Genre & Tag System**: Organize books with categories (with descriptions), genres, and free-form tags.
- **Library Management**: Manage multiple libraries with name and address.
- **Member Management**: Manage library members, track first name, last name, email, and link each member to a library.
- **Book Loans**: Track book loans with borrow date, return date, and status (e.g. returned, in_processing, renewed, cancelled, expired).
- **Book Reviews**: Write and view star-rated reviews with content for each book.
- **Multi-language UI**: Interface supports English and Vietnamese, switchable per session.
- **Multiple view modes**: Browse any list as a card, list, or table view — preference saved in a cookie.
- **Dynamic association selects**: Association dropdowns use Choices.js with remote search and infinite scroll (via a custom Stimulus controller).
- **Pagination**: All lists are paginated using Pagy.

## Data Model

```
Authors ──< AuthorProfiles
Authors >──< Books >──< Categories
                   >──< Genres
                   >──< Tags
                   >──< Publishers  (through PublishedDates)
                   ──< Reviews
                   ──< BookLoans ──> Members ──> Libraries
```

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Ruby 3.4.1 |
| Framework | Ruby on Rails 7.2 |
| Database | SQLite3 |
| Frontend CSS | CoreUI 5 (Bootstrap-based admin template) |
| CSS build | Sass + PostCSS (via `cssbundling-rails`) |
| JavaScript | Hotwire (Turbo + Stimulus) via importmap |
| JS libraries | Choices.js 11, Chart.js 4, SimpleBar |
| Pagination | Pagy 9 |
| Testing | Minitest, Capybara, Selenium (Chrome headless) |

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/dangkhoa2016/Rails-Bookverse.git
   cd Rails-Bookverse
   ```

2. **Install Ruby dependencies:**
   ```bash
   bundle install
   ```

3. **Install JavaScript/CSS dependencies:**
   ```bash
   yarn install
   ```

4. **Build CSS assets:**
   ```bash
   yarn build:css
   ```

5. **Set up the database:**
   ```bash
   bin/rails db:create db:migrate
   bin/rails db:seed   # Optional: loads sample books, authors, publishers, etc.
   ```

6. **Start the development server:**

   Using Foreman (runs Rails + CSS watcher together):
   ```bash
   bin/dev
   ```

   Or start Rails only:
   ```bash
   bin/rails server
   ```

   Navigate to `http://localhost:3000` in your browser.

## Running Tests

```bash
# Unit, model, and controller tests
bin/rails test

# System tests (Chrome headless required)
bin/rails test test/system

# Full suite
bin/rails test:all
```

## License

Rails Bookverse is open source and available under the MIT License. See the [LICENSE](LICENSE) file for more information.
