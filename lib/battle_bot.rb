# frozen_string_literal: true

require 'discordrb'
require 'dotenv'
Dir[File.join(__dir__, 'battle_bot', '*.rb')].each { |file| require file }
Dotenv.load

# Main bot Module
module BattleBot
  class << self
    attr_accessor :bot, :db

    def check_for_player(server_id, player_id, player_name)
      if db.data[server_id].players.include? player_id
        db.data[server_id].players[player_id]
      else
        BattleBot::Player.new player_id, player_name
      end
    end
  end

  if ENV['BOT_TOKEN']
    self.bot = Discordrb::Commands::CommandBot.new token: ENV['BOT_TOKEN'], prefix: 'bb '

    self.db = BattleBot::Database.new

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
          db.add_server BattleBot::Server.new event.server.id
          # create players if they don't exist in db>server
          player1 = check_for_player event.server.id, event.author.id, event.author.name
          player2 = check_for_player event.server.id, event.message.mentions[0].id, event.message.mentions[0].name
          db.add_player event.server.id, player1
          db.add_player event.server.id, player2
          # create battle and add to server
          battle = BattleBot::Battle.new player1, player2
          db.add_battle event.server.id, battle
          # send confirmation of challenge
          event.respond "#{event.author.mention} challenges #{event.message.mentions[0].mention}!"
        end
      end
    end

    bot.command :accept do |event|
      # ignore messages not in the bb-arena channel
      if event.channel.name == 'bb-arena'
        # respond to challenges without a mention
        if event.message.mentions.empty?
          event.respond 'Who\'s challenge are you accepting?'
        # respond to challenging the bot
        elsif event.message.mentions[0].mention == "<@#{bot.profile.id}>"
          event.respond "#{event.author.mention}, I'm just the ref here."
        # base case, run the battle
        elsif db.data[event.server.id].battles["#{event.message.mentions[0].id}_#{event.author.id}"]
          event.respond "#{event.author.mention} accepts #{event.message.mentions[0].mention}'s challenge!"
          res = db.data[event.server.id].battles["#{event.message.mentions[0].id}_#{event.author.id}"].fight
          res_arr = res[0].each_slice(40)
          res_arr.each { |res_part| event.respond res_part.join('') }
          db.update_player(event.server.id, res[1])
          db.remove_battle(event.server.id, "#{event.message.mentions[0].id}_#{event.author.id}")
        # respond if cannot find battle
        else
          event.respond "I cannot find a challenge from #{event.message.mentions[0].mention} for you."
        end
      end
    end
  end
end
