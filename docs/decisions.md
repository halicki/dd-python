# Decyzje (ADR)

## ADR-001: `main` jest lustrem upstreamu (2026-10-18) — ZASTĄPIONY przez ADR-004

**Kontekst.** Lokalny `main` był zrebase'owany na zmodyfikowany pierwszy commit. Wszystkie hashe różniły się od upstreamu, a tagi kursu wskazywały na starą historię, więc `git diff <tag> main` pokazywał śmieci.

**Decyzja.** `main` = `upstream/main` (DomainDrivers) + commity infrastrukturalne na wierzchu; pushowany do forka (`origin`). Stara historia zachowana jako gałąź `backup/rebased-main` (do skasowania, gdy przestanie być potrzebna).

**Konsekwencje.** Tagi są przodkami `main`. Gałęzie ćwiczeń startują z tagów. Aktualizacja z upstreamu = `git fetch upstream && git rebase upstream/main` naszych kilku commitów.

## ADR-002: uv zamiast poetry, jeden venv dla wszystkich tagów (2026-10-18)

**Kontekst.** Arek chce uv. Tagi mają stary `pyproject.toml` (poetry) z różnymi zestawami zależności.

**Decyzja.** `pyproject.toml` w formacie PEP 621 + `uv.lock`. Wersje zależności takie jak w dawnym `poetry.lock` (uv zaimportował je przy pierwszym `uv sync`). Jeden `.venv` jako nadzbiór zależności wszystkich tagów. Pierwotnie pliki uv żyły tylko na `main`, a na tagach używano venva bez sync; ADR-004 wprowadza je do każdego commita.

**Alternatywy odrzucone.**

- Cherry-pick commita uv na każdą gałąź ćwiczenia: konflikty w `pyproject.toml` na każdym tagu.
- Aliasy gita poza drzewem: działają, ale są niewidoczne w repo i trzeba je zakładać na każdej maszynie.

**Konsekwencje.** Python przypięty do 3.12 (`requires-python`, `.python-version`), tak jak w kursie. mypy nowszy niż w 2024, flaga `--enable-incomplete-feature=NewGenericSyntax` usunięta (jest domyślna). mypy dodany jawnie do dev deps (w poetry go brakowało, choć Makefile go używał).

## ADR-003: ćwiczenia na gałęziach z tagów, nie na `main` (2026-10-18)

**Decyzja.** `ex/<temat>` z `<temat>-task`; po zrobieniu porównanie z `<temat>-done`. Gałęzie pushowane do forka, nie mergowane do `main`.

**Dlaczego.** Kod w `-task` jest w stanie z danego momentu kursu. Późniejsze moduły budują na wzorcowej implementacji, więc własne rozwiązanie nie powinno wracać do `main`.

## ADR-004: historia przepisana, pliki uv w każdym commicie (2026-10-18)

**Kontekst.** Po ADR-001/002 narzędzia (uv, `Makefile`) istniały tylko na szczycie `main`. Po `git switch` na gałąź z tagu `-task` wracał stary `Makefile` z poetry, więc `make ex`, `make test`, `make compare` znikały dokładnie wtedy, gdy były potrzebne.

**Decyzja.** Całe drzewo (62 commity, 50 tagów) przepisane przez `git filter-repo`: w każdym commicie `pyproject.toml`, `uv.lock`, `.python-version`, `Makefile` i `.gitignore` podmienione na wersję z `main`, `poetry.lock` usunięty. Tagi przepięte automatycznie. `main` pushowany do forka z `--force`.

**Dlaczego to bezpieczne.** Upstream to zamrożone repo kursowe (ostatni commit wrzesień 2024), więc utrata fast-forwardu nic nie kosztuje. Remote `upstream` zostaje jako punkt odniesienia do `git diff`. Pełna kopia sprzed przepisania: `../dd-python-backup` (do skasowania, gdy przestanie być potrzebna).

**Konsekwencje.** ADR-001 nieaktualny. `make qa` i `make test` działają na każdym tagu. Jeden `uv.lock` dla całej historii jest nadzbiorem: na wczesnych tagach instaluje się więcej, niż kod potrzebuje. Diff między tagami nie zawiera już zmian w `pyproject.toml`, bo plik jest wszędzie identyczny.
