# Problemy

## Otwarte

- **Brak spisu lekcji kursu.** Strona devstyle zwraca 403 dla automatycznych pobrań. Potrzebne: Arek wkleja spis modułów, potem weryfikacja, czy kolejność tagów = kolejność wideo.
- **Nazwy remote'ów mylące.** `origin` = upstream (DomainDrivers), `halicki` = fork. Zmiana nazw została zablokowana przez tryb auto Claude Code. Do zrobienia ręcznie: `git remote rename origin upstream && git remote rename halicki origin`, potem poprawić `CLAUDE.md` i `docs/`.
- **Tracking branch.** `main` nie śledzi forka. Pierwszy push: `git push -u halicki main`.

## Zamknięte

- 2026-10-18: `main` z przepisaną historią, tagi poza historią. Rozwiązanie: ADR-001.
- 2026-10-18: brak Pythona 3.12 i środowiska. Rozwiązanie: uv + `.python-version` (ADR-002).
