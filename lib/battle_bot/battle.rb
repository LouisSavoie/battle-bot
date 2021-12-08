# frozen_string_literal: true

module BattleBot
  # Battle class for storing players, battle log, and methods
  class Battle
    attr_reader :player1, :player2, :battle_id
    attr_accessor :log

    def initialize(player1, player2)
      @battle_id = "#{player1.user_id}_#{player2.user_id}"
      @player1 = player1
      @player2 = player2
      @log = []
    end

    def fight
      death = [false]
      until death[0]
        players = initiative
        death = combat(players[0], players[1])
        next if death[0]

        death = combat(players[1], players[0])
      end
      player1.reset_health
      player2.reset_health
      [log, death[1]]
    end

    def initiative
      initiatives = roll_initiatives
      log.push("\n\n**Initiative**: #{player1.name} got #{initiatives[0]}, #{player2.name} got #{initiatives[1]}")
      initiatives[0] > initiatives[1] ? [player1, player2] : [player2, player1]
    end

    def roll_initiatives
      player1_initiative = rand(1..20) + player1.speed
      player2_initiative = rand(1..20) + player2.speed
      [player1_initiative, player2_initiative]
    end

    def combat(attacking_player, defending_player)
      attack(attacking_player, defending_player)
      death = death_check(defending_player)
      autopsy(defending_player, attacking_player) if death
      [death, attacking_player]
    end

    def attack(attacking_player, defending_player)
      damage = rand(1..attacking_player.damage)
      defending_player.health -= damage
      log.push("\n**#{attacking_player.name}** dealt **#{damage}** damage to **#{defending_player.name}**",
               "\n**#{defending_player.name}'s** health is now **#{defending_player.health}**.")
    end

    def death_check(player)
      player.health <= 0
    end

    def autopsy(dead_player, winning_player)
      log.push("\n**#{dead_player.name}** is **dead**. **#{winning_player.name}** wins the battle!")
      stat = winning_player.level_up
      log.push("\n**#{winning_player.name}** leveled up! Their **#{stat}** increased by **1**!")
    end
  end
end
