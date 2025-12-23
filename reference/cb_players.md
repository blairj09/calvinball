# Calvinball League Players

A dataset containing player information for the Calvinball League.

## Usage

``` r
cb_players
```

## Format

A tibble with 30 rows and 3 variables:

- player_id:

  Unique player identifier

- player_name:

  Player name (creative Calvinball-style names)

- team_id:

  Team identifier (1-6)

## Source

Synthetically generated data inspired by Calvin and Hobbes

## Examples

``` r
head(cb_players)
#> # A tibble: 6 × 3
#>   player_id player_name     team_id
#>       <int> <chr>             <int>
#> 1         1 Baron Lightning       4
#> 2         2 Rosalyn Zoom          1
#> 3         3 Calvin Thunder        4
#> 4         4 Doctor Torpid         6
#> 5         5 Moe Nebula            1
#> 6         6 Baron Nebula          3
```
