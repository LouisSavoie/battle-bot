# frozen_string_literal: true

require 'battle_bot/battle'

RSpec.describe BattleBot::Battle do
  it 'has a player1' do
    battle = described_class.new('test')
    expect(battle.player1).to eq('test')
  end
end
