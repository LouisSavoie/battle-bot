# frozen_string_literal: true

require_relative 'battle_bot/version'

module BattleBot
  class Error < StandardError; end
  # Your code goes here...
end

require 'discordrb'
require 'dotenv'
Dotenv.load

bot = Discordrb::Bot.new token: ENV['BOT_TOKEN']

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run
