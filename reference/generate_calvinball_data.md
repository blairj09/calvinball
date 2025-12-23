# Generate Fresh Calvinball League Data

Generates a complete set of Calvinball League data including players,
teams, games, and player statistics. Each call produces different
results (unless a seed is set), staying true to the Calvinball spirit
that "you can't play it the same way twice!"

## Usage

``` r
generate_calvinball_data(
  n_players = 30,
  n_teams = 6,
  n_games = 50,
  n_seasons = 3,
  seed = NULL
)
```

## Arguments

- n_players:

  Number of players to generate (default: 30)

- n_teams:

  Number of teams (default: 6)

- n_games:

  Number of games per season (default: 50)

- n_seasons:

  Number of seasons (default: 3)

- seed:

  Optional random seed for reproducibility (though Calvinball shouldn't
  be reproducible!)

## Value

A list containing four tibbles:

- players:

  Player roster with team assignments

- teams:

  Team information

- games:

  Game results with scores and winners

- player_stats:

  Individual player game statistics

## Details

The generated data includes intentionally chaotic elements:

- Scores can be negative (about 15% of games)

- Some games have extreme scores in the thousands (about 10%)

- Eight different scoring systems are used randomly

- Ties are possible

## Examples

``` r
# Generate with default parameters
data <- generate_calvinball_data()
names(data)
#> [1] "players"      "teams"        "games"        "player_stats"

# Generate a smaller league
small_league <- generate_calvinball_data(
  n_players = 12,
  n_teams = 3,
  n_games = 20,
  n_seasons = 1
)

# Reproducible generation (against the spirit of Calvinball, but useful!)
data1 <- generate_calvinball_data(seed = 42)
data2 <- generate_calvinball_data(seed = 42)
identical(data1, data2)  # TRUE
#> [1] TRUE
```
