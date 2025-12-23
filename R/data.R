#' Calvinball League Players
#'
#' A dataset containing player information for the Calvinball League.
#'
#' @format A tibble with 30 rows and 3 variables:
#' \describe{
#'   \item{player_id}{Unique player identifier}
#'   \item{player_name}{Player name (creative Calvinball-style names)}
#'   \item{team_id}{Team identifier (1-6)}
#' }
#'
#' @examples
#' head(cb_players)
#'
#' @source Synthetically generated data inspired by Calvin and Hobbes
"cb_players"

#' Calvinball League Teams
#'
#' A dataset containing team information for the Calvinball League.
#'
#' @format A tibble with 6 rows and 2 variables:
#' \describe{
#'   \item{team_id}{Unique team identifier}
#'   \item{team_name}{Team name (e.g., "Transmogrifiers", "Time Travelers")}
#' }
#'
#' @examples
#' cb_teams
#'
#' @source Synthetically generated data inspired by Calvin and Hobbes
"cb_teams"

#' Calvinball League Game Results
#'
#' A dataset containing game results across 3 seasons of Calvinball.
#' Scores are intentionally chaotic, ranging from negative values to thousands,
#' reflecting the unpredictable nature of Calvinball.
#'
#' @format A tibble with 150 rows and 9 variables:
#' \describe{
#'   \item{season}{Season number (1-3)}
#'   \item{game_id}{Unique game identifier}
#'   \item{date}{Date of the game}
#'   \item{team_home}{Home team ID}
#'   \item{team_away}{Away team ID}
#'   \item{score_home}{Home team score (can be negative!)}
#'   \item{score_away}{Away team score (can be negative!)}
#'   \item{scoring_type}{The scoring system used for this game (changes each game)}
#'   \item{winner}{Team ID of the winner, or NA for ties}
#' }
#'
#' @details
#' Scoring types include: wickets, vortex_points, opposite_points,
#' time_zones, song_scores, invisible_sectors, spontaneous_declarations,
#' and base_nonsensicals.
#'
#' @examples
#' head(cb_games)
#'
#' # Find games with negative scores
#' cb_games[cb_games$score_home < 0 | cb_games$score_away < 0, ]
#'
#' @source Synthetically generated data inspired by Calvin and Hobbes
"cb_games"

#' Calvinball Player Game Statistics
#'
#' Individual player performance records for each game played.
#' Contains wonderfully absurd Calvinball-specific metrics.
#'
#' @format A tibble with 900 rows and 15 variables:
#' \describe{
#'   \item{season}{Season number}
#'   \item{game_id}{Game identifier}
#'   \item{player_id}{Player identifier}
#'   \item{team_id}{Team identifier}
#'   \item{wickets_scored}{Number of wickets scored (Poisson distributed)}
#'   \item{opposite_touchdowns}{Touchdowns in the opposite direction (can be negative!)}
#'   \item{time_reversal_bonus}{Bonus points from time reversal zones}
#'   \item{mask_points}{Points earned while wearing the sacred mask}
#'   \item{flag_captures}{Number of Calvinball flag captures}
#'   \item{invisible_zones_crossed}{Invisible zones successfully navigated}
#'   \item{spontaneous_rule_declarations}{New rules declared during the game}
#'   \item{song_quality_score}{Quality rating of victory songs (0-10)}
#'   \item{minutes_played}{Minutes played in the game}
#'   \item{fouls_committed}{Fouls committed (usually just accusations)}
#'   \item{style_points}{Style points awarded (0-100) - very important!}
#' }
#'
#' @examples
#' head(cb_player_stats)
#'
#' # Who has the most style points in a single game?
#' cb_player_stats[which.max(cb_player_stats$style_points), ]
#'
#' @source Synthetically generated data inspired by Calvin and Hobbes
"cb_player_stats"
