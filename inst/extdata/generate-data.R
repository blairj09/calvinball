# Calvinball League - Synthetic Sports Performance Data Generator
# Based on the legendary game from Calvin and Hobbes
# "The only permanent rule is that you can't play it the same way twice!"

library(tidyverse)

set.seed(42)  # For reproducibility (though Calvinball shouldn't be reproducible!)

# League parameters
n_players <- 30
n_teams <- 6
n_games <- 50
n_seasons <- 3

# Generate players with creative Calvinball-style names
generate_player_names <- function(n) {
  first_names <- c("Calvin", "Hobbes", "Susie", "Moe", "Rosalyn", "Spaceman",
                   "Stupendous", "Captain", "Commander", "Doctor", "Professor",
                   "Agent", "Sir", "Madame", "Lord", "Duke", "Baron")
  last_names <- c("Spiff", "Zoom", "Thunder", "Lightning", "Quantum", "Nebula",
                  "Vortex", "Cosmic", "Derkins", "Wormwood", "Tracer", "Slime",
                  "Wickerbill", "Spittle", "Hamster", "Napalm", "Torpid")
  
  tibble(
    player_id = 1:n,
    player_name = paste(
      sample(first_names, n, replace = TRUE),
      sample(last_names, n, replace = TRUE)
    )
  )
}

# Generate teams
generate_teams <- function(n_teams) {
  team_names <- c(
    "Transmogrifiers", "Time Travelers", "Duplicators",
    "Dinosaur Riders", "Space Explorers", "G.R.O.S.S. Members",
    "Snowmen Builders", "Cardboard Box Racers"
  )
  
  tibble(
    team_id = 1:n_teams,
    team_name = sample(team_names, n_teams, replace = FALSE)
  )
}

# Assign players to teams
assign_players_to_teams <- function(players, n_teams) {
  players %>%
    mutate(team_id = sample(rep(1:n_teams, length.out = n())))
}

# Generate game results with chaotic Calvinball scoring
generate_games <- function(n_games, n_teams, n_seasons) {
  
  # Calvinball scoring types (because rules change constantly!)
  scoring_types <- c("wickets", "vortex_points", "opposite_points", 
                     "time_zones", "song_scores", "invisible_sectors",
                     "spontaneous_declarations", "base_nonsensicals")
  
  games <- tibble()
  
  for (season in 1:n_seasons) {
    for (game in 1:n_games) {
      # Random matchup
      teams <- sample(1:n_teams, 2)
      
      # Calvinball scores are wildly unpredictable
      # Sometimes negative, sometimes in the thousands
      score_type <- sample(scoring_types, 1)
      
      # Different scoring distributions for chaos
      if (runif(1) < 0.1) {  # 10% chance of extreme scores
        score1 <- round(rnorm(1, 1000, 500))
        score2 <- round(rnorm(1, 1000, 500))
      } else if (runif(1) < 0.15) {  # 15% chance of negative scores
        score1 <- round(rnorm(1, -50, 30))
        score2 <- round(rnorm(1, -50, 30))
      } else {  # Normal chaos
        score1 <- round(rexp(1, 0.05))
        score2 <- round(rexp(1, 0.05))
      }
      
      games <- bind_rows(games, tibble(
        season = season,
        game_id = (season - 1) * n_games + game,
        date = as.Date("2023-01-01") + (season - 1) * 180 + game * 3,
        team_home = teams[1],
        team_away = teams[2],
        score_home = score1,
        score_away = score2,
        scoring_type = score_type,
        winner = ifelse(score1 > score2, teams[1], 
                       ifelse(score2 > score1, teams[2], NA))  # Ties are possible!
      ))
    }
  }
  
  games
}

