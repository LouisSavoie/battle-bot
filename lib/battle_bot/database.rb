# frozen_string_literal: true

module BattleBot
  # Database class for storing all current battle data.
  class Database
    attr_reader :data

    def initialize
      @data = {}
    end
  end
end