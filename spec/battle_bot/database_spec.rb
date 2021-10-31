# frozen_string_literal: true

require 'battle_bot/database'

RSpec.describe BattleBot::Database do
  let(:database) { described_class.new }

  it 'has a data hash' do
    expect(database.data.class).to eq(Hash)
  end
end