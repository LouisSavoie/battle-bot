# frozen_string_literal: true

require 'battle_bot/database'
require 'battle_bot/server'
require 'battle_bot/battle'
require 'battle_bot/player'
require 'yaml'

RSpec.describe BattleBot::Database do
  subject(:database) { described_class.new 'test.yaml' }

  let(:testdata) do
    { server1: { battle1: { player1: 'Tom', player2: 'Jake' },
                 battle2: { player1: 'Carol', player2: 'Jackie' } },
      server2: { battle1: { player1: 'DQ', player2: 'Dave' },
                 battle2: { player1: 'Joe', player2: 'Tyler' } } }
  end
  let(:test_server) { BattleBot::Server.new(555) }
  let(:test_player) { BattleBot::Player.new(1, 'Bob', 10, 1, 1) }
  let(:test_battle) { BattleBot::Battle.new(test_player, test_player) }

  it 'has a data hash' do
    expect(database.data.class).to eq(Hash)
  end

  describe '.write_file' do
    it 'writes @data to YAML file' do
      database.write_file('test.yaml')
      expect(YAML.safe_load(File.read('test.yaml'), [Symbol, BattleBot::Server])).to eq(database.data)
      File.delete('test.yaml')
    end
  end

  describe '.read_file' do
    it 'reads YAML file into @data' do
      File.open('test.yaml', 'w') { |file| file.write(testdata.to_yaml) }
      database.read_file('test.yaml')
      expect(database.data).to eq(testdata)
      File.delete('test.yaml')
    end
  end

  describe '.add_server' do
    it 'adds a server to @data' do
      database.add_server(test_server, 'test.yaml')
      expect(database.data).to eq({ 555 => test_server })
      File.delete('test.yaml')
    end
  end

  describe '.add_player' do
    it 'adds a player to a server in @data' do
      database.add_server(test_server, 'test.yaml')
      database.add_player(555, test_player, 'test.yaml')
      expect(database.data[555].players).to eq({ 1 => test_player })
      File.delete('test.yaml')
    end
  end

  describe '.add_battle' do
    it 'adds a battle to a server in @data' do
      database.add_server(test_server, 'test.yaml')
      database.add_battle(555, test_battle, 'test.yaml')
      expect(database.data[555].battles).to eq({ '1_1' => test_battle })
      File.delete('test.yaml')
    end
  end

  describe '.update_player' do
    before do
      database.add_server(test_server, 'test.yaml')
      database.add_player(555, test_player, 'test.yaml')
      database.add_battle(555, test_battle, 'test.yaml')
    end

    it 'updates player in server' do
      res = database.data[555].battles['1_1'].fight
      database.update_player(555, res[1], 'test.yaml')
      expect(database.data[555].players).to eq({ 1 => test_player })
      File.delete('test.yaml')
    end
  end

  describe '.remove_battle' do
    it 'removes a battle from a server in @data' do
      database.add_server(test_server, 'test.yaml')
      database.add_battle(555, test_battle, 'test.yaml')
      database.remove_battle(555, '1_1', 'test.yaml')
      expect(database.data[555].battles).to eq({})
      File.delete('test.yaml')
    end
  end
end
