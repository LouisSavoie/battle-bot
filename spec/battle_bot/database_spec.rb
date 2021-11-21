# frozen_string_literal: true

require 'battle_bot/database'
require 'battle_bot/server'
require 'yaml'

RSpec.describe BattleBot::Database do
  subject(:database) { described_class.new 'test.yaml' }

  let(:testdata) do
    { server1: { battle1: { player1: 'Tom', player2: 'Jake' },
                 battle2: { player1: 'Carol', player2: 'Jackie' } },
      server2: { battle1: { player1: 'DQ', player2: 'Dave' },
                 battle2: { player1: 'Joe', player2: 'Tyler' } } }
  end

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
    let(:test_server) { BattleBot::Server.new('test') }

    it 'adds a server to @data' do
      database.add_server(test_server)
      expect(database.data).to eq({ 'test' => test_server })
    end
  end
end
