require 'prac09.rb'
require 'test/unit'

class Test_Matrices < Test::Unit::TestCase
	def setup
    		@ma = Matriz.constructor(2,2,[1,1,2,2])
		@mz = Matriz.constructor(2,2,[1,1,2,2])
		@md = Matriz.constructor(2,2,[2,2,4,4])
		@mc = Matriz.constructor(3,3,[8,8,4,5,4,7,1,2,9]) 

		@mb = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mg = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mo = Matriz.constructor(3,3,[0,0,0,0,0,2,0,0,0])
		@mp = Matriz.constructor(3,3,[1,2,3,0,0,0,0,0,4])
		@mq = Matriz.constructor(3,3,[2,4,0,0,0,0,2,0,0])
		@mr = Matriz.constructor(3,3,[3,6,3,0,0,0,2,0,4])

		@fa = Fraccion.new(1,2)
		@fb = Fraccion.new(3,4)
		@fc = Fraccion.new(5,6)
		@fd = Fraccion.new(7,8)
		@ra = Fraccion.new(11,8)
		@ro = Fraccion.new(19,12)
		@rb = Fraccion.new(33,32)
		@rc = Fraccion.new(55,48)
		@rd = Fraccion.new(89,64)

		@a = Matriz.constructor(2,2, [@fa,@fb,@fc,@fd])
		@b = Matriz.constructor(2,2,[@fd, @fc, @fb, @fa])
		@c = Matriz.constructor(2,2,[@ra,@ro,@ro,@ra])
		
		@pro1 = Matriz.constructor(3,3,[1,1,1,2,2,2,3,3,3])
                @pro2 = Matriz.constructor(3,3,[1,2,3,1,2,3,1,2,3])
                @pro3 = Matriz.constructor(3,3,[3,6,9,6,12,18,9,18,27])
  	end

  	def tear_down
    		#nothing
  	end
  
  #pruebas para el metodo suma
 	def test_suma
    		assert_equal(@mr,(@mq+@mp)) #dispersas
    		assert_equal(@c,(@a+@b))    #fraccionales
		assert_equal(@md,(@ma+@mz)) #densa
  	end
  
  #pruebas para el metodo resta
  	def test_resta
    		assert_equal(@ma, (@md-@mz)) #densa
    		assert_equal(@a, (@c-@b))    #fraccionales
		assert_equal(@mp, (@mr-@mq))  #dispersa
  	end

  #pruebas para el metodo producto
  	def test_producto
    		assert_equal(@pro3, (@pro1*@pro2))
	        assert_equal((@ma * @a).to_s,('[[4/3,13/8],[8/3,13/4]]')) 
  	end

  #pruebas para los fallos
  	def test_failure
    		assert_equal(@c,(@a+@b))
  	end
    
	def test_maximo_minimo
		assert_equal(@mq.max,4)
	end
end
