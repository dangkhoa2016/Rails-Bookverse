## 2024-11-20 - [Environment Constraint: Gem Compilation Failure]
**Learning:** Encountered `Gem::Ext::BuildError` while installing `psych` gem due to missing `libyaml` development headers in the sandbox environment. This prevents running `bundle install` completely or using `rails runner` for benchmarking.
**Action:** Rely on static analysis, `ruby -c` for syntax checking, and targeted code inspection when full environment setup is blocked by missing system libraries.

## 2024-11-20 - [Optimization: Avoid Redundant Queries in List Actions]
**Learning:** Calling `.pluck(:id)` multiple times on an ActiveRecord Relation (even after it's loaded) triggers a new SQL query each time.
**Action:** Explicitly call `.to_a` to load records once and use `map(&:id)` to extract IDs from memory for subsequent bulk count queries.

## 2024-11-20 - [Optimization: Use .size instead of .count]
**Learning:** `.count` always executes a SQL `COUNT` query in Rails, while `.size` is smart enough to use the loaded association if it exists or a counter cache.
**Action:** Prefer `.size` for display methods that might be used when associations are already preloaded.
