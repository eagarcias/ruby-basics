require_relative "../interface/employee"
require_relative "../modules/copilot_skill"

class Copilot < Employee

    include CopilotSkill

    def initialize
        @role_name = "Copilot"
        @salary = 20000
    end
end

# pilot = Copilot.new
# puts pilot.role_name
# puts "gano #{pilot.salary}"
# pilot.work
