
class Matriz

	def initialize(filas, columnas)
    		@filas, @columnas = filas , columnas
  	end

	#get filas
	def filas()
		@filas
	end
	
	#get columnas
	def columnas()
		@columnas
	end

        #metodo factoria que dependiendo del porcentaje de ceros llama al constructo de matriz dispersa o densa
  	def Matriz.constructor(filas, columnas, velementos)

      		longitud=filas*columnas
     		 if (((velementos.count(0)*100)/(longitud)) >= 60)
			#si el numero de ceros es mayor de un 60 por ciento se crea una densa
        		MatrizDispersa.new(filas,columnas,velementos)
      		else 

        		MatrizDensa.new(filas,columnas,velementos)
      		end
  	end

	#metodo suma
	#recorre las posiciones de las dos matrices convertidas en arrays y suma cada elemento
	def +(object)
    		
		if ( (@filas == object.filas) && (@columnas == object.columnas))
      
			matrizresultado=Array.new
			
        		@filas.times do |i|
				@columnas.times do |j|
          		
					matrizresultado << (self[i,j] + object[i,j])
            				
        			end
         			
      			end
      			Matriz.constructor(@filas, @columnas, matrizresultado)
    		end
  	end
  
	#metodo resta
	#recorre las posiciones de las dos matrices convertidas en arrays y resta cada elemento
	def -(object)
    		
		if ( (@filas == object.filas) && (@columnas == object.columnas))
      
			matrizresultado=Array.new
			@filas.times do |i|
				@columnas.times do |j|
          		
					matrizresultado << (self[i,j] - object[i,j])
            				
        			end
         			
      			end
      			Matriz.constructor(@filas, @columnas, matrizresultado)
    		end
  	end

 
	#metodo igual igual
	#recorre las posiciones de las dos matrices y todos los elementos coinciden devuelve true 
	#desde que uno no sea igual devuelve false
	def ==(object)
		if ((@filas == object.filas) && (@columnas == object.columnas))
			i = 0
			while (i < @filas) do

				j = 0
				while (j < @columnas) do

					if (self[i,j] == object[i,j]) #comparamos elemento a elemento
						es_igual = true
					else 
						return es_igual = false #si solo uno es distinto la funcion devuelve falso
					end
					j = j + 1
				end
				i = i + 1
			end
		end
		return es_igual #si compara todos los elementos y son iguales devuelve verdadero
	end 

	#metodo producto
	#si el objecto pertenece a la clase numeric se multiplica la posicion correcta de la matriz con el objecto pasado
	#si pertenece a la clase matriz multiplica los elementos de las posiciones concordantes
	def *(object)

		if(object.is_a? Numeric)
      			matrizresultado=Array.new
      			@filas.times do |i|
				@columnas.times do |j|
					matrizresultado << (self[i,j]*object)
					
        			end
				
			end
			return Matriz.constructor(@filas,@columnas,matrizresultado)
     	        

		elsif ((object.is_a?(Matriz)==true) && (@columnas==object.filas()))
			
                        matrizresultado = Array.new
                        @filas.times do |i|
                                object.columnas.times do |j|
                            
                                        
                                        matrizresultado<<0
                                        @columnas.times do |k| #itera en las columnas de la primera matriz y las filas de la segunda
                                                matrizresultado[(matrizresultado.size)-1]= (matrizresultado.last + (self[i,k] * object[k,j]))
                                                k = k + 1
                                        end
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        return Matriz.constructor(@filas,object.columnas,matrizresultado)
                end
        end
 
	#metodo max
	#devuelve el mayor elemento de una matriz
	def max()
		maximo = 0 # maximo provisional
		i, j = 0,0
		while i<=@filas
			while j<=@columnas
				if (self[i,j]>maximo) #si el valor es mayor que el provisional almacena el nuevo
					maximo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return maximo
	end
	
	#metodo min
	#devuelve el menor elemento de una matriz
	def min()
		minimo = 0 # maximo provisional
		i, j = 0,0
		while i<=@filas
			while j<=@columnas
				if (self[i,j]<minimo) #si el valor es mayor que el provisional almacena el nuevo
					minimo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return minimo
	end
	
	#metodo to s
	#nos imprime la matriz en forma de string
	def to_s
		string= "[" ##corchete de matriz
		
		fil=0
		while (fil<@filas)
			string = string + "[" #corchete de fila
			col=0
			while (col<@columnas)
				string = string + "#{self[fil,col]}"
				col += 1
				if(col < @columnas)
					string = string + ","
				end
			end
			string = string + "]" #cerramos el corchete de fila
			fil += 1
			if (fil < @filas)
				string = string + ","
			end
		end
		string = string +"]" ##cerramos el corchete de matriz
	end
                     
  	#metodo de conversion implicita
  	def coerce(object)
    		[self,object]
  	end
  
end
