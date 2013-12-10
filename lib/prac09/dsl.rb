#! usr/bin/ruby

class Mydsl < Matriz #clase mydsl

	def initialize (operacion, &block)
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
		case @operacion
		when "suma" #operacion suma de matrices
			resultado = operando[0] + operando[1]
			
			resultado.to_s
		when "resta" #operacion resta de matrices
			puts "Error se han introducido mas de dos operandos" unless operando.size <= 2
			resultado = operando[0]-operando[1]
			
			resultado.to_s
		when "producto" #operacion producto de matrices
			resultado = operando[0] * operando[1]
			
			resultado.to_s
		when "ayuda" #mostrar ayuda para ver comandos
			puts "-> Ayuda del sistema:"
			puts "Puede usar los siguientes operadores:"
			puts "suma\tresta\tproducto"

		else
			puts "Error: #{@operacion} comando desconocido, inserte ayuda para mas informacion"
		end
	end
	
	 def operando(n, m, vector)
		 op = Matriz.constructor(n, m, vector)
		 @operando << op
	 end
	
end
