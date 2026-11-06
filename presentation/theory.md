# HW3 theory cheat sheet: five-bottle Helmholtz instrument

## 0. The 30-second version

- Each bottle is a **Helmholtz resonator**: the plug of air in the neck bounces on the "air spring" in the bottle. Blowing across the neck excites it and it rings at one frequency.
- Less air in the bottle means a stiffer spring and a **higher** pitch. More air means a **lower** pitch. Pitch goes as **f ∝ 1/√V**.
- Every bottle starts with 343 mL of water (50 mL of air). Removing water adds air and lowers the pitch. So the high notes need little water removed and the low notes need a lot. The notes are D4, E4, F4, G4 and C5 (keys 42, 44, 45, 47, 52), chosen in low octaves for the loudest sound.
- The piano scale is **equal temperament**: f = 440 · 2^((n−49)/12), where n is the piano key number. This is exponential in n.
- The report plots the five measured frequencies against n and fits an exponential, f = A·e^(kn). Theory says k = ln2/12 = 0.05776 and A = 26.0 Hz.
- **Two different formulas are involved.** Helmholtz describes how one bottle makes its pitch (f vs. volume). Equal temperament describes what pitches the notes should have (f vs. key number). The first is used to *tune*, and the second is what the *fit* is compared to (section 4).

---

## 1. The plan: how much water to leave (343 mL start)

Start = 343 mL water + 50 mL air (bottle brim = 393 mL, so water + air = 393 mL).

**Why these notes:** a bottle with more air was louder (observed), and more air also makes tuning easier (1 mL of water moves the pitch less). So each note uses the **lowest octave the bottle can reach**. C4 (261.6 Hz) would need an essentially empty bottle, so C stays at C5. D, E, F, G go to octave 4.

| Note | Key n | Ideal f (Hz) | Accept (±20 cents) | Water left (mL) | Remove x (mL) | Air (mL) | Water tolerance |
|---|---|---|---|---|---|---|---|
| D4 | 42 | 293.7 ± 3.4 | 290.3 – 297.1 | ≈ 65 (50–80) | ≈ 278 | ≈ 328 | ± 7 mL |
| E4 | 44 | 329.6 ± 3.8 | 325.8 – 333.5 | ≈ 130 (120–140) | ≈ 212 | ≈ 262 | ± 6 mL |
| F4 | 45 | 349.2 ± 4.0 | 345.2 – 353.3 | ≈ 160 (150–170) | ≈ 185 | ≈ 235 | ± 5 mL |
| G4 | 47 | 392.0 ± 4.5 | 387.5 – 396.6 | ≈ 205 (197–213) | ≈ 138 | ≈ 188 | ± 4 mL |
| C5 | 52 | 523.3 ± 6.0 | 517.2 – 529.3 | ≈ 285 (280–288) | ≈ 59 | ≈ 109 | ± 2 mL |

**Error margin:** a note counts as in tune within **±20 cents** (1.2% in frequency). This is wider than the HW2 repeatability (SD 0.2–0.7% of f, or 3–12 cents), so Friture can resolve it, and it is well under half a semitone (50 cents), so the note is never confused with its neighbour. "Water tolerance" is the matching error in water volume (±20 cents ÷ cents per mL). Notes outside the range are re-tuned.

Where the numbers come from:
- Water left = 343 − x, and air = 50 + x.
- Each x is the **average of two predictions**: the Helmholtz theory with the measured neck (f = 5123/√(41 + x)) and the fit to the HW2 data with x ≤ 20 mL (f = 5381/√(42.4 + x)). The bracket shows the spread between them.
- These are **extrapolations** far beyond the HW2 range (x ≤ 30 mL), so errors of ±10–15 mL are expected at the low notes. Treat the table as a starting point.

How to use the table:
1. Pour out most of the water to roughly the "water left" value (use a measuring cup or a kitchen scale, 1 g = 1 mL). Use the syringe (60 mL) for the final trim.
2. Blow across the neck and read the peak in Friture. Too high → remove a little more water. Too low → add a little back.
3. The Friture reading is the final authority. Record the final water left for each bottle, since it goes in the report.

Tuning is gentle at low notes: 1 mL moves D4 by under 3 cents, but C5 by about 9 cents (a semitone is 100 cents). E4 and F4 are 1 semitone apart, about 27 mL of water apart.

---

## 2. Notes, frequency, and equal temperament

- **Frequency** (Hz) is the number of air-pressure oscillations per second. A higher frequency is heard as a higher pitch.
- **Octave:** doubling the frequency gives the same note name one octave up (C5 = 2 × C4).
- **Piano key number n:** A4 (440 Hz) is key 49. Middle C (C4) is key 40, so D4 = 42, E4 = 44, F4 = 45, G4 = 47, C5 = 52 (and one octave up: C5 = 52, D5 = 54, E5 = 56, F5 = 57, G5 = 59). An octave is 12 keys.
- **Equal temperament:** an octave is divided into 12 equal *ratio* steps, so each semitone multiplies the frequency by 2^(1/12) = 1.05946. After 12 steps the product is 2, which is the octave.

```
f(n) = 440 · 2^((n − 49) / 12)          n = 12·log2(f/440) + 49
```

- **Cents:** 1 semitone = 100 cents, and 1 octave = 1200 cents. Error in cents = 1200·log2(f_measured / f_ideal). A trained ear notices roughly 5–10 cents.
- **Why not equally spaced in Hz?** The ear perceives *ratios*, not differences. Going up one semitone adds about 6%, not a fixed number of Hz, so the spacing grows with pitch. This is why the curve is exponential.

---

## 3. The Helmholtz resonator (one bottle)

**Picture:** the air in the neck is a small piston (a mass). The air in the bottle is a spring that gets compressed and stretched as the piston moves. Mass on a spring means a natural frequency. Blowing across the neck gives a little push at that frequency, like pushing a swing.

**Formula:**

```
f = (c / 2π) · √( A / (V · L_eff) )
```

| Symbol | Meaning | Our value |
|---|---|---|
| c | speed of sound = 331.3 + 0.606·T(°C) | 343.4 m/s at 20 °C |
| A | neck cross-section = π d² / 4 | d = 21.78 mm → 3.73×10⁻⁴ m² |
| L | geometric neck length | 23.89 mm |
| L_eff | effective length = L + 0.85 d (end correction) | 42.4 mm |
| V | volume of the air spring (air in the bottle) | 50 mL at the start; 50 + x after removing x mL |

**Where it comes from (short derivation you can say out loud):**
1. The plug of air has mass m = ρ·A·L_eff (ρ = air density). The 0.85 d is added because air just outside and inside the neck also moves.
2. Push the plug in by a distance y. The volume changes by A·y, so the pressure changes by ΔP = ρc²·(A·y)/V (adiabatic air, using c² = γP/ρ).
3. The restoring force is F = ΔP·A = (ρc²A²/V)·y, a spring with stiffness k = ρc²A²/V.
4. ω = √(k/m) = c·√(A / (V·L_eff)), and f = ω/2π.

**Consequences (these are the likely exam-style questions):**
- Only V changes between our bottles; c, A, and L_eff stay constant. So **f = a/√V**, with a = (c/2π)·√(A/L_eff).
- **More water means less air, a stiffer spring, and a higher pitch.** Removing water means more air, a softer spring, and a lower pitch. (This matches the HW2 data: 831 Hz at x = 0 falling to 588 Hz at x = 30 mL.)
- **Linearization used in HW2:** 1/f² = (V₀ + x)/a² is a straight line in x. The slope is 1/a² and the intercept/slope is V₀.
- Our neck-based value is a_theory = 5123 Hz·mL^½. HW2 gave a = 4662 (all data) and 5381 (x ≤ 20 only).
- V₀ is smaller than 50 mL. The physical spring volume is about 50 − 9 ≈ 41 mL, because the ≈ 9 mL of air in the neck belongs to the oscillating plug.
- The **frequency does not depend on blowing hard**. Blowing harder only makes it louder or can jump to a harmonic.
- **Temperature:** f ∝ c ∝ √T. Each °C shifts the pitch by about 0.18%, or about 3 cents.
- **Water is not a spring.** Water is nearly incompressible and the oscillating air does not move it, so water only matters by taking up volume.

---

## 4. How the two formulas connect

Helmholtz: f ∝ V^(−1/2). Equal temperament: f ∝ 2^(n/12). If every bottle follows the first and the notes follow the second, then the **air volume must follow an exponential in n**:

```
V ∝ 2^(−n / 6)
```

- One semitone up means V is multiplied by 2^(−1/6) = 0.891, so **11% less air**.
- One octave up (12 keys) means V is multiplied by 1/4. That is why the lowest notes need much more air and very high notes are hard to build (you need at least about 20 mL of air).
- Check on the table: the effective volume ratio G4/C5 = 2^(5/6) = 1.78, which matches (41 + 138) / (41 + 59) = 1.79.
- This is why the exponential fit makes sense physically. The bottles' *volumes* are tuned with Helmholtz, and the *pitches* they end up with are checked against equal temperament.

---

## 5. The fit

**Model:** equal temperament is f = 440·2^((n−49)/12). Written in base e, f = A·e^(kn) with

```
k = ln(2)/12 = 0.05776        A = 440 · 2^(−49/12) = 25.96 Hz  (the value at key 0)
```

**Linearization:** take the natural log, ln f = ln A + k·n. This is a straight line in n, so MATLAB's `polyfit(n, log(f), 1)` returns k (slope) and ln A (intercept).

**What the script reports:**
- The fitted equation f = A·e^(kn).
- R², computed on the real frequencies as 1 − SS_res / SS_tot. R² close to 1 means the curve explains almost all of the variation in the data.
- k vs. ln2/12, the fitted semitone ratio e^k vs. 1.05946, and the fitted A4 (f at n = 49) vs. 440.
- A per-note table of mean, SD, and cents off.

**Why the log-fit is used:** a plain least-squares fit in Hz would let the highest notes dominate, because errors in Hz are larger at high pitch. Fitting ln f weights *percentage* error equally across notes, which suits pitch.

**Caution on R² (good to say aloud):** over only five notes in one octave, the frequencies rise steadily, so R² is high even if some notes are a bit out of tune. A near-1 R² does not mean each note is accurate. The **cents-off column** is the better accuracy test.

**Alternative from the assignment:** a change of variable Z = (n − 49)·ln(2^(1/12)) makes the model f = 440·e^Z, so the fit parameters match the textbook equation directly. This was not needed.

---

## 6. How the data is collected (Friture)

- Friture shows the spectrum (an FFT, which splits the sound into its frequencies). Blowing across the neck gives an almost pure tone, so there is one tall low peak. That peak is the **fundamental** frequency, which is what is read off.
- Resolution is a few Hz (the standard deviations in HW2 were 1.7–6.2 Hz, or 0.2–0.7%), which is under about 12 cents. That is fine for judging a 100-cent semitone step.
- Three readings are taken per bottle and averaged. The SD is the error bar on the plot.
- Blowing angle and lip position change the pitch slightly, so the blowing technique is kept the same.

---

## 7. Limitations (for the discussion and for questions)

1. **Tuning resolution:** 1 mL of water moves a note by about 3 cents (D4) to 9 cents (C5), so the syringe and the water-level read set the tuning accuracy, mostly for C5 and G4.
2. **The Helmholtz model is approximate:** the end correction 0.85 d is a textbook estimate, and the neck is threaded (not a clean cylinder). HW2 gave a/a_theory = 0.91 (all data) and 1.05 (x ≤ 20 mL).
3. **HW2 anomaly:** the last two steps (x = 25, 30 mL) changed 1/f² about twice as much as the earlier steps. The cause was not confirmed. Possible causes are syringe dead volume or reading error.
4. **Soft bottle walls:** thin plastic flexes slightly at audio frequency and acts like extra volume (the original plunger design failed for this reason).
5. **Temperature** changes c by about 3 cents per °C.
6. **Blowing technique:** the pitch shifts a little with angle, distance, and lip shape.
7. **Only five notes** (n = 42–52, ten semitones), so R² says little. The start volumes are extrapolated from HW2, so the first guesses can be off by 10–15 mL. C4 (the natural lowest C) needs an almost empty bottle, which this bottle cannot do.

---

## 8. Likely questions and short answers

| Question | Answer |
|---|---|
| Why does blowing make a sound? | Air flowing across the neck is unstable and pushes the air plug at its natural frequency, so the resonator rings at that frequency. |
| Why does less air give a higher pitch? | The air spring is stiffer. Same mass, stiffer spring, higher frequency. |
| Why does removing water lower the pitch? | It increases the air volume V, and f ∝ 1/√V. |
| Is the Helmholtz formula the one you fit? | No. Helmholtz tells how one bottle's pitch depends on its volume. The fit compares the five finished pitches to the piano formula (equal temperament). They connect because V ∝ 2^(−n/6). |
| Why an exponential fit? | Equal temperament multiplies the frequency by 2^(1/12) per key, which is exponential in n. |
| What is k? | The exponent in f = A·e^(kn). Theory: ln2/12 = 0.05776, which gives a 1.05946 ratio per semitone. |
| What does R² tell you? | The fraction of the variation in the data explained by the fit. Because of the narrow range, it is high even when notes are slightly off, so cents error is also reported. |
| How did you tune? | Start each bottle at 343 mL water, remove the predicted volume with a syringe, then fine-tune by adding or removing small amounts while watching the Friture peak. |
| How good is the tuning? | Quote the cents-off column and R² from the real run. |
| What would you change? | Use a rigid container, a finer volume control (a burette or a sliding piston), and a longer range of notes. |
| Why can't the instrument go much higher or lower? | Higher: below about 20 mL of air the volume is hard to control, and V must shrink 11% for every semitone. Lower: C4 needs an almost empty bottle. |
| Why these octaves? | Larger air volume gave a louder note and is easier to tune, so each note is in the lowest octave the bottle can reach. |
