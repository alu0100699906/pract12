#! usr/bin/ruby

class Mydsl < Matriz #clase mydsl

	def intitialize (operacion, &block)
		@operacion = operacion
		@operando = []
		if block_given?  
			if block.arity == 1
				yield self
			else
				instance_eval &block 
			end
		end
	end
	
	def run	
		#switch case con los tipos de operacion
		case operacion
		when 'suma' #operacion suma de matrices
			i=0
			while i < operando.size
				operando[0] + operando[1]
			end
			
			resultado.to_s
		when 'resta' #operacion resta de matrices
			puts "Error se han introducido mas de dos operandos" unless operando.size <= 2
			resultado = operando[0]-operando[1]
			
			resultado.to_s
		when 'producto' #operacion producto de matrices
			resultado = operando[0] * operando[1]
		when 'ayuda' #mostrar ayuda para ver comandos
			puts "-> Ayuda del sistema:"
			puts "Puede usar los siguientes operandos:"
			puts "suma\tresta\tproducto"
			puts "la sintaxis es "
		else
			puts "Error: #{@operacion} comando desconocido, inserte ayuda para mas informacion"
		end
	end
	
	#~ def operando(n, m, vector)
		#~ op = Matriz.new (n, m, vector)
		#~ @operando << op
	#~ end
	
	def operando (&mat)
		op = mat
		@operando << op
	end
end
