# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats and methods
  class Player
    attr_reader :user, :name
    attr_accessor :health, :damage, :speed

    def initialize(user, name, health, damage, speed)
      @user = user
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
