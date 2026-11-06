# Helmholtz Bottle

Water-bottle Helmholtz resonators tuned to piano notes. ES 1402, Vanderbilt University, Fall 2026.

The pitch of a bottle is set by its air volume, `f = (c / 2π) √(A / (V · L_eff))`. Water is removed with a syringe to raise the note.

| Folder | Contents |
|---|---|
| `/` | HW2 data (`data.csv`) and MATLAB fit (`analyze_plunger.m`) |
| `report/` | HW2 report source and plots |
| `hw3/` | Five-note data (`notes.csv`), MATLAB fit (`analyze_notes.m`), HW3 report |
| `final_report/` | Final report (`.tex` and PDF) |
| `presentation/` | Group presentation and theory notes |

## Results

- HW2: `f = a / √(V₀ + x)`, fitted by linearizing `1/f²` against water removed.
- HW3: D4, E4, F4, G4 and C5 within 1% of piano frequency, `f = 25.3 e^(0.0583 n)`, R² = 0.9995.

Run the fits in MATLAB with `analyze_plunger.m` and `hw3/analyze_notes.m`.
