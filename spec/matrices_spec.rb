
require 'prac09.rb'

describe Matriz do

	before (:each) do
	
		@ma = Matriz.constructor(2,2,[1,1,2,2])
		@mz = Matriz.constructor(2,2,[1,1,2,2])
		@md = Matriz.constructor(2,2,[2,2,4,4])
		@dis = Matriz.constructor(2,2,[2,0,0,0])

		@mb = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mg = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mo = Matriz.constructor(3,3,[0,0,0,0,0,2,0,0,0])
		@mp = Matriz.constructor(3,3,[1,2,3,0,0,0,0,0,4])
		@mq = Matriz.constructor(3,3,[2,4,0,0,0,0,2,0,0])
			
		@fa = Fraccion.new(1,2)
		@fb = Fraccion.new(3,4)
		@fc = Fraccion.new(5,6)
		@fd = Fraccion.new(7,8)
		@ra = Fraccion.new(11,8)
		@ro = Fraccion.new(19,12)
		
		@a = Matriz.constructor(2,2, [@fa,@fb,@fc,@fd])
		@b = Matriz.constructor(2,2,[@fd, @fc, @fb, @fa])
		@c = Matriz.constructor(2,2,[@ra,@ro,@ro,@ra])
		
		@pro1 = Matriz.constructor(3,3,[1,1,1,2,2,2,3,3,3])
                @pro2 = Matriz.constructor(3,3,[1,2,3,1,2,3,1,2,3])
 
		@multip = Matriz.constructor(3,2,[2,3,0,1,0,3])
		@multip1 = Matriz.constructor(2,4,[0,1,0,0,7,0,2,0])#dispersa
		
		@l1=Matriz.constructor(2,2,[0,0,0,1])
		@l2=Matriz.constructor(2,2,[0,1,0,0])

		@l4=Matriz.constructor(3,3,[0,1,2,1,0,0,0,0,0])
		@l5=Matriz.constructor(3,3,[2,0,2,2,0,0,0,0,0])
	
	
	end

	 describe "# pruebas " do

		it "instanciacion de un racional" do
			@fa = Fraccion.new(1,2)		
			@fa.numerador.should == 1
			@fa.denominador.should == 2
		end

                it "suma de matrices con fracciones" do
			(@a + @b).should == @c
		end


        	it "#comprobacion de clases" do
			@mb.instance_of?(MatrizDispersa)
			@ma.instance_of?(MatrizDensa)
			@dis.instance_of?(MatrizDispersa)
		end

		it " igualdad densa "do
			@ma.should == @mz	
		end

		it " igualdad dispersa "do
			@mb.should == @mg
		end
	
		it " suma " do

			(@ma + @mz).should == @md #suma densas
			(@mg + @mb).should == @mo #suma dispersas
			(@mp + @mq).to_s.should == ('[[3,6,3],[0,0,0],[2,0,4]]') #suma dispersas
			(@a + @md).to_s.should == ('[[5/2,11/4],[29/6,39/8]]')#suma racional con densa	
			(@a + @dis).to_s.should ==('[[5/2,3/4],[5/6,7/8]]') #suma racional con dispersa
			(@dis+ @a).to_s.should == ('[[5/2,3/4],[5/6,7/8]]') #suma dispersa con racional
			(@ma + @dis).to_s.should == ('[[3,1],[2,2]]') #suma dispersa con densa

		end	
		
		it "resta" do
			(@md -@mz).should eq(@ma)
			(@mo - @mg).should eq(@mb)
		end

	
		 it " producto "do
			(2*@pro1).to_s.should ==('[[2,2,2],[4,4,4],[6,6,6]]')
			(@ma * @a).to_s.should == ('[[4/3,13/8],[8/3,13/4]]') 
			(@a * @l1).to_s.should == ('[[0/4,3/4],[0/24,7/8]]')
                        ( @a * @a ).to_s.should == ('[[7/8,33/32],[55/48,89/64]]') #multiplica 2 racionales
                        (@pro1 * @pro2).to_s.should == ('[[3,6,9],[6,12,18],[9,18,27]]')
			(@multip * @multip1).to_s.should ==('[[21,2,6,0],[7,0,2,0],[21,0,6,0]]') #multiplica densa con dispersa
			(@l1*@l2).to_s.should ==('[[0,0],[0,0]]') #multiplica dispersas
			(@l4*@l5).to_s.should ==('[[2,0,0],[2,0,2],[0,0,0]]') #multiplica dispersas
                end

		it " getter y setter"do
			@mz[0,0].should == 1
			@ma[0,1]= 2 
			@ma[0,1].should == 2
			
			@multip[0,0].should == 2
			@multip[1,2]= 5
			@mq[0,1].should == 4
		

			@mb[1,2].should == 1
			@mb[0,0]= 5
			@mb[0,0].should == 5
			


		end
		it " maximo y minimo"do
			@mq.max.should == 4
			@md.max.should == 4


		end
	
	end
	
end

