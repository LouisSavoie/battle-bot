# frozen_string_literal: true

module BattleBot
  # Server class for storing current battles
  class Server
    attr_reader :server_id, :battles, :players

    def initialize(server_id, battles = {}, players = {})
      @server_id = server_id
      @players = players
      @battles = battles
    end

    def add_battle(battle)
      battles[battle.battle_id] = battle
    end

    def remove_battle(battle_id)
      battles.delete(battle_id)
    end

    def add_player(player)
      players[player.user_id] = player
    end

    def remove_player(user_id)
      players.delete(user_id)
    end
  end
end
