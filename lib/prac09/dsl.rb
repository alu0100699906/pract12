#! usr/bin/ruby

class Mydsl #clase mydsl
	attr_accessor :resultado

	def initialize (operacion, &block)
		@operacion = operacion
		@operando = []
		@salida=""

		if block_given?  
			if block.arity == 1
				yield self
			else
				instance_eval &block 
			end
		end
	end
	

	def run	
               	resultado=""
		#switch case con los tipos de operacion
		case @operacion
		when "suma" #operacion suma de matrices

			resultado << "#{(@operando[0] + @operando[1]).to_s}"

		when "resta" #operacion resta de matrices
			
			resultado << "#{(@operando[0] - @operando[1]).to_s}"
			

		when "producto" #operacion producto de matrices
			
			if(@salida=="console")
			resultado << "#{(@operando[0] * @operando[1]).to_s}"
			
			elsif(@salida=="fichero")
				fichero(resultado, fich="salida.txt")
			end
		when "ayuda" #mostrar ayuda para ver comandos
			puts "-> Ayuda del sistema:"
			puts "Puede usar los siguientes operadores:"
			puts "suma\tresta\tproducto"

		else
			puts "Error: #{@operacion} comando desconocido, inserte ayuda para mas informacion"
		end

	end

	def salida(string)
		@salida = string
	end	

	def operando(n, m, vector)
			op=Matriz.constructor(n,m,vector)
			@operando << op
	end

	def fichero (matriz, fich)
		File.open(fich, 'w')##almacenamos cualquier contenido anterior antes de reescribir el fichero

		File.open(fich, 'r+') do |f|
        		while f.eof == false
            			f.gets
        		end
			f.print "["
        		fil=0
        		while (fil<matriz.filas)
            			f.print = "[" #corchete de fila
            			col=0
            			while (col<@columnas)
                			f.pint = "#{matriz[fil][col]}"
                			col += 1
                			if(col < @columnas)
						f.print = ","
                			end
            			end
            			f.print= "]" #cerramos el corchete de fila
            			fil += 1
            			if (fil < matriz.filas)
                			f.print = ","
            			end
        		end
			f.print = "]" ##cerramos el corchete de matriz
		end 
	end
end