# Generate individual player statistics (chaos incarnate)
generate_player_stats <- function(players, games) {
  
  stats <- tibble()
  
  for (i in 1:nrow(games)) {
    game <- games[i, ]
    
    # Random players from each team participated
    home_players <- players %>% 
      filter(team_id == game$team_home) %>% 
      sample_n(min(3, n()))
    
    away_players <- players %>% 
      filter(team_id == game$team_away) %>% 
      sample_n(min(3, n()))
    
    all_game_players <- bind_rows(home_players, away_players)
    
    # Generate wild Calvinball stats
    for (j in 1:nrow(all_game_players)) {
      player <- all_game_players[j, ]
      
      stats <- bind_rows(stats, tibble(
        season = game$season,
        game_id = game$game_id,
        player_id = player$player_id,
        team_id = player$team_id,
        # Calvinball "statistics" (made up on the spot!)
        wickets_scored = rpois(1, 2),
        opposite_touchdowns = sample(-5:10, 1),
        time_reversal_bonus = rnorm(1, 0, 5),
        mask_points = rpois(1, 1),
        flag_captures = sample(0:3, 1),
        invisible_zones_crossed = rpois(1, 1),
        spontaneous_rule_declarations = rpois(1, 0.5),
        song_quality_score = runif(1, 0, 10),
        minutes_played = round(runif(1, 5, 45)),
        fouls_committed = rpois(1, 1),  # Usually just accusations
        style_points = runif(1, 0, 100)  # Very important in Calvinball!
      ))
    }
  }
  
  stats
}

# Generate all data
cat("Generating Calvinball League Data...\n")
cat("Remember: The score is still Q to 12!\n\n")

players <- generate_player_names(n_players)
teams <- generate_teams(n_teams)
players <- assign_players_to_teams(players, n_teams)

cat(sprintf("Created %d players on %d teams\n", nrow(players), nrow(teams)))

games <- generate_games(n_games, n_teams, n_seasons)
cat(sprintf("Generated %d games across %d seasons\n", nrow(games), n_seasons))

player_stats <- generate_player_stats(players, games)
cat(sprintf("Compiled %d individual player performance records\n", nrow(player_stats)))

# Add some derived metrics
players_with_stats <- player_stats %>%
  group_by(player_id) %>%
  summarise(
    games_played = n(),
    avg_wickets = mean(wickets_scored),
    total_opposite_touchdowns = sum(opposite_touchdowns),
    avg_style_points = mean(style_points),
    total_rule_declarations = sum(spontaneous_rule_declarations),
    avg_time_played = mean(minutes_played)
  ) %>%
  left_join(players, by = "player_id")

teams_with_records <- games %>%
  pivot_longer(cols = c(team_home, team_away), 
               names_to = "home_away", 
               values_to = "team_id") %>%
  mutate(
    won = case_when(
      home_away == "team_home" & score_home > score_away ~ 1,
      home_away == "team_away" & score_away > score_home ~ 1,
      TRUE ~ 0
    ),
    lost = case_when(
      home_away == "team_home" & score_home < score_away ~ 1,
      home_away == "team_away" & score_away < score_home ~ 1,
      TRUE ~ 0
    ),
    tied = case_when(
      score_home == score_away ~ 1,
      TRUE ~ 0
    )
  ) %>%
  group_by(team_id, season) %>%
  summarise(
    wins = sum(won),
    losses = sum(lost),
    ties = sum(tied),
    .groups = "drop"
  ) %>%
  left_join(teams, by = "team_id")

# Save datasets
write_csv(players, "data/players.csv")
write_csv(teams, "data/teams.csv")
write_csv(games, "data/games.csv")
write_csv(player_stats, "data/player_stats.csv")
write_csv(players_with_stats, "data/players_summary.csv")
write_csv(teams_with_records, "data/team_records.csv")

cat("\n=== Data Generation Complete! ===\n")
cat("Files created:\n")
cat("  - players.csv: Player roster\n")
cat("  - teams.csv: Team information\n")
cat("  - games.csv: Game results\n")
cat("  - player_stats.csv: Individual game performances\n")
cat("  - players_summary.csv: Player career statistics\n")
cat("  - team_records.csv: Team records by season\n")
cat("\nOlly olly oxen free! The Calvinball League awaits!\n")
