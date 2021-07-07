require "pry"

def get_first_name_of_season_winner(data, season)
  data.each do |season_hash, contestants_list|
    if season_hash == season
      contestants_list.each do |contestant_hash|
        contestant_hash.each do |field, value|
          if value == "Winner"
            return contestant_hash["name"].split[0]
          end
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_hash, contestants_list|
    contestants_list.each do |contestant_hash|
      contestant_hash.each do |field, value|
        if value == occupation
          return contestant_hash["name"]
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_hash = {}
  data.each do |season_hash, contestants_list|
    contestants_list.each do |contestant_hash|
      if hometown_hash.has_key?(contestant_hash["hometown"])
        hometown_hash[contestant_hash["hometown"]] += 1
      else
        hometown_hash[contestant_hash["hometown"]] = 1
      end
    end
  end
  hometown_hash[hometown]
end

def get_occupation(data, hometown)
  data.each do |season_hash, contestants_list|
    contestants_list.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_list = []
  data.each do |season_hash, contestants_list|
    if season_hash == season
      contestants_list.each do |contestant_hash|
        age_list << contestant_hash["age"]
      end
    end
  end
  ((age_list.inject(0) {|sum, x| sum + x.to_i}).to_f / age_list.length).round
end
