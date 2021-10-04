# frozen_string_literal: true

require 'battle_bot/battle'
require 'battle_bot/player'

RSpec.describe BattleBot::Battle do
  let(:player1) { BattleBot::Player.new(1, 10, 1, 1) }
  let(:player2) { BattleBot::Player.new(1, 10, 2, 2) }
  let(:battle) {described_class.new(player1, player2, 'log')}

  it 'has a player1' do
    expect(battle.player1).to eq(player1)
  end

  it 'has a player2' do
    expect(battle.player2).to eq(player2)
  end

  it 'has a log' do
    expect(battle.log).to eq('log')
  end
end
