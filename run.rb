require_relative "score_reader"

reader = ScoreReader.new("football.dat")
reader.read
min_spread = reader.min_spread
puts "#{min_spread[0]} #{min_spread[1]}"
