# frozen_string_literal: true

module BattleBot
  # Server class for storing current battles
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
