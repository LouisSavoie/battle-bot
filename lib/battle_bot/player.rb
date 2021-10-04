# frozen_string_literal: true

module BattleBot
  # Player class for storing player stats
  class Player
    attr_reader :id, :hp, :ap, :sp

    def initialize(id, hp, ap, sp)
      @id = id
      @hp = hp
      @ap = ap
      @sp = sp
    end
  end
end