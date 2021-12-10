# frozen_string_literal: true

require 'battle_bot/player'

RSpec.describe BattleBot::Player do
  let(:player) { described_class.new(1, 'Bob', 1, 1, 1, 1) }

  it 'has a user_id' do
    expect(player.user_id).to eq(1)
  end

  it 'has a name' do
    expect(player.name).to eq('Bob')
  end

  it 'has max_health' do
    expect(player.max_health).to eq(1)
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

  it 'has hit' do
    expect(player.hit).to eq(1)
  end

  describe '.level_up' do
    it 'levels up player max_health, damage, or speed by 1' do
      stat = player.level_up
      expect(player.send(stat)).to eq(2)
    end
  end

  describe '.reset_health' do
    it 'resets player health to max_health' do
      player.health = 0
      player.reset_health
      expect(player.health).to eq(player.max_health)
    end
  end

  describe '.change_name' do
    it 'changes @name to new_name' do
      player.change_name('Doug')
      expect(player.name).to eq('Doug')
    end
  end
end
