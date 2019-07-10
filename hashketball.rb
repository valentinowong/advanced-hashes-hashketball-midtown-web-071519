# Write your code here!

require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [ {
          "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }
        }, {
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }
        }, {
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }
        }, {
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }
        }, {
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        }, 
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [ {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }
        }, {
          "Bismack Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          }
        }, {
          "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          }
        }, {
          "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0,
          }
        }, {
          "Kemba Walker" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        }, 
      ]
    }
  }
  hash
end

def num_points_scored(player_name)
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if [player_name] == player.keys
        points = player[player_name][:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  players_shoe = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if [player_name] == player.keys
        players_shoe = player[player_name][:shoe]
      end
    end
  end
  players_shoe
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end

def team_names
  arr = []
  game_hash.each do |location, team_data|
    arr.push(team_data[:team_name])
  end
  arr
end

def player_numbers(name)
  arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if team_data[:team_name] == name
        player.each do |player_name, stats|
          arr.push(stats[:number])
        end
      end
    end
  end
  arr
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if [player_name] == player.keys
        return player[player_name]
      end
    end
  end  
end

def big_shoe_rebounds
  player_name = ""
  shoe_size = 0
  players_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name,stats|
        if stats[:shoe] > shoe_size
          shoe_size = stats[:shoe]
          player_name = name
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if [player_name] == player.keys
        players_rebounds = player[player_name][:rebounds]
      end
    end
  end
  players_rebounds
end

def most_points_scored
  player_name = ""
  points_scored = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name,stats|
        if stats[:points] > points_scored
          points_scored = stats[:points]
          player_name = name
        end
      end
    end
  end
  player_name
end

def winning_team
  new_hash = {}
  game_hash.each do |location, team_data|
    total_points = 0
    team_data[:players].each do |player|
      player.each do |name,stats|
        total_points += stats[:points]
      end
    end
    new_hash[location] = total_points
  end
  if new_hash[:home] > new_hash[:away]
    game_hash[:home][:team_name]
    else 
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player_name = ""
  name_length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name,stats|
        if name.length > name_length
          name_length = name.length
          player_name = name
        end
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  most_stealer = ""
  steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player.each do |name,stats|
        if stats[:steals] > steals
          steals = stats[:steals]
          most_stealer = name
        end
      end
    end
  end
  player_with_longest_name == most_stealer
end