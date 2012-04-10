require './chapter18.rb'

code_time = Chapter18.new.code_timer {puts "Hello World!" 
                                      sleep 2 
                                      puts "Goodbye!"}
puts "My code took " + "#{code_time}" + " seconds to execute."
