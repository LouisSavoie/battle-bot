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

    def write_file(data_file = 'data.yaml')
      File.open(data_file, 'w') { |file| file.write(@data) }
    end

    def read_file(data_file = 'data.yaml')
      data_from_file = YAML.safe_load(File.read(data_file), [Symbol])
    rescue Errno::ENOENT
      write_file(data_file)
      @data = YAML.safe_load(File.read(data_file))
    else
      @data = data_from_file
    end

    def add_server(server)
      @data[server.server_id] = server
    end
  end
end
