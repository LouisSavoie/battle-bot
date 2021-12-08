# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats and methods
  class Player
    attr_reader :user_id, :name
    attr_accessor :max_health, :health, :damage, :speed

    def initialize(user_id, name, max_health = 10, damage = 1, speed = 0)
      @user_id = user_id
      @name = name
      @max_health = max_health
      @health = max_health
      @damage = damage
      @speed = speed
    end

    def level_up
      stats = %w[max_health damage speed]
      stat = stats.sample
      stat_value = send(stat)
      send("#{stat}=", stat_value + 1)
      stat
    end

    def reset_health
      @health = @max_health
    end
  end
end
