require 'prac09.rb'

describe "pruebas con dsl" do
		
		it " suma" do
			@sum = Mydsl.new("suma") do
				operando(2,2,[1,1,2,2])
				operando(2,2,[2,2,4,4])
			end
			@sum.run.should==('[[3,3],[6,6]]')

			
			@sumdisp = Mydsl.new("suma") do
				operando(3,3,[0,0,0,0,0,1,0,0,0])
				operando(3,3,[0,0,0,0,0,1,0,0,0])
			end
			@sumdisp.run.should==('[[0,0,0],[0,0,2],[0,0,0]]')

		end
		
		

		it "resta" do
			@res = Mydsl.new("resta") do
				operando(2,2,[2,2,4,4])
				operando(2,2,[1,1,2,2])

			end
			@res.run.should==('[[1,1],[2,2]]')

			@resdisp = Mydsl.new("resta") do
				operando(3,3,[0,0,0,0,0,7,0,0,0])
				operando(3,3,[0,0,0,0,0,1,0,0,0])
			end
			@resdisp.run.should==('[[0,0,0],[0,0,6],[0,0,0]]')
		end

		it "producto" do
			@producto = Mydsl.new("producto") do
				operando(3,3,[1,1,1,2,2,2,3,3,3])
				operando(3,3,[1,2,3,1,2,3,1,2,3])
				salida "console"
			end
			@producto.run.should==('[[3,6,9],[6,12,18],[9,18,27]]')

			@productodisp = Mydsl.new("producto") do
				operando(3,3,[0,1,2,1,0,0,0,0,0])
				operando(3,3,[2,0,2,2,0,0,0,0,0])
				salida "fichero"
			end
			@productodisp.run
		end


	end
