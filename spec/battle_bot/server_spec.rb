# frozen_string_literal: true

require 'battle_bot/server'
require 'battle_bot/battle'
require 'battle_bot/player'

RSpec.describe BattleBot::Server do
  let(:player) { BattleBot::Player.new(1, 'Bob', 10, 1, 1) }
  let(:battle) { BattleBot::Battle.new(player, player) }
  let(:server) { described_class.new('test') }

  it 'has a battles hash' do
    expect(server.battles.class).to eq(Hash)
  end

  it 'has an id' do
    expect(server.server_id).to eq('test')
  end

  describe '.add_battle' do
    it 'can add battles' do
      server.add_battle('01_02', battle)
      expect(server.battles['01_02']).to eq(battle)
    end
  end

  describe '.remove_battle' do
    before do
      server.add_battle('01_02', battle)
    end

    it 'can delete battles' do
      server.remove_battle('01_02')
      expect(server.battles['01_02']).to eq(nil)
    end
  end
end
