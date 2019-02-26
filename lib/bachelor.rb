require 'pry'

def get_first_name_of_season_winner(data, season)
    data[season].each do |array|
        if array["status"] == "Winner"
        return array["name"].split.first
        end
    end
end

def get_contestant_name(data, occupation)
    data.each do |season,array|
        array.each do |person|
#            binding.pry
            if person["occupation"] == occupation
            return person["name"]
            end
        end
    end
end

def count_contestants_by_hometown(data, hometown)
    counter = 0
    data.each do |season,array|
        array.each do |person|
        if person["hometown"] == hometown
            counter += 1
#            binding.pry
        end
        end
    end
    counter
end

def get_occupation(data, hometown)
    data.each do |season,array|
        array.each do |person|
            if person["hometown"] == hometown
                return person["occupation"]
            end
        end
    end
end

def get_average_age_for_season(data, season)
    ages = []
    data[season].each do |array|
        ages << array["age"].to_i
#        binding.pry
    end
    avg = ages.inject(:+)/ages.size.to_f
#    binding.pry
    return avg.round
end
