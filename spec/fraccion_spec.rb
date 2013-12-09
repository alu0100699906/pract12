require "prac09/fraccion.rb"
  
describe Fraccion do #espectativa para la clase
        ##
        describe "#se asignan bien los valores de denominador y numerador"do
                it "Creacion correcta de fraccion con numerador y denom." do
                        fa = Fraccion.new(1,2)
                        fa.numerador.should == 1
                        fa.denominador.should == 2
                end
        end
        ##
        describe "#la fraccion esta en su minima expresion" do
                it "Fraccion simplificada" do
                        fa = Fraccion.new(6,4)
                        fa.numerador.should == 3
                        fa.denominador.should == 2
                end
        end
        ##
        describe "#el valor del numerador y denominador se obtiene mediante num() y denom()" do
                it ".num() existe" do
                        fa = Fraccion.new(1,2)
                        fa.num() == 1
                end
                it ".denom() existe" do
                        fa = Fraccion.new(1,2)
                        fa.denom() == 2
                end
        end
        ##
        describe " #Se debe mostrar num/denom" do
                it " .to_s()" do
                        fa = Fraccion.new(1,2)
                        fa.to_s().should == "1/2"
                end
        end
        ##
        describe " #Se debe mostrar en formato flotante" do
                it " .to_float()" do
                        fa = Fraccion.new(1,2)
                        fa.to_float().should == 0.5
                end
        end
        ##
        describe " #comparacion con == "do
                it "\n comparando"do
                        fa = Fraccion.new(6,4)
                        fb = Fraccion.new(3,2)
                        fc = Fraccion.new(1,5)
                        
                        (fa == fb).should be_true
                        (fa == fc).should be_false
                        (fb == fc).should be_false
                end
        end
        ##
        describe " #valor absoluto con metodo abs"do
                it ".abs"do
                        fa = Fraccion.new(-6,4)
                        fb = Fraccion.new(1,-5)
                        fc = Fraccion.new(1,5)
                
                        fa.abs.num.should == 3
                        fa.abs.denom.should == 2
                        fb.abs.should == fc
                end
        end
        
        ##
        describe " #Operaciones con fracciones"do
                it ".recriprocal calcula inversa" do
                        fa = Fraccion.new(3,2)
                        fb = Fraccion.new(2,3)
                
                        (fa.reciprocal == fb).should be_true
                end
                it "-@ opuesto" do
                        fa = Fraccion.new(2,4)
                        fb = Fraccion.new(-1,2)
                        fc = Fraccion.new(1,-4)

                        ((-fa) == fa).should be_true
                        (-fb).to_s.should eq("1/2")
                 (-fc).should eq(Fraccion.new(1,4))
                end
                it "@+@ operacion suma" do
                        fa = Fraccion.new(3,2)
                        fb = Fraccion.new(1,4)
                        fc = Fraccion.new(7,4)
                        
                        (fa + fb).should == fc
                        (fb + fc).should eq(Fraccion.new(2,1))
                end
                it "@-@ operacion resta" do
                        fa = Fraccion.new(2,3)
                        fb = Fraccion.new(1,4)
                        fc = Fraccion.new(5,12)
                        
                        (fa - fb).should == fc
                        (fb - fc).should eq(Fraccion.new(-1,6))
                end
                it "@*@ operacion producto" do
                        fa = Fraccion.new(2,3)
                        fb = Fraccion.new(1,4)
                        fc = Fraccion.new(5,2)
                        
                        (fa * fb).should eq(Fraccion.new(1,6))
                        (fa * fc).should eq(Fraccion.new(5,3))
                        (fb * fc).should eq(Fraccion.new(5,8))
                end
                it "@/@ operacion division" do
                        fa = Fraccion.new(2,3)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(4,15)
                        
                        (fa / fb == fc).should be_true
                        (fa / fc == fb).should be_true
                end
                it "@%@ operacion modulo" do
                        fa = Fraccion.new(2,3)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(4,15)
                        
                        (fa % fb).to_s.should =="2/3"
                        (fa % fc).to_s.should =="2/15"
                end
                it "@<@ operacion menor que" do
                        fa = Fraccion.new(1,4)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(3,4)
                        
                        (fa < fb).should be_true
                        (fa < fc).should be_true
                        (fc < fb).should be_true
                end
                it "@>@ operacion mayor que" do
                        fa = Fraccion.new(1,4)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(3,4)
                        
                        (fb > fa).should be_true
                        (fc > fa).should be_true
                        (fb > fc).should be_true
                end
                it "@<=@ operacion menor o igual que" do
                        fa = Fraccion.new(1,4)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(1,4)
                        
                        (fa <= fb).should be_true
                        (fa <= fc).should be_true
                        (fc <= fb).should be_true
                end
                it "@>=@ operacion mayor o igual que" do
                        fa = Fraccion.new(1,4)
                        fb = Fraccion.new(5,2)
                        fc = Fraccion.new(1,4)
                        
                        (fb >= fa).should be_true
                        (fc >= fa).should be_true
                        (fb >= fc).should be_true
                end
        end
   
    
end


