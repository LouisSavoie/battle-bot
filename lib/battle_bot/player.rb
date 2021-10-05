# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats
  class Player
    attr_reader :user, :health, :damage, :speed

    def initialize(user, health, damage, speed)
      @user = user
      @health = health
      @damage = damage
      @speed = speed
    end

    def level_up
      random = rand(1..3)
      case random
      when 1
        @health += 1
      when 2
        @damage += 1
      else
        @speed += 1
      end
    end
  end
end
