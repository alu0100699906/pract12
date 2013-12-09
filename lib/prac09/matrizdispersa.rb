
class MatrizDispersa < Matriz

	def initialize(filas, columnas, velementos) #constructor
    		super(filas, columnas)
                @vvalores= Array.new 
                @vfil= Array.new
                @vcol = Array.new

                longitud=(@filas*@columnas)
		i=0
		while(i<longitud)

      			if(velementos[i]!=0) #almacenamos solo elementos distintos de cero

        		@vvalores<< (velementos[i])
        		@vfil << (i/@columnas) #y sus respectivas posiciones
       			@vcol<< (i%@columnas)
			end
			i=i+1
		end
	end

	def [](f,c) #devuelve el elemento ij getter
		no_nulo = @vvalores.size
		i=0
		while(i < no_nulo)

      			if (@vfil[i] == f && @vcol[i] == c)
        			return @vvalores[i] 
       		        end
			i=i+1
     		end
     		return 0 #si la posicion no ha sido almacenada
     		         #es que es un elemento nulo
  	end
  	
	def []= (i,j,nvalor) #almacena el elemento ij setter
		ind = 0
		while ind<@vvalores.size
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor != 0) #para poner un nuevo valor no nulo
				@vvalor[ind]=nvalor								   #si tenemos un elemento almacenado previamente en esa posicion
				return
			end
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor == 0) 	#para poner un nuevo valor nulo en una posicion ocupada anteriormente con un no nulo
				@vvalores.delete_at(ind)								#simplemente eliminamos el valor que habia antes pues los nulos no se almacenan
				@vfil.delete_at(ind)
				@vcol.delete_at(ind)
				return
			end
			ind += 1
		end #si la posicion no existia la anyadimos con el correspondiente valor
		@vvalores << (nvalor)
		@vfil << (i)
		@vcol << (j)
		
	end	


end
