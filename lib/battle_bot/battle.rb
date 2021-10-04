# frozen_string_literal: true

module BattleBot
  # Battle class for storing current battle players
  class Battle
    attr_reader :player1, :player2, :log

    def initialize(player1, player2, log)
      @player1 = player1
      @player2 = player2
      @log = log
    end
  end
end
