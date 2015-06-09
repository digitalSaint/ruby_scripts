#!/usr/bin/env ruby
#
#
require 'json'
require 'open-uri'
require 'pp'


url = 'http://mlb.mlb.com/gdcross/mlb/events/draft/y2015/data/school/o.json'
players_json = JSON.load(open(url))
players_tmp = players_json['data_records']['player']
players = JSON.parse(players_tmp.to_json, { :symbolize_names => true })

players.each do |player|
  if player[:school_city] == "Stillwater"
    unless player[:round].empty?
      puts "team: " + player[:pick_team]
      puts "round: " + player[:round] + " pick: " + player[:pick_num]
    end
    #pp player
    puts player[:first_name] + " " + player[:last_name]
    puts "height: " + player[:height]
    puts "weight: " + player[:weight]
    puts "bats: " + player[:bats]
    puts "throws: " + player[:throws]
    puts "dob: " + player[:dob]
    puts "position: " + player[:position]
    puts "class: " + player[:school_class]
    puts "school: " + player[:school_name]
    puts ""
  end
end
