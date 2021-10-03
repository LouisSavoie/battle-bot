# frozen_string_literal: true

module BattleBot
  # Battle class for storing current battle players
  class Battle
    attr_reader :player1

    def initialize(player1)
      @player1 = player1
    end
  end
end
