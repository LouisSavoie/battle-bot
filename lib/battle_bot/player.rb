# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats and methods
  class Player
    attr_reader :user_id, :name
    attr_accessor :health, :damage, :speed

    def initialize(user_id, name, health = 10, damage = 1, speed = 0)
      @user_id = user_id
      @name = name
      @health = health
      @damage = damage
      @speed = speed
    end

    def level_up
      stats = %w[health damage speed]
      stat = stats.sample
      stat_value = send(stat)
      send("#{stat}=", stat_value + 1)
      stat
    end
  end
end
