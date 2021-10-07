# frozen_string_literal: true

module BattleBot
  # Battle class for storing current battle players
  class Server
    attr_reader :battles

    def initialize(battles = {})
      @battles = battles
    end

    def add_battle(key, battle)
      battles[key] = battle
    end

    def remove_battle(key)
      battles.delete(key)
    end
  end
end
