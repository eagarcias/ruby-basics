require_relative "../interface/employee"

class TicketSeller < Employee

    def initialize
        @role_name = "Ticket seller"
        @salary = 1000
    end
    
    def work
        puts "Selling tickets....."
    end
end
