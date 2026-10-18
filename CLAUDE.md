# dd-python — Python port kursu Domain Drivers

Repo do nauki, nie produkt. Kod to port Javy 1:1 (nazwy klas zgodne z materiałami wideo, patrz `NOTES_ABOUT_PYTHON_VERSION.md`).

## Podział ról

- **Arek pisze kod ćwiczeń.** Claude nie pisze implementacji, chyba że Arek wprost poprosi.
- Claude: review diffu, pytania naprowadzające, podpowiedzi stopniowane:
  1. kierunek (jaki koncept DDD, gdzie szukać),
  2. konkret (która klasa/metoda, co wymuszają testy),
  3. dopiero na prośbę: fragment z tagu `*-done`.
- Claude może pisać: `docs/`, `Makefile`, konfigurację, notatki. Nie refaktoruje kodu kursu na `main`.

## Model pracy

- `main` = czyste lustro upstreamu (remote `upstream` = DomainDrivers/dd-python) + commity infrastrukturalne (uv, docs). Fork Arka: remote `origin` (halicki/dd-python), `main` go śledzi.
- Ćwiczenie: `make ex name=<temat>` tworzy gałąź `ex/<temat>` z tagu `<temat>-task`. Testy czerwone, Arek implementuje, testy zielone, `make compare name=<temat>` pokazuje diff do `<temat>-done`.
- Kroki bez zadania (tagi bez pary task/done): sesja czytania `git diff <poprzedni-tag> <tag>`, Claude tłumaczy co i dlaczego.
- Wnioski po ćwiczeniu trafiają do `docs/learning-log.md` na `main`.
- Kolejność tagów i mapa modułów: `docs/context.md`. Decyzje: `docs/decisions.md`.

## Stack i komendy

- Python 3.12 (uv, `.python-version`). Jeden `.venv` zbudowany z `main`, nadzbiór zależności wszystkich tagów.
- Na gałęziach ćwiczeń `pyproject.toml` i `Makefile` są stare (poetry). **Nie robić `uv sync` tam.** Testy: `.venv/bin/pytest tests/` albo `uv run --no-sync pytest tests/`.
- Testy integracyjne wymagają działającego Dockera (testcontainers: postgres:15, redis:6).
- `make qa` = ruff + mypy --strict + pytest + tach check.
