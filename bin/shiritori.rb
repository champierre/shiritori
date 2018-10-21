#!/usr/bin/env ruby

require "nkf"

def to_katakana(string)
  NKF.nkf("-w -h2", string)
end

word_data_file = File.expand_path('../data/word_data.txt', __dir__)
japanese_nouns = File.readlines(word_data_file).map {|string| string.chomp! }
japanese_nouns_as_katakana = japanese_nouns.map {|string| to_katakana(string) }

puts "I'll let you start. What's your first word?"
loop do
  word = to_katakana(gets.chomp)
  if japanese_nouns_as_katakana.include?(word)
    puts japanese_nouns.sample
  else
    puts "That doesn't count! You lose."
    exit
  end
end