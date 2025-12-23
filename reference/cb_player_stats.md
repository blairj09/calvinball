# Calvinball Player Game Statistics

Individual player performance records for each game played. Contains
wonderfully absurd Calvinball-specific metrics.

## Usage

``` r
cb_player_stats
```

## Format

A tibble with 900 rows and 15 variables:

- season:

  Season number

- game_id:

  Game identifier

- player_id:

  Player identifier

- team_id:

  Team identifier

- wickets_scored:

  Number of wickets scored (Poisson distributed)

- opposite_touchdowns:

  Touchdowns in the opposite direction (can be negative!)

- time_reversal_bonus:

  Bonus points from time reversal zones

- mask_points:

  Points earned while wearing the sacred mask

- flag_captures:

  Number of Calvinball flag captures

- invisible_zones_crossed:

  Invisible zones successfully navigated

- spontaneous_rule_declarations:

  New rules declared during the game

- song_quality_score:

  Quality rating of victory songs (0-10)

- minutes_played:

  Minutes played in the game

- fouls_committed:

  Fouls committed (usually just accusations)

- style_points:

  Style points awarded (0-100) - very important!

## Source

Synthetically generated data inspired by Calvin and Hobbes

## Examples

``` r
head(cb_player_stats)
#> # A tibble: 6 × 15
#>   season game_id player_id team_id wickets_scored opposite_touchdowns
#>    <int>   <dbl>     <int>   <int>          <int>               <int>
#> 1      1       1        17       5              1                   4
#> 2      1       1        10       5              1                   0
#> 3      1       1        20       5              2                   4
#> 4      1       1         2       1              1                   5
#> 5      1       1        19       1              2                   4
#> 6      1       1         8       1              0                   0
#> # ℹ 9 more variables: time_reversal_bonus <dbl>, mask_points <int>,
#> #   flag_captures <int>, invisible_zones_crossed <int>,
#> #   spontaneous_rule_declarations <int>, song_quality_score <dbl>,
#> #   minutes_played <dbl>, fouls_committed <int>, style_points <dbl>

# Who has the most style points in a single game?
cb_player_stats[which.max(cb_player_stats$style_points), ]
#> # A tibble: 1 × 15
#>   season game_id player_id team_id wickets_scored opposite_touchdowns
#>    <int>   <dbl>     <int>   <int>          <int>               <int>
#> 1      3     129        25       3              0                   3
#> # ℹ 9 more variables: time_reversal_bonus <dbl>, mask_points <int>,
#> #   flag_captures <int>, invisible_zones_crossed <int>,
#> #   spontaneous_rule_declarations <int>, song_quality_score <dbl>,
#> #   minutes_played <dbl>, fouls_committed <int>, style_points <dbl>
```
