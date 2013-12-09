==============================================================
Prac11
==============================================================
##Estado actual de TRAVIS [![Build Status](https://travis-ci.org/alu0100702293/pract11.png?branch=master)](https://travis-ci.org/alu0100702293/pract11)
La Pract11 consta de Documentar la gema creada en la pract09 utilizando RDOC.
Así mismo, desarrollar métodos con la filosofía de la programación funcional.

Para esto usamos el comando rdoc en el directorio de trabajo, se genera automaticamente un directorio doc/ con toda la documentacion en formato .html. 
Por otra parte, se deben utilizar métodos como 'map/collect', 'inject/reduce', 'upto' o 'times' para implementar la suma y el producto de matrices. En este caso, hemos usado métodos times.


Prac09

La Gema Prac09 consta de clases que nos permiten crear, gestionar y trabajar, de manera distinta, con matrices densas y matrices dispersas. 

Como dato, cabe añadir que una matriz se considerará dispersa si tiene más de un 60% de ceros.

##Creación Gema

Nombre de gema "pkg/matrices-0.0.1.gem"
Creamos la Gema con el comando "gem build pkg/matrices-0.0.1.gem"
Subimos la gema a la plataforma RubyGems.org (https://rubygems.org/gems/prac09) con el comando "gem push pkg/matrices-0.0.1.gem"
Tras esto, instalamos la gema: "gem install prac09"

## Uso

Si quieres usar esta gema en tu aplicación Ruby, incluye el fichero "pract09"

## Contribución

1. Haz un fork
2. Crea tu rama de características (`git checkout -b my-new-feature`)
3. Haz un commit de tus cambios (`git commit -am 'Add some feature'`)
4. Empuja los cambios a la rama(`git push origin my-new-feature`)
5. Crea un nuevo Pull Request.

## Documentación
####(Para acceder a la documentacion completa, descárguese el repositorio y abra /doc/index.html en su navegador)
### Herencia de clases

                clase Matriz            //clase base
            .________|______.   
            ↓               ↓   
    clase Mdispersa     clase Mdensa    //clases derivadas
        
La clase Matriz contendrá la implementacion de unos métodos generales para las operaciones +, -, *, to_s, == (método que pasa a una cadena de caracteres). Las clases derivadas implementarán para cada una los métodos de comparación y de acceso ([]=, []) ya que éstos tienen funcionamientos distintos debido a cómo almacena la información cada una de las clases.



                    
