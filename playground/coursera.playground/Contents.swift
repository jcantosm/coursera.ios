//: Playground - noun: a place where people can play

/*
Programa un playground que evalúe un rango de números en base a 4 reglas de impresión.

Generar un rango de 0 a 100, incluye el número 100 en el rango.
Tienes que iterar el rango completo, utilizando la sentencia for para obtener cada número del rango y aplicar las siguientes reglas de impresión.
Al evaluar cada número debes aplicar las siguientes reglas:

- Si el número es divisible entre 5, imprime: # el número  + “Bingo!!!”
- Si el número es par, imprime: # el número + “par!!!”
- Si el número es impar, imprime: # el número + “impar!!!”
- Si el número se encuentra dentro de un rango del 30 al 40, imprime: # el número +  “Viva Swift!!!”

Debes de usar la interpolación de variables para realizar la impresión de cada número.
La salida de mensajes dejes tenerla en la consola.
El proyecto deberá estar en la cuenta de GitHub del alumno
*/
import UIKit

let rango = 0...100

for idx in rango {
    // numero divisble entre 5
    if idx % 5 == 0 {
        print("# el número \(idx) Bingo!!!")
    }
    
    // numero par
    if idx % 2 == 0 {
        print("# el número \(idx) par!!!")
    }
    
    // numero impar
    if idx % 2 != 0 {
        print("# el número \(idx) impar!!!")
    }
    
    // numero entre 30...40
    if idx >= 30 && idx <= 40 {
        print("# el número \(idx) Viva Swift!!!")
    }
}
