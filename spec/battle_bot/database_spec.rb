# frozen_string_literal: true

require 'battle_bot/database'

RSpec.describe BattleBot::Database do
  let(:database) { described_class.new }

  it 'has a data hash' do
    expect(database.data.class).to eq(Hash)
  end

  describe '.new_file' do
    it 'creates a blank yaml file' do
      database.new_file('test.yml')
      expect(File.read('test.yml')).to eq('')
      File.delete('test.yml')
    end
  end
end
