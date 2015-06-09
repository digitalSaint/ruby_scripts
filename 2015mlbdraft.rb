#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'
require 'pp'

url = 'http://mlb.mlb.com/mlb/events/draft/y2015/drafttracker.jsp#/ft=school&fv=o'
xp = '//table/tbody[@id="currentpickstable"]/tr'
doc = Nokogiri::HTML(open(url))
puts doc
current_picks_table = doc.xpath(xp)

details = current_picks_table.each do |row|
  puts 'hello world'
  detail = {}
  [
    [:round, 'td[1]/text()'],
    [:pick, 'td[2]/text()'],
    [:name, 'td[4]/text()'],
    [:school, 'td[5]/text()'],
    [:position, 'td[6]/text()'],
    [:batsthrows, 'td[7]/text()'],
    [:class, 'td[8]/text()'],
    [:info, 'td[10]/span/text()'],
  ].each do |name, xpath|
    detail[name] = row.at_xpath(xpath).to_s.strip
  end
  pp detail
end
pp details
