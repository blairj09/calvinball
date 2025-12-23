#' Generate Fresh Calvinball League Data
#'
#' Generates a complete set of Calvinball League data including players,
#' teams, games, and player statistics. Each call produces different results
#' (unless a seed is set), staying true to the Calvinball spirit that
#' "you can't play it the same way twice!"
#'
#' @param n_players Number of players to generate (default: 30)
#' @param n_teams Number of teams (default: 6)
#' @param n_games Number of games per season (default: 50)
#' @param n_seasons Number of seasons (default: 3)
#' @param seed Optional random seed for reproducibility (though Calvinball
#'   shouldn't be reproducible!)
#'
#' @return A list containing four tibbles:
#' \describe{
#'   \item{players}{Player roster with team assignments}
#'   \item{teams}{Team information}
#'   \item{games}{Game results with scores and winners}
#'   \item{player_stats}{Individual player game statistics}
#' }
#'
#' @details
#' The generated data includes intentionally chaotic elements:
#' \itemize{
#'   \item Scores can be negative (about 15\% of games)
#'   \item Some games have extreme scores in the thousands (about 10\%)
#'   \item Eight different scoring systems are used randomly
#'   \item Ties are possible
#' }
#'
#' @examples
#' # Generate with default parameters
#' data <- generate_calvinball_data()
#' names(data)
#'
#' # Generate a smaller league
#' small_league <- generate_calvinball_data(
#'   n_players = 12,
#'   n_teams = 3,
#'   n_games = 20,
#'   n_seasons = 1
#' )
#'
#' # Reproducible generation (against the spirit of Calvinball, but useful!)
#' data1 <- generate_calvinball_data(seed = 42)
#' data2 <- generate_calvinball_data(seed = 42)
#' identical(data1, data2)  # TRUE
#'
#' @export
generate_calvinball_data <- function(n_players = 30,
                                     n_teams = 6,
                                     n_games = 50,
                                     n_seasons = 3,
                                     seed = NULL) {

  if (!is.null(seed)) {
    set.seed(seed)
  }

  # Generate player names
  first_names <- c("Calvin", "Hobbes", "Susie", "Moe", "Rosalyn", "Spaceman",
                   "Stupendous", "Captain", "Commander", "Doctor", "Professor",
                   "Agent", "Sir", "Madame", "Lord", "Duke", "Baron")
  last_names <- c("Spiff", "Zoom", "Thunder", "Lightning", "Quantum", "Nebula",
                  "Vortex", "Cosmic", "Derkins", "Wormwood", "Tracer", "Slime",
                  "Wickerbill", "Spittle", "Hamster", "Napalm", "Torpid")

  players <- tibble::tibble(
    player_id = seq_len(n_players),
    player_name = paste(
      sample(first_names, n_players, replace = TRUE),
      sample(last_names, n_players, replace = TRUE)
    ),
    team_id = sample(rep(seq_len(n_teams), length.out = n_players))
  )

  # Generate teams
  team_names <- c(
    "Transmogrifiers", "Time Travelers", "Duplicators",
    "Dinosaur Riders", "Space Explorers", "G.R.O.S.S. Members",
    "Snowmen Builders", "Cardboard Box Racers"
  )

  teams <- tibble::tibble(
    team_id = seq_len(n_teams),
    team_name = sample(team_names, n_teams, replace = FALSE)
  )

  # Generate games
  scoring_types <- c("wickets", "vortex_points", "opposite_points",
                     "time_zones", "song_scores", "invisible_sectors",
                     "spontaneous_declarations", "base_nonsensicals")

  games_list <- vector("list", n_seasons * n_games)
  idx <- 1

  for (season in seq_len(n_seasons)) {
    for (game in seq_len(n_games)) {
      matchup <- sample(seq_len(n_teams), 2)
      score_type <- sample(scoring_types, 1)

      # Chaotic scoring distributions
      rand_val <- stats::runif(1)
      if (rand_val < 0.1) {
        # 10% chance of extreme scores
        score1 <- round(stats::rnorm(1, 1000, 500))
        score2 <- round(stats::rnorm(1, 1000, 500))
      } else if (rand_val < 0.25) {
        # 15% chance of negative scores
        score1 <- round(stats::rnorm(1, -50, 30))
        score2 <- round(stats::rnorm(1, -50, 30))
      } else {
        # Normal chaos
        score1 <- round(stats::rexp(1, 0.05))
        score2 <- round(stats::rexp(1, 0.05))
      }

      winner <- if (score1 > score2) {
        matchup[1]
      } else if (score2 > score1) {
        matchup[2]
      } else {
        NA_integer_
      }

      games_list[[idx]] <- tibble::tibble(
        season = season,
        game_id = (season - 1) * n_games + game,
        date = as.Date("2023-01-01") + (season - 1) * 180 + game * 3,
        team_home = matchup[1],
        team_away = matchup[2],
        score_home = score1,
        score_away = score2,
        scoring_type = score_type,
        winner = winner
      )
      idx <- idx + 1
    }
  }

  games <- do.call(rbind, games_list)

  # Generate player stats
  stats_list <- vector("list", nrow(games) * 6)
  stat_idx <- 1

  for (i in seq_len(nrow(games))) {
    game <- games[i, ]

    home_players <- players[players$team_id == game$team_home, ]
    away_players <- players[players$team_id == game$team_away, ]

    n_home <- min(3, nrow(home_players))
    n_away <- min(3, nrow(away_players))

    home_sample <- home_players[sample(seq_len(nrow(home_players)), n_home), ]
    away_sample <- away_players[sample(seq_len(nrow(away_players)), n_away), ]

    all_game_players <- rbind(home_sample, away_sample)

    for (j in seq_len(nrow(all_game_players))) {
      player <- all_game_players[j, ]

      stats_list[[stat_idx]] <- tibble::tibble(
        season = game$season,
        game_id = game$game_id,
        player_id = player$player_id,
        team_id = player$team_id,
        wickets_scored = stats::rpois(1, 2),
        opposite_touchdowns = sample(-5:10, 1),
        time_reversal_bonus = stats::rnorm(1, 0, 5),
        mask_points = stats::rpois(1, 1),
        flag_captures = sample(0:3, 1),
        invisible_zones_crossed = stats::rpois(1, 1),
        spontaneous_rule_declarations = stats::rpois(1, 0.5),
        song_quality_score = stats::runif(1, 0, 10),
        minutes_played = round(stats::runif(1, 5, 45)),
        fouls_committed = stats::rpois(1, 1),
        style_points = stats::runif(1, 0, 100)
      )
      stat_idx <- stat_idx + 1
    }
  }

  player_stats <- do.call(rbind, stats_list[seq_len(stat_idx - 1)])

  # Return core datasets (summary tables can be derived by users)
  list(
    players = tibble::as_tibble(players),
    teams = tibble::as_tibble(teams),
    games = tibble::as_tibble(games),
    player_stats = tibble::as_tibble(player_stats)
  )
}
