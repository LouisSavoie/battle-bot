# frozen_string_literal: true

require 'yaml'

module BattleBot
  # Database class for storing all current battle data.
  class Database
    attr_reader :data

    def initialize
      @data = {}
      read_file
    end

    def new_file(data_file = 'data.yml')
      File.open(data_file, 'w') { |file| file.write(@data) }
    end

    def read_file(data_file = 'data.yml')
      data_from_file = YAML.safe_load(File.read(data_file), [Symbol])
    rescue Errno::ENOENT
      new_file(data_file)
      @data = YAML.safe_load(File.read(data_file))
    else
      @data = data_from_file
    end
  end
end
