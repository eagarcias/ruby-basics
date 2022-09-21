class Passenger

    attr_accessor :name
    attr_accessor :last_name
    attr_accessor :age
    attr_accessor :ticket
    attr_accessor :type

    def travel
        if ticket.nil?
            puts "You have no ticket, please buy one"
        else    
            puts "#{@name} is going to travel on the flight number #{@ticket.flight.number}"
        end
    end

    def buy_ticket (ticket)
        puts "#{@name} bought a ticket"
        @ticket = ticket
    end   

end    
    