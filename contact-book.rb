require 'csv'
option = ""
# @contacts = []  
@contacts = [{
    :first_name => 'Erick',
    :last_name => 'Garcia',
    :email => 'egarcia@lomax.com.gt',
    :phone => '22222222'
}, {
    :first_name => 'Alejandro',
    :last_name => 'Sarazua',
    :email => 'asarazua@lomax.com.gt',
    :phone => '24242424'
}]

def create_new_contact
    puts "------------------------------------"
    puts "       Crear nuevo contacto"
    puts "------------------------------------\n"
    puts "Ingresar nombre:"
    first_name = insert_record
    puts "Ingresar apellido"
    last_name = insert_record
    puts "Ingresar correo electrónico:"
    email = insert_record
    puts "Ingresar teléfono:"
    phone = insert_record
    @contacts.push({
        :first_name => first_name,
        :last_name => last_name,
        :email => email,
        :phone => phone
    })
    puts "Contacto ingresado correctamente!"
end

def insert_record
    loop do
        input = gets.chomp
        if input.empty?
            puts "Este campo no puede ser vacio" 
        else
            return input    
        end
    end
end

def update_contact
    if @contacts.length > 0
        puts "------------------------------------"
        puts "       Editar contacto"
        puts "------------------------------------\n"
        puts "Por favor ingresa el correo electrónico del usuario que deseas editar:"

        email = gets.chomp
        index = @contacts.index {|c| c[:email].eql?(email)}

        unless index.nil?
            puts "El usuario que deseas editar es #{@contacts[index][:first_name]} #{@contacts[index][:last_name]}"
            puts "Selecciona la opcion que deseas editar del contacto:"
            puts "1. Nombre"
            puts "2. Apellido"
            puts "3. Email"
            puts "4. Teléfono"
            puts "Para cancelar presiona cualquier otra opción"

            edit_option = gets.chomp

            case edit_option
            when "1"
                puts "Ingresa el nuevo nombre:"
                @contacts[index][:first_name] = insert_record
                puts print_contact @contacts[index]
            when "2"
                puts "Ingresa el nuevo apellido:"
                @contacts[index][:last_name] = insert_record 
                puts print_contact @contacts[index]
            when "3"
                puts "Ingresa el nuevo correo electrónico:"
                @contacts[index][:email] = insert_record
                puts print_contact @contacts[index]
            when "4"
                puts "Ingresa el nuevo teléfono:"
                @contacts[index][:phone] = insert_record
                puts print_contact @contacts[index]
            else puts "PROCESO CANCELADO"
            end
        else
            puts "------------------------"
            puts " El contacto no existe"
            puts "------------------------\n"       
        end
    else
        puts "----------------------------------------------------------------------------------"
        puts " Actualmente no cuentas con ningun contacto, por favor agrega uno o más contactos."
        puts "----------------------------------------------------------------------------------\n"
    end
end

def delete_contact
    if @contacts.length > 0
        puts "------------------------------------"
        puts "       Eliminar contacto"
        puts "------------------------------------\n"
        puts "Por favor ingresa el correo electrónico del usuario que deseas eliminar:"

        email = gets.chomp
        index = @contacts.index {|c| c[:email].eql?(email)}

        unless index.nil?
            puts "El usuario que deseas eliminar es #{@contacts[index][:first_name]} #{@contacts[index][:last_name]}"
            puts "Estas seguro que deseas elimiar? y/n : "

            edit_option = gets.chomp

            case edit_option
            when "y"
                puts "Ingresa el nuevo nombre:"
                @contacts.delete_at(index)
                puts "Contacto eliminado"
            else puts "PROCESO CANCELADO"
            end
        else
            puts "------------------------"
            puts " El contacto no existe"
            puts "------------------------\n"       
        end
    else
        puts "----------------------------------------------------------------------------------"
        puts " Actualmente no cuentas con ningun contacto, por favor agrega uno o más contactos."
        puts "----------------------------------------------------------------------------------\n"
    end
end

def show_contacts
    if @contacts.length > 0
        puts "------------------------- CONTACTOS -------------------------"
        @contacts.each {|c| print_contact c}
        puts "-------------------------------------------------------------\n"
    else
        puts "----------------------------------------------------------------------------------"
        puts " Actualmente no cuentas con ningun contacto, por favor agrega uno o más contactos."
        puts "----------------------------------------------------------------------------------\n"
    end
end

def print_contact contact
    puts "#{contact[:first_name]} #{contact[:last_name]} #{contact[:email]} #{contact[:phone]}"
end

def generate_report
    puts "GENERANDO REPORTE.........."
    CSV.open("contacts.csv", "w") do |csv|
        csv << ["Nombre", "Apellido", "Correo electrónico", "Telefono"]
        @contacts.each {|c| csv << [c[:first_name], c[:last_name], c[:email], c[:phone]]}
    end
    puts "Reporte generado!"
end

while option != "6"

    puts "<------------------- MENU --------------------->"
    puts "Escribe el número de opción que deseas realizar:"
    puts "1. Crear nuevo contacto"
    puts "2. Mostrar contactos"
    puts "3. Editar contacto"
    puts "4. Eliminar contacto"
    puts "5. Generar reporte de contactos"
    puts "6. Salir"
    puts "<---------------------------------------------->"

    option = gets.chomp
    
    case option
    when "1" then create_new_contact
    when "2" then show_contacts
    when "3" then update_contact
    when "4" then delete_contact
    when "5" then generate_report        
    when "6" then break    
    else 
        puts "|----------------------- Error -------------------------------|"
        puts "| Esa opción no existe, por favor escribe una opción correcta |"
        puts "|-------------------------------------------------------------|"
    end    
end