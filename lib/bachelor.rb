#require 'pry'

def get_first_name_of_season_winner(data, season)
  name_of_winner = ''
  season_data = data[season]
  season_data.each do |season_hash|
    season_hash.each do |key, value|
    if key == "name"
      name_of_winner = value.split
    end
    if value == "Winner"
      return name_of_winner[0]
    end
  end
  end
end

def get_contestant_name(data, occupation)
  name_with_occupation = ''
  data.each do |season,season_data|
  season_data.each do |season_array|
    season_array.each do |key, value|
    if key == "name"
      name_with_occupation = value
    end
    if value == occupation
      return name_with_occupation
    end
  end
  end
end
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do |season,season_data|
  season_data.each do |season_array|
    season_array.each do |key, value|
    if value == hometown
      hometown_count += 1
    end
  end
  end
end
return hometown_count
end

def get_occupation(data, hometown)
  hometown_occupation = ''
  data.each do |season,season_data|
  season_data.each do |season_array|
    season_array.each do |key, value|
      if value == hometown
        season_array.each do |key,value|
          if key == 'occupation'
            hometown_occupation = value
            return hometown_occupation
          end
        end
    end
  end
  end
end
end

def get_average_age_for_season(data, season)
  season_average_array = []
  season_hash = data[season]
  season_hash.each do |season_array|
    season_array.each do |key, value|
    if key == "age"
      season_average_array.push(value.to_i)
    end
  end
  end
  average_age = 0.0
  season_average_array.each do |age|
    average_age += age
  end
  puts "hey this is the array #{season_average_array}and age sum #{average_age} and length of array #{season_average_array.length}"
  return (average_age/season_average_array.length).round
end



thing = {
  "season 30": [
    {
      "name":      "Beth Smalls",
      "age":       "26",
      "hometown":  "Great Falls, Virginia",
      "occupation":"Nanny/Freelance Journalist",
      "status":    "Winner"
    },
    {
      "name":       "Becca Tilley",
      "age":        "27",
      "hometown":   "Shreveport, Louisiana",
      "occupation": "Chiropractic Assistant",
      "status":     "Eliminated Week 8"
    }
  ],
  "season 29": [
    {
      "name":      "Ashley Yeats",
      "age":       "24",
      "hometown":  "Denver, Colorado",
      "occupation":"Dental Assitant",
      "status":    "Winner"
    },
    {
      "name":       "Sam Grover",
      "age":        "29",
      "hometown":   "New York, New York",
      "occupation": "Entertainer",
      "status":     "Eliminated Week 6"
    }
  ]
}

get_first_name_of_season_winner(thing,:"season 30")
