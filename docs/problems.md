# Problemy

## Otwarte

- **Brak spisu lekcji kursu.** Strona devstyle zwraca 403 dla automatycznych pobrań. Potrzebne: Arek wkleja spis modułów, potem weryfikacja, czy kolejność tagów = kolejność wideo.

## Zamknięte

- 2026-10-18: `main` z przepisaną historią, tagi poza historią. Rozwiązanie: ADR-001.
- 2026-10-18: brak Pythona 3.12 i środowiska. Rozwiązanie: uv + `.python-version` (ADR-002).
- 2026-10-18: mylące nazwy remote'ów i brak tracking brancha. Rozwiązanie: `origin` = fork (halicki), `upstream` = DomainDrivers, `main` śledzi `origin/main`.
