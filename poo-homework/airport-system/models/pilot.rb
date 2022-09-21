require_relative "../interface/employee"

class Pilot < Employee

    def initialize
        @role_name = "Pilot"
        @salary = 20000
    end
    
    def work
        puts "Flying the plane..."
    end
end

# pilot = Pilot.new
# puts pilot.role_name
# puts "gano #{pilot.salary}"
# pilot.work
