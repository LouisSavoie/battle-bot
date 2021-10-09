# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats
  class Player
    attr_reader :user
    attr_accessor :health, :damage, :speed

    def initialize(user, health, damage, speed)
      @user = user
      @health = health
      @damage = damage
      @speed = speed
    end

    def level_up
      stats = { '1': 'health', '2': 'damage', '3': 'speed' }
      stat = stats[rand(1..3).to_s.to_sym]
      stat_value = send(stat)
      send("#{stat}=", stat_value + 1)
      stat
    end
  end
end
