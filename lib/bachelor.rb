# Takes in two arguments (hash called data and a season)
# The method should return the first name of that season's winner
def get_first_name_of_season_winner(data, season)
  winner = []
  data[season].each do |bio_key, _|
      if bio_key["status"] == "Winner"
        winner = bio_key["name"].split
      end
  end
  return winner[0]
end

# or
# data[season].each do |bio_key, _|
#     if bio_key["status"] == "Winner"
#       return bio_key["name"].split[0]
#     end
# end

# Takes in the data hash and an occupation string
# Returns the name of the woman with that occupation
def get_contestant_name(data, occupation)
  data.each do |_, bio_hash|
      bio_hash.each do |bio_key, _|
          if bio_key["occupation"] == occupation
              return bio_key["name"]
          end
      end
  end
end

# Takes in data hash and hometown string
# Returns number of contestants from that hometown
def count_contestants_by_hometown(data, hometown)
  number = 0
  data.each do |_, bio_hash|
      bio_hash.each do |bio_key, _|
          if bio_key["hometown"] == hometown
              number += 1
          end
      end
  end
  return number
end

# Takes in data hash and hometown string
# Returns occupation of contestant from that hometown
def get_occupation(data, hometown)
  data.each do |_, bio_hash|
      bio_hash.each do |bio_key| # Why does this one not work with two parameters?
          if bio_key["hometown"] == hometown
              return bio_key["occupation"]
          end
      end
  end
end

# Return average of all contestants for that season
def get_average_age_for_season(data, season)
  number_of_contestants = 0
  total_number = 1
  data[season].each do |bio_key, _|
      total_number = total_number + bio_key["age"].to_f
      number_of_contestants += 1
  end
  return (total_number / number_of_contestants).round
end
