require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each.with_index do |block, index|
    person = data[season][index]
    if person["status"] == "Winner"
      return person["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.keys.each do |season|
    data[season].each.with_index do |block, index|
      person = data[season][index]
      if person["occupation"] == occupation
        return person["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  grew_up_there = 0
  data.keys.each do |season|
    data[season].each.with_index do |block, index|
      person = data[season][index]
      grew_up_there += 1 if person["hometown"] == hometown
    end
  end
  grew_up_there
end

def get_occupation(data, hometown)
  data.keys.each do |season|
    data[season].each.with_index do |block, index|
      person = data[season][index]
      return person["occupation"] if person["hometown"] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  season_ages = 0
  season_size = 0
  data[season].each.with_index do |block, index|
    person = data[season][index]
    season_ages += person["age"].to_f
    #print person["age"] + " "
    season_size += 1
  end
  #binding.pry
  puts "#{season}, #{season_ages}, #{season_size}, #{(season_ages / season_size).round}"
  (season_ages / season_size).round
end

#get_average_age_for_season(data, "season 10")