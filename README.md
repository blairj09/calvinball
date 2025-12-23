# Calvinball League Data 🏴

> "The only permanent rule is that you can't play it the same way twice!" - Calvin

A synthetic sports dataset inspired by **Calvinball**, the legendary game from Bill Watterson's *Calvin and Hobbes* comic strip. This project is designed to be a fun, nostalgic dataset for illustrating data exploration and EDA techniques.

## 📊 What's Included

### Data Files (`data/`)

| File | Description |
|------|-------------|
| `players.csv` | Player roster (30 players with creative names) |
| `teams.csv` | Team information (6 teams) |
| `games.csv` | Game results across 3 seasons (150 games) |
| `player_stats.csv` | Individual game performance records (900 rows) |
| `players_summary.csv` | Aggregated player career statistics |
| `team_records.csv` | Team win/loss/tie records by season |

### Analysis

- **`eda.qmd`** - A comprehensive exploratory data analysis document with comic book-inspired styling
- **`styles.css`** - Custom CSS for the comic book theme (uses Bangers, Comic Neue, and Permanent Marker fonts)

## 🎮 Calvinball Statistics

The dataset includes wonderfully absurd performance metrics true to the spirit of Calvinball:

- **Wickets Scored** - Because why not cricket terminology?
- **Opposite Touchdowns** - Can be negative!
- **Time Reversal Bonus** - For when you declare a time-reversal zone
- **Mask Points** - Masks are mandatory equipment
- **Flag Captures** - The Calvinball flag is sacred
- **Invisible Zones Crossed** - Only the truly skilled can navigate these
- **Spontaneous Rule Declarations** - The heart of Calvinball strategy
- **Song Quality Score** - Victory songs are judged harshly
- **Style Points** - Because *flair matters*

## 🎲 Data Characteristics

The data intentionally includes chaotic elements perfect for teaching EDA:

- **Wild score distributions**: Scores range from negative values to thousands
- **Multiple scoring systems**: 8 different scoring types that change game-to-game
- **Ties are possible**: Just like in real Calvinball (the score is still Q to 12!)
- **Extreme outliers**: ~10% of games have scores in the thousands

## 🚀 Getting Started

### Regenerate the Data

```r
source("data/generate-data.R")
```

### Render the EDA Document

```bash
quarto render eda.qmd
```

Or in R:
```r
quarto::quarto_render("eda.qmd")
```

## 📦 Requirements

### R Packages

- `tidyverse` - Data manipulation and visualization
- `gt` - Beautiful tables
- `scales` - Number formatting

### Other

- [Quarto](https://quarto.org/) - For rendering the analysis document

## 🎨 Styling

The EDA document features a custom comic book theme including:

- Bold black borders and drop shadows
- Comic-style fonts (Bangers for headers, Comic Neue for body text)
- Speech bubble blockquotes
- Colorful gradient backgrounds
- Fun hover effects and animations

## 📜 License

This is a fun educational project. The Calvin and Hobbes references are used lovingly and are the property of Bill Watterson.

---

<p align="center">
<strong>⚡ OLLY OLLY OXEN FREE! ⚡</strong><br>
<em>The Score is STILL Q to 12!</em>
</p>
