
 
class MatrizDensa < Matriz
  
	def initialize(filas, columnas, velementos) #constructor
   		 super(filas, columnas)
    		 @matriz=Array.new(velementos)
  	end
  
  	def pos(i,j) # calcula la posicion ij en el vector
    		 (i*@columnas)+j
 	end
  
  	def [](i,j) # devuelve elemento ij getter
    		 @matriz[pos(i,j)]
  	end
  
  	def []=(i,j,valor) # almacena el elemento ij setter
    		 @matriz[pos(i,j)] = valor
  	end

end
