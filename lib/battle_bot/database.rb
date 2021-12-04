# frozen_string_literal: true

require 'yaml'

module BattleBot
  # Database class for storing all current battle data.
  class Database
    attr_reader :data

    def initialize(data_file = 'data.yaml')
      @data = {}
      read_file(data_file)
    end

    def write_file(data_file = 'data.yaml')
      File.open(data_file, 'w') { |file| file.write(@data.to_yaml) }
    end

    def read_file(data_file = 'data.yaml')
      classes = [Symbol, BattleBot::Server, BattleBot::Player, BattleBot::Battle]
      data_from_file = YAML.safe_load(File.read(data_file), classes)
    rescue Errno::ENOENT
      write_file(data_file)
      @data = YAML.safe_load(File.read(data_file))
    else
      @data = data_from_file
    end

    def add_server(server, data_file = 'data.yaml')
      return if @data[server.server_id]

      @data[server.server_id] = server
      puts 'Server added to database'
      write_file(data_file)
      puts 'Database saved to file'
    end

    def add_player(server_id, player, data_file = 'data.yaml')
      return if @data[server_id].players[player.user_id]

      @data[server_id].add_player player
      puts 'Player added to server in database'
      write_file(data_file)
      puts 'Database saved to file'
    end
  end
end
