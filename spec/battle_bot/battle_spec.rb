# frozen_string_literal: true

require 'battle_bot/battle'
require 'battle_bot/player'

RSpec.describe BattleBot::Battle do
  let(:player) { BattleBot::Player.new(1, 'Bob', 10, 1, 1) }
  let(:battle) { described_class.new(player, player) }

  it 'has a player1' do
    expect(battle.player1).to eq(player)
  end

  it 'has a player2' do
    expect(battle.player2).to eq(player)
  end

  it 'has a log' do
    expect(battle.log).to eq([])
  end

  it 'can add to it\'s log' do
    battle.log.push('test')
    expect(battle.log).to eq(['test'])
  end

  describe '.fight' do
    it 'returns it\'s log' do
      expect(battle.fight).to eq(battle.log)
    end
  end

  describe '.initiative' do
    it 'returns a winning player' do
      expect(battle.initiative).to be_a_kind_of BattleBot::Player
    end

    it 'adds to the log' do
      battle.initiative
      expect(battle.log.count).to eq(1)
    end
  end
end
