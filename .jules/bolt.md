## 2025-01-24 - Redundant ID Plucking and Preloaded Map

**Learning:**
1. Calling `.pluck(:id)` multiple times on an ActiveRecord relation triggers multiple database queries even if the records are already loaded. Materializing the relation with `.to_a` and using `.map(&:id)` is more efficient when IDs are needed for several bulk operations (like counts).
2. Using `.pluck` in helpers on associations that are preloaded (with `includes`) triggers unnecessary database queries. Using `.map` leverages the preloaded objects in memory.
3. In this specific environment, the lack of `libyaml-dev` blocks `psych` gem installation, which can halt Rails-dependent tools. Always check for system dependencies when builds fail.

**Action:**
1. Scan controllers for multiple `.pluck` calls on the same collection and replace with a single materialized ID array.
2. In helpers/views, prefer `.map` over `.pluck` if the association is preloaded.
