# Calvinball League Game Results

A dataset containing game results across 3 seasons of Calvinball. Scores
are intentionally chaotic, ranging from negative values to thousands,
reflecting the unpredictable nature of Calvinball.

## Usage

``` r
cb_games
```

## Format

A tibble with 150 rows and 9 variables:

- season:

  Season number (1-3)

- game_id:

  Unique game identifier

- date:

  Date of the game

- team_home:

  Home team ID

- team_away:

  Away team ID

- score_home:

  Home team score (can be negative!)

- score_away:

  Away team score (can be negative!)

- scoring_type:

  The scoring system used for this game (changes each game)

- winner:

  Team ID of the winner, or NA for ties

## Source

Synthetically generated data inspired by Calvin and Hobbes

## Details

Scoring types include: wickets, vortex_points, opposite_points,
time_zones, song_scores, invisible_sectors, spontaneous_declarations,
and base_nonsensicals.

## Examples

``` r
head(cb_games)
#> # A tibble: 6 × 9
#>   season game_id date       team_home team_away score_home score_away
#>    <int>   <dbl> <date>         <int>     <int>      <dbl>      <dbl>
#> 1      1       1 2023-01-04         5         1          8         39
#> 2      1       2 2023-01-07         6         3         27         27
#> 3      1       3 2023-01-10         6         1         12         11
#> 4      1       4 2023-01-13         6         4        -67        -26
#> 5      1       5 2023-01-16         4         2          9          7
#> 6      1       6 2023-01-19         4         3         14         15
#> # ℹ 2 more variables: scoring_type <chr>, winner <int>

# Find games with negative scores
cb_games[cb_games$score_home < 0 | cb_games$score_away < 0, ]
#> # A tibble: 27 × 9
#>    season game_id date       team_home team_away score_home score_away
#>     <int>   <dbl> <date>         <int>     <int>      <dbl>      <dbl>
#>  1      1       4 2023-01-13         6         4        -67        -26
#>  2      1      11 2023-02-03         3         4        -50        -63
#>  3      1      13 2023-02-09         1         6        -16         -7
#>  4      1      15 2023-02-15         5         2        -62        -17
#>  5      1      26 2023-03-20         6         4        -17        -38
#>  6      1      38 2023-04-25         2         5       -100        -51
#>  7      1      42 2023-05-07         4         1        -38       -106
#>  8      2      56 2023-07-18         5         2        -52        -28
#>  9      2      60 2023-07-30         5         2        -34         -2
#> 10      2      63 2023-08-08         4         3        -36        -40
#> # ℹ 17 more rows
#> # ℹ 2 more variables: scoring_type <chr>, winner <int>
```
