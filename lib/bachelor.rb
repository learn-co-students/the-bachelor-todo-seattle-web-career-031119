require "pry"

def get_first_name_of_season_winner(data, season)
  winner = "name"
  data[season].each {|element|
    if element.has_value?("Winner")
      winner = element["name"]
    end
  }
  winner.split(" ")[0]
end

def get_contestant_name(data, occupation)
  job = "name"
  data.each {|season, contestants|
    contestants.each {|woman|
      if woman["occupation"] == occupation
        job = woman["name"]
      end
    }
  }
  job
end

def count_contestants_by_hometown(data, hometown)
  counter = 0 
  data.each {|season, contestants|
    contestants.each {|woman|
      if woman["hometown"] == hometown
        counter += 1 
      end
    }
  }
  counter
end

def get_occupation(data, hometown)
  job = "job"
  data.each {|season, contestants|
    contestants.each {|woman|
      if woman["hometown"] == hometown
        job = woman["occupation"]
        break
      end
    }
  }
  job
end

def get_average_age_for_season(data, season)
  ages = []
  data[season].each {|woman|
    ages << woman["age"].to_f
  }
  total = 0
  contestants = ages.length
  ages.each {|age|
    total = total + age
  }
  average = (total / ages.length).round
end

