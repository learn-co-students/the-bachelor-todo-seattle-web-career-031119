def get_first_name_of_season_winner(data, season)
  data.each do |seasonKey, women|
    if season == seasonKey
      women.each do |woman|
        if woman["status"] == "Winner"
          return woman["name"].split(" ").first
        end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, women|
    women.each do |woman|
      if woman["occupation"] == occupation
        return woman["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, women|
    women.each do |woman|
      if woman["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  # code here
  data.each do |season, women|
    women.each do |woman|
      if woman["hometown"] == hometown
        return woman["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  data.each do |seasonKey, women|
    if seasonKey == season
      total = women.reduce(0) {|sum, woman| sum += woman["age"].to_f}
      return (total/women.length).round
    end
  end
end
