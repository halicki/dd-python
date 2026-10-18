# Kontekst

## Co to jest

Python port kodu z kursu **Domain Drivers** (devstyle, https://edu.devstyle.pl/products/domain-drivers). Oryginał jest w Javie; port autorstwa Sebastiana Buczyńskiego, nazwy 1:1 z Javą (patrz `NOTES_ABOUT_PYTHON_VERSION.md`). Domena: SmartSchedule, czyli planowanie projektów, alokacja zasobów, dostępność, symulacje, ryzyko.

Cel Arka: przejść kurs implementując ćwiczenia samodzielnie, z Claude jako partnerem od review i podpowiedzi.

## Struktura kursu w repo = tagi upstreamu

Historia upstreamu to 57 commitów (sierpień–wrzesień 2024). Tagi są kamieniami milowymi lekcji. Pary `*-task` / `*-done` to ćwiczenia: `-task` ma API + testy bez implementacji, `-done` ma rozwiązanie wzorcowe.

Kolejność chronologiczna (★ = start ćwiczenia, wcięcie = rozwiązanie):

- ★ parallelization-task
-   parrallelization-done (literówka jest w upstreamie, nie poprawiamy)
- graph
- agnostic-graph
- graph-functional-workflow
- ★ simulation-task
-   simulation-done
- agnostic-knapsack
- simulation-value-function
- simulation-buying
- simulation-transfers
- planning-facade
- project-types (scenariusze testowe z event stormingu; „done” jest dopiero przy risk)
- ★ project-allocations-task
-   project-allocations-done
- project-allocations-new-features
- allocation-facade
- cashflow
- ★ availability-task
-   availability-done
- resource-ids-mapping
- availability-read-model
- rd-planning
- resource-crud
- stages-removal-suggestion
- availability-fix
- ★ allocation-availability-task
-   allocation-availability-done
- capability-scheduling
-   capability-selector-done (bez tagu `-task`; zadanie = commit „introduced capability selector (just tests)” tuż przed)
- capability-selector-persistance
- capability-selector-in-simulation
- allocation-resource-ids-breakthrough
- availability-allocation-capability-checks
- ★ capability-allocating-task
-   capability-allocating-done
- legacy-acl
- resource-scheduling
- planning-to-allocations
- events-publisher
- events-emitting
- allocation-resource
- ★ risk-task
-   risk-done
-   project-types-done
- ★ private-events-task
-   private-events-done
- modules-stability
- redis-in-planning
- segments-default-duration-visibility

## Moduły (tach.yml)

`shared` → `availability`, `optimization`, `sorter` → `simulation`, `planning` (+ `parallelization`) → `allocation` (+ `capabilityscheduling`, `cashflow`) → `resource` (+ `device`, `employee`) → `risk`. Granic pilnuje `tach check`.

## Czego nie wiemy

- [TODO] Spis modułów kursu ze strony devstyle (strona blokuje automatyczne pobieranie). Do sprawdzenia: czy kolejność lekcji wideo = kolejność tagów.
