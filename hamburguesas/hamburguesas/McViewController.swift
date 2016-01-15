//
//  ViewController.swift
//  hamburguesas
//
//  Created by Javier Cantos on 15/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import UIKit

class McViewController: UIViewController {

    let paises = ColeccionDePaises()
    let hamburguesas = ColeccionDeHamburguesa()
    
    @IBOutlet weak var uiLabelPais : UILabel!
    @IBOutlet weak var uiLabelHamburguesa : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mostrarHamburguesa() {
        self.uiLabelPais.text = self.paises.obtenPais()
        self.uiLabelHamburguesa.text = self.hamburguesas.obtenHamburguesa()
    }
    
}

