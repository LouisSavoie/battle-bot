# frozen_string_literal: true

module BattleBot
  # Server class for storing current battles
  class Server
    attr_reader :battles, :server_id

    def initialize(server_id, battles = {})
      @server_id = server_id
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
