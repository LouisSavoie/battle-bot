# frozen_string_literal: true

require 'battle_bot/player'

RSpec.describe BattleBot::Player do
  it 'has an id' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.id).to eq(1)
  end

  it 'has hp' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.hp).to eq(10)
  end
  
  it 'has ap' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.ap).to eq(1)
  end
  
  it 'has sp' do
    player = described_class.new(1, 10, 1, 1)
    expect(player.sp).to eq(1)
  end
end