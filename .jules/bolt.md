## 2024-12-17 - [Redundant SELECT id queries]
**Learning:** Using `.pluck(:id)` on an ActiveRecord relation that is used multiple times (especially when already preloaded) triggers redundant `SELECT id` queries.
**Action:** Use `.load.map(&:id)` on the relation once and store the result in a local variable to be reused. This ensures the data is loaded into memory and avoids extra database roundtrips while preserving the relation object for other uses like Pagy.

## 2024-12-17 - [N+1 queries in View Helpers]
**Learning:** Calling `.pluck` on preloaded associations in view helpers bypasses the preloaded data and triggers new SQL queries.
**Action:** Use `.map` and other Enumerable methods instead of `.pluck` or `.count` when associations are preloaded to leverage in-memory data.
