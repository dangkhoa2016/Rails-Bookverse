## 2025-01-24 - [Avoid `.to_a` re-assignment on paginated relations]
**Learning:** Materializing an `ActiveRecord::Relation` into an array using `.to_a` and re-assigning it to the instance variable (e.g., `@books = @books.to_a`) can break pagination helpers (like Pagy) that expect a relation object. Using `.load` instead forces the database query while preserving the relation object's type and metadata.
**Action:** Use `.load` to prevent redundant queries (like multiple `.pluck(:id)` calls) instead of `.to_a` when the object needs to remain a relation for the view.
