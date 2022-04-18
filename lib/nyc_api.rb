require 'net/http'
require 'open-uri'
require 'json'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"  #assign the API URL to a constant variable

  def get_programs  #GET
    uri = URI.parse(URL)  #parse URL in the URI class
    response = Net::HTTP.get_response(uri) #sends a request utilizing the NET::HTTP libary
    response.body #call the .body method on the variable, returns it as a string
  end

  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

# programs = GetPrograms.new.get_programs #assign the above class to a variable, also create a new instance of the class, and call .get_programs method
# puts programs #puts everything above to the console.
programs = GetPrograms.new
puts programs.program_school.uniq #puts the return of the GET; json data (get_programs), then parse the json data (program_school), then puts only unique values/no duplicates
