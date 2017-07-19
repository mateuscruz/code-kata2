class ScoreReader
  def initialize(path)
    @file = File.new(path, "r")
    @spread = {}
  end

  def read
    while(line = file.gets)
      regex = /\s+\d+\.\s(?<team>\w+)(.+?)(?<for>\d+)\s+\-\s+(?<against>\d+)/
      if(@matched_line = line.match(regex))
        calculate_spread
      end
    end
  end

  def min_spread
    spread.select{ |key, value| value == spread.values.min }.to_a.flatten
  end

  private

  def calculate_spread
    team = matched_line[:team]
    for_points = matched_line[:for].to_i
    against_points = matched_line[:against].to_i
    spread[team] = (for_points - against_points).abs
  end

  attr_reader :file, :matched_line, :spread
end
