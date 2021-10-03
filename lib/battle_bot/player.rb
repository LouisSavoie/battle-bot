# frozen_string_literal: true

module BattleBot
  # Player class for storing players stats
  class Player
    attr_reader :id

    def initialize(id)
      @id = id
    end
  end
end