# Rails Bookverse Screenshot Guide

> 🌐 Language / Ngôn ngữ: **English** | [Tiếng Việt](README.vi.md)

This document describes the UI screenshots stored in the `screenshots` folder. The collection focuses on the dashboard, index pages in multiple view modes, and several detail pages that show relationships between entities.

## Purpose

- Record the current state of the UI for use in the main README, product documentation, release notes, or demos.
- Illustrate the available `Card`, `List`, and `Table` presentation modes, as well as the collapsed sidebar state.
- Provide a quick index so screenshots can be found by feature area.

## Coverage

The current image set includes:

- A dashboard overview with KPI cards, charts, and activity blocks.
- Index pages for major resources such as authors, books, reviews, tags, publishers, published dates, members, libraries, and book loans.
- Detail pages with `Associations and Relationships` sections that show how records connect across the data model.
- Examples of the collapsed sidebar layout to document how navigation behaves in a narrower shell.

## File Naming Convention

- `*-index-card-view.png`: index page in card view.
- `*-index-list-view.png`: index page in list view.
- `*-index-table-view.png`: index page in table view.
- `*-detail*.png`: detail page for a record.
- `*-tab.png`: detail page with a specific relationship tab selected.

## Screenshot Catalog

| Image file | Screen group | Short description |
| --- | --- | --- |
| [dashboard-static-content.png](dashboard-static-content.png) | Dashboard | Overview page with KPI cards, traffic charts, social widgets, and an activity table. |
| [authors-index-card-view.png](authors-index-card-view.png) | Authors | Authors index in card view, showing primary author details plus book and profile counts. |
| [authors-index-list-view.png](authors-index-list-view.png) | Authors | Authors index in list view, also illustrating the collapsed sidebar layout. |
| [authors-index-table-view.png](authors-index-table-view.png) | Authors | Authors index in table view, useful for scanning many records quickly. |
| [author-detail-profiles-tab.png](author-detail-profiles-tab.png) | Authors | Author detail page with the `Author Profiles` relationship tab selected. |
| [author-detail-books-tab.png](author-detail-books-tab.png) | Authors | Author detail page with the `Books` relationship tab selected and related books displayed. |
| [author-profiles-index-card-view.png](author-profiles-index-card-view.png) | Author Profiles | Author profiles index in card view, including biography and social network links. |
| [books-index-card-view.png](books-index-card-view.png) | Books | Books index in card view, showing summary, ISBN, price, stock, and review data. |
| [reviews-index-card-view.png](reviews-index-card-view.png) | Reviews | Reviews index in card view, emphasizing review content and star ratings. |
| [reviews-index-table-view.png](reviews-index-table-view.png) | Reviews | Reviews index in table view, useful for comparing multiple records at once. |
| [tags-index-card-view-with-collapsed-sidebar.png](tags-index-card-view-with-collapsed-sidebar.png) | Tags | Tags index in card view with the sidebar collapsed. |
| [libraries-index-card-view.png](libraries-index-card-view.png) | Libraries | Libraries index in card view, highlighting the member count for each library. |
| [members-index-card-view.png](members-index-card-view.png) | Members | Members index in card view, including linked library and book loan count. |
| [member-detail.png](member-detail.png) | Members | Member detail page with an `Associations and Relationships` section and related book loans. |
| [book-loans-index-card-view.png](book-loans-index-card-view.png) | Book Loans | Book loans index in card view, showing book, member, status, and borrow or return dates. |
| [publishers-index-card-view.png](publishers-index-card-view.png) | Publishers | Publishers index in card view, including contact details and business metadata. |
| [published-dates-index-card-view.png](published-dates-index-card-view.png) | Published Dates | Published dates index in card view, showing book, publisher, published date, and edition. |

## Notable UI Patterns Shown By The Screenshots

### 1. Consistent Admin Shell

Across the screenshots, the application keeps a stable layout with a left sidebar, top breadcrumb area, action buttons, and a central content region. This makes the navigation structure easy to explain in project documentation.

### 2. Multiple View Modes For The Same Resource

The collection shows how the same resource can be presented in different ways:

- `Card view`: better for browsing richer record details inside individual panels.
- `List view`: better for vertical reading and lightweight scanning.
- `Table view`: better for comparing many rows on a single screen.

### 3. Relationship-Driven Detail Pages

The author and member detail screenshots show how the application surfaces related data through tabs and embedded lists. This is useful when explaining how the data model is navigated from the UI.

### 4. Collapsed Sidebar Behavior

The screenshots with the collapsed sidebar show that the layout remains usable even when the navigation shell is reduced. These images are useful for demonstrating layout flexibility.

## Suggested Uses

- For a short project showcase, prioritize [dashboard-static-content.png](dashboard-static-content.png), [authors-index-table-view.png](authors-index-table-view.png), [books-index-card-view.png](books-index-card-view.png), and [member-detail.png](member-detail.png).
- To demonstrate CRUD coverage and presentation variety, combine the `card`, `list`, and `table` examples from Authors and Reviews.
- To explain the data model and cross-entity navigation, use [author-detail-profiles-tab.png](author-detail-profiles-tab.png), [author-detail-books-tab.png](author-detail-books-tab.png), and [member-detail.png](member-detail.png).

## Summary

This screenshot set gives broad coverage of the Rails Bookverse admin UI, from the dashboard to resource indexes, multiple view modes, and relationship-heavy detail pages. It is suitable for technical documentation, product demos, and project presentation materials.