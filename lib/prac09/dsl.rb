#! usr/bin/ruby

class Mydsl #clase mydsl
	attr_accessor :resultado

	def initialize (operacion, &block)
		@operacion = operacion
		@operando = []
		@salida="console"  #por defecto
		@fich="salida.txt" #fichero de salida por defecto para cambiarlo fich nuevonombre

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

			if(@salida=="fichero")
				fichero(resultado, @fich)
			else
				resultado
			end
			
		when "resta" #operacion resta de matrices
			
			resultado << "#{(@operando[0] - @operando[1]).to_s}"
			
			if(@salida=="fichero")
				fichero(resultado, @fich)
			else
				resultado
			end

		when "producto" #operacion producto de matrices
			
			resultado << "#{(@operando[0] * @operando[1]).to_s}"
			
			if(@salida=="fichero")
				fichero(resultado, @fich)
			else
				resultado
			end
			
		when "ayuda" #mostrar ayuda para ver comandos
			puts "-> Ayuda del sistema:"
			puts "Puede usar los siguientes operadores:"
			puts "suma\tresta\tproducto"
			puts "Cada uno de los operadores necesita dos operandos"
			puts "Ejemplo de uso: operando(3,3,[2,0,2,2,0,0,0,0,0])"

		else
			puts "Error: #{@operacion} comando desconocido, inserte ayuda para mas informacion"
		end

	end

	def salida(string)
		@salida = string
	end	

	def fich (string)
		@fich = string
	end
	
	def operando(n, m, vector) # añadimos un operando
			op=Matriz.constructor(n,m,vector)
			@operando << op
	end

	def fichero (matriz, fich) # salida a fichero
		File.open(fich, 'w') 

		File.open(fich, 'r+') do |f|
			while f.eof == false
				f.gets
			end
        
			i=0
			while i<matriz.size	
				f.print matriz[i]
				i += 1
			end 
		end
	end
end
