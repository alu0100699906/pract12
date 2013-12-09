class Fraccion 

    #el modulo comparable contiene todos los metodos que permiten hacer comparaciones
    include Comparable
    #metodo que permite acceder a los atributos de la clase
    attr_reader :numerador, :denominador

    def initialize(n,d)
        simp=gcd(n,d) #guarda el maximo comun divisor

        if d!=0
            @numerador=n
            @denominador=d
        end

     #utiliza el maximo comun divisor para simplificar la  fraccion
     @numerador, @denominador = n/simp, d/simp 
     end
    
    #metodo que devuelve el numerador
    def num()
        @numerador
    end

    #metodo que devuelve el denominador
    def denom()
        @denominador
    end
    
    #metodo para mostrar por la consola la fraccion
    def to_s
        "#{@numerador}/#{@denominador}"
    end
    
    #metodo para mostrar por la consola la fraccion en punto flotante
    def to_float
        (@numerador.to_f()/@denominador.to_f)
    end

    #metodo para calcular el valor absoluto de una fraccion
    def abs ()
	Fraccion.new(@numerador.abs,@denominador.abs)
    end
    
    ##metodo para calcular el reciproco de una fraccion
    def reciprocal ()
	Fraccion.new(@denominador,@numerador)
    end

      #metodo para calcular el opuesto de una fraccion
    def -@ ()
        if(@numerador>0 && @denominador<0)
              @numerador = @numerador.abs
              @denominador = @denominador.abs
        
        elsif(@numerador<0 && @denominador>0)
              @numerador = @numerador.abs
              @denominador = @denominador.abs
        
        else 
              @numerador = -(@numerador.abs)
              @denominador = @denominador.abs
        end
         Fraccion.new(@numerador,@denominador)
    end
    
    #metodo para calcular la suma de dos fracciones
    def +(object)
		if (object.instance_of?(Fraccion)==true)
		
			aux=mcm(@denominador,object.denominador)
			return Fraccion.new((((aux*@numerador)/@denominador)+(aux*object.numerador)/object.denominador),aux)
			
		end	
		if (object.instance_of?( Fixnum )==true)
			aux=Fraccion.new(object, 1)
			m=mcm(@denominador,aux.denominador)
			return Fraccion.new((((m*@numerador)/@denominador) + (m*aux.numerador)/aux.denominador),m)
		end
    end
 
    #metodo para calcular la resta de dos fracciones
    def -(object)
        aux=mcm(@denominador,object.denominador)
        Fraccion.new((((aux*@numerador)/@denominador)-(aux*object.numerador)/object.denominador),aux)
    end   
    
    #metodo para calcular la multiplicacion de dos fracciones
    def *(object)
        if(object.is_a?(Numeric))
		object = Fraccion.new(object,1)
	end
	Fraccion.new(@numerador*object.numerador,@denominador*object.denominador)
    end 

    #metodo para calcular la division de dos fracciones
    def /(object)
        #multiplica numerador con numerador y denominador con denominador
			Fraccion.new(@numerador*object.denominador,@denominador*object.numerador)
			
        
    end 
     
     #metodo para calcular el resto de la division de dos fracciones
     def % (object)
         #guarda la division de las fracciones
         division=self.abs/object.abs
         #calcula el resto
	 resto=object.abs * (division - Fraccion.new(division.to_float.to_i,1))
	 if (object.numerador < 0)
                #si el numerador es negativo imprime el opuesto del resto
		return -resto
	 end
         #lo imprime
	 resto  
     end
     
	
     #Utilizamos el metodo del modulo Comparable para realizar operaciones comparacionales de fracciones
     def <=> (object)
          self.to_float<=>object.to_float    
     end

     def gcd(n, d)
         n1,n2 = n.abs,d.abs
         gcd = 1
         k = 1
         while (k <= n1 and k <= n2)
              if (n1 % k == 0 and n2 % k == 0)
                  gcd = k
              end
              k += 1
         end
         return gcd
     end


     #metodo para hallar el minimo comun multiplo de los dos numeros pasados como parametros
     def mcm(a,b)
        #mediante el metodo de euclides, resolvemos el minimo comun multiplo mediante el
        #maximo comun divisor
        aux=gcd(a,b)
        (a/aux)*b
     end

  	def coerce(object)
    		[self,object]
  	end
end
