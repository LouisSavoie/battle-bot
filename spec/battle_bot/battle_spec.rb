# frozen_string_literal: true

require 'battle_bot/battle'
require 'battle_bot/player'

RSpec.describe BattleBot::Battle do
  it 'has a player1' do
    player1 = BattleBot::Player.new(1, 10, 1, 1)
    player2 = BattleBot::Player.new(1, 10, 2, 2)
    battle = described_class.new(player1, player2, "log")
    expect(battle.player1).to eq(player1)
  end
  it 'has a player2' do
    player1 = BattleBot::Player.new(1, 10, 1, 1)
    player2 = BattleBot::Player.new(1, 10, 2, 2)
    battle = described_class.new(player1, player2, "log")
    expect(battle.player2).to eq(player2)
  end
  it 'has a log' do
    player1 = BattleBot::Player.new(1, 10, 1, 1)
    player2 = BattleBot::Player.new(1, 10, 2, 2)
    battle = described_class.new(player1, player2, "log")
    expect(battle.log).to eq("log")
  end
end
