# frozen_string_literal: true

module BattleBot
  # Database class for storing all current battle data.
  class Database
    attr_reader :data

    def initialize
      @data = {}
    end

    def new_file(data_file = 'data.yml')
      File.open(data_file, 'w') { |file| file.write('') }
    end
  end
end
