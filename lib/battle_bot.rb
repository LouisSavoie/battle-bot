# frozen_string_literal: true

require 'discordrb'
require 'dotenv'
Dir[File.join(__dir__, 'battle_bot', '*.rb')].each { |file| require file }
Dotenv.load

# Main bot Module
module BattleBot
  class << self
    attr_accessor :bot
  end

  self.bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: 'bb '

  db = BattleBot::Database.new

  bot.ready do
    bot.watching = 'bb help'
  end

  bot.command :help do |event|
    event.respond 'I\'m helpful!'
  end

  bot.command :challenge do |event|
    # ignore messages not in the bb-arena channel
    if event.channel.name == 'bb-arena'
      # respond to challenges without a mention
      if event.message.mentions.empty?
        event.respond 'Who are you challenging?'
      # respond to challenging the bot
      elsif event.message.mentions[0].mention == "<@#{bot.profile.id}>"
        event.respond "#{event.author.mention}, I'm just the ref here."
      # base case, create the battle
      else
        # create the server if it doesn't exist in db
        # add a Database.include? method to call instead of this
        unless db.data.include? event.server.id
          # add this to the Database.add_server method, rubo cop might force you to make helper methods for it
          server = BattleBot::Server.new event.server.id
          db.add_server server
          puts 'server added'
          db.write_file
          puts 'db saved to file'
        end
        # do more stuff
        # player1 = BattleBot::Player.new event.author.id, event.author.name
        # player2 = BattleBot::Player.new event.message.mentions[0].id, event.message.mentions[0].name
        # send confirmation of challenge
        event.respond "#{event.author.mention} challenges #{event.message.mentions[0].mention}!"
      end
    end
  end

  bot.command :accept do |event|
    if event.channel.name == 'bb-arena'
      if event.message.mentions.empty?
        event.respond 'Who\'s challenge are you accepting?'
      else
        event.respond "#{event.author.mention} accepts #{event.message.mentions[0].mention}'s challenge!"
      end
    end
  end
end
