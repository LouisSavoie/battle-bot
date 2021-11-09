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

  if ENV['BOT_TOKEN']
    self.bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: 'bb '
    bot.ready do
      bot.watching = 'bb help'
    end

    bot.command :help do |event|
      event.respond 'I\'m helpful!'
    end

    bot.command :challenge do |event|
      if event.message.mentions.empty?
        event.respond 'Who are you challenging?'
      else
        challenged = event.message.mentions[0].mention
        event.respond "#{event.author.mention} challenges #{challenged}!"
      end
    end

    bot.command :accept do |event|
      if event.message.mentions.empty?
        event.respond 'Who\'s challenge are you accepting?'
      else
        challenger = event.message.mentions[0].mention
        event.respond "#{event.author.mention} accepts #{challenger}'s challenge!"
      end
    end
  end
end
