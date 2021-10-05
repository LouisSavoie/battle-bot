# frozen_string_literal: true

require 'battle_bot/player'

RSpec.describe BattleBot::Player do
  let(:player) { described_class.new(1, 1, 1, 1) }
  it 'has a user' do
    expect(player.user).to eq(1)
  end

  it 'has health' do
    expect(player.health).to eq(1)
  end

  it 'has damage' do
    expect(player.damage).to eq(1)
  end

  it 'has speed' do
    expect(player.speed).to eq(1)
  end

  describe '.level_up' do
    it 'levels up player health, damage, or speed by 1' do
      player.level_up
      if player.health > 1
        expect(player.health).to eq(2)
      elsif player.damage > 1
        expect(player.damage).to eq(2)
      else
        expect(player.speed).to eq(2)
      end
    end
  end
end
