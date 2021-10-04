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
  end
end
