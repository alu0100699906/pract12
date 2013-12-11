require 'lib/pract09.rb'

def main
	fin = false
	codigo = ""
	
	while !fin
		print "Consola>"
		codigo = gets.chomp
		
		if codigo == 'exit' || codigo == 'salir'
			fin = true
		else
			t = Mydsl.new(codigo){gets.chomp} #leemos las ordenes
			if t.salida == "console"
				puts t.run
			end
			fin = false
		end
	end
end
##ejecución
main
