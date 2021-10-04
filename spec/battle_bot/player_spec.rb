# frozen_string_literal: true

require 'battle_bot/player'

RSpec.describe BattleBot::Player do
  it 'has a user' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.user).to eq(1)
  end

  it 'has health' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.health).to eq(10)
  end

  it 'has damage' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.damage).to eq(1)
  end

  it 'has speed' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.speed).to eq(1)
  end
end
