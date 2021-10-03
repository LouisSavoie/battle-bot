# frozen_string_literal: true

require_relative 'battle_bot/version'
require 'discordrb'
require 'dotenv'
Dotenv.load

# Main bot Module
module BattleBot
  class << self
    attr_accessor :bot
  end

  self.bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

  bot.message(with_text: 'Ping!') do |event|
    event.respond 'Pong!'
  end
end
