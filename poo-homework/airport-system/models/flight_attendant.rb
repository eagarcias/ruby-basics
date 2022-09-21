require_relative "../interface/employee"

class FlightAttendant < Employee

    def initialize
        @role_name = "Flight attendant"
        @salary = 5000
    end
    
    def work
        puts "Serving passengers..."
    end
end
