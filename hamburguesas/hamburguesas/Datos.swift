//
//  Datos.swift
//  hamburguesas
//
//  Created by Javier Cantos on 15/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import Foundation

class ColeccionDePaises {
    
    let paises = ["Albania", "Andorra", "Bélgica", "Bulgaria", "Dinamarca",
        "Finlandia", "Hungría", "Italia", "Lituania", "Macedonia",
        "Mónaco", "Montenegro", "España", "Francia", "Alemania",
        "Estados Unidos", "Argentina", "Brasil", "India", "Japón"]
    
    func obtenPais() -> String {
        let idx = Int(arc4random()) % paises.count
        return paises[idx]
    }
    
}

class ColeccionDeHamburguesa {
    
    let hamburguesas = ["Grand McExtreme Dani García",
        "GRAND MCEXTREME DE MCDONALD'S ORIGINAL",
        "GRAND McEXTREME DE McDONALD'S BACON", "BIG MAC",
        "CUARTO DE LIBRA SIN QUESO",
        "CUARTO DE LIBRA CON QUESO",
        "MCROYAL DELUXE",
        "BIG DOUBLE CHEESE",
        "HAMBURGUESA", "HAMBURGUESA CON QUESO",
        "WHOPPER", "WHOPPER JR", "DOBLE WHOPPER", "BIG KING", "STEAKHOUSE",
        "DOBLE CHEESE BACON XXL", "DOBLE CHEESBURGUER",
        "TRIPLE WHOPPER", "BIG KING XXL", "STEAKHOUSE CÉSAR"]
    
    func obtenHamburguesa() -> String {
        let idx = Int(arc4random()) % hamburguesas.count
        return hamburguesas[idx]
    }
    
}