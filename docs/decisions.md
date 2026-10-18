# Decyzje (ADR)

## ADR-001: `main` jest lustrem upstreamu (2026-10-18)

**Kontekst.** Lokalny `main` był zrebase'owany na zmodyfikowany pierwszy commit. Wszystkie hashe różniły się od upstreamu, a tagi kursu wskazywały na starą historię, więc `git diff <tag> main` pokazywał śmieci.

**Decyzja.** `main` = `origin/main` (DomainDrivers) + commity infrastrukturalne na wierzchu. Stara historia zachowana jako gałąź `backup/rebased-main` (do skasowania, gdy przestanie być potrzebna).

**Konsekwencje.** Tagi są przodkami `main`. Gałęzie ćwiczeń startują z tagów. Aktualizacja z upstreamu = `git rebase origin/main` naszych kilku commitów.

## ADR-002: uv zamiast poetry, jeden venv dla wszystkich tagów (2026-10-18)

**Kontekst.** Arek chce uv. Tagi mają stary `pyproject.toml` (poetry) z różnymi zestawami zależności.

**Decyzja.** `pyproject.toml` w formacie PEP 621 + `uv.lock` na `main`. Wersje zależności takie jak w dawnym `poetry.lock` (uv zaimportował je przy pierwszym `uv sync`). `.venv` buduje się z `main` i jest nadzbiorem; na gałęziach z tagów używamy go bez sync (`uv run --no-sync` albo `.venv/bin/pytest`).

**Alternatywy odrzucone.**
- Cherry-pick commita uv na każdą gałąź ćwiczenia: konflikty w `pyproject.toml` na każdym tagu.
- Worktree per ćwiczenie: do rozważenia później, jeśli przełączanie gałęzi zacznie przeszkadzać.

**Konsekwencje.** Python przypięty do 3.12 (`requires-python`, `.python-version`), tak jak w kursie. mypy nowszy niż w 2024, flaga `--enable-incomplete-feature=NewGenericSyntax` usunięta (jest domyślna). mypy dodany jawnie do dev deps (w poetry go brakowało, choć Makefile go używał).

## ADR-003: ćwiczenia na gałęziach z tagów, nie na `main` (2026-10-18)

**Decyzja.** `ex/<temat>` z `<temat>-task`; po zrobieniu porównanie z `<temat>-done`. Gałęzie pushowane do forka, nie mergowane do `main`.

**Dlaczego.** Kod w `-task` jest w stanie z danego momentu kursu. Późniejsze moduły budują na wzorcowej implementacji, więc własne rozwiązanie nie powinno wracać do `main`.
