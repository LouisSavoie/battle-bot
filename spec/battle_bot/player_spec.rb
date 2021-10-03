# frozen_string_literal: true

require 'battle_bot/player'

RSpec.describe BattleBot::Player do
  it 'has id' do
    player = described_class.new('test')
    expect(player.id).to eq('test')
  end
end