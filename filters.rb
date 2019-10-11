# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |c|
    if c[:id] == id
      return c
    else 
      nil
    end
  end
end

def experienced? (candidate)
  if candidate[:years_of_experience] >= 2
    true
  else
    false
  end
end

def qualified_candidates(candidates)
  candidates.select do |c|
    c[:years_of_experience] > 0
    c[:github_points] > 100
    c[:languages].include?("Python") || c[:languages].include?("Ruby")
    c[:age] > 17
    c[:date_applied] > 15.days.ago.to_date
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by {|candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
