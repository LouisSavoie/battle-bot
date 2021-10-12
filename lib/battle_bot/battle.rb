# frozen_string_literal: true

module BattleBot
  # Battle class for storing current battle players
  class Battle
    attr_reader :player1, :player2
    attr_accessor :log

    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @log = []
    end

    def fight
      log
    end

    def initiative
      player1_initiative = rand(1..20) + player1.speed
      player2_initiative = rand(1..20) + player2.speed
      log.push("Initiative: #{player1.name} got #{player1_initiative}, #{player2.name} got #{player2_initiative}")
      player1_initiative > player2_initiative ? player1 : player2
    end

    def attack(attacking_player, defending_player)
      damage = rand(1..attacking_player.damage)
      defending_player.health -= damage
      log.push("#{attacking_player.name} dealt #{damage} damage to #{defending_player.name}")
    end

    def death_check(player)
      player.health <= 0
    end
  end
end
