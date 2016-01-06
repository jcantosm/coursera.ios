//
//  PizzaConfirmacionViewController.swift
//  pizzas
//
//  Created by Javier Cantos on 06/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import UIKit


class PizzaConfirmacionViewController: UIViewController {

    // índice del tamaño de pizza seleccionado
    var tamanyo = 0
    
    // índice del tipo de masa seleccionado
    var masa = 0
    
    // índice del tipo de queso seleccionado
    var queso = 0
    
    // 
    var pizza = Array<String>()
    
    @IBOutlet weak var uiLabelTamanyo: UILabel!
    @IBOutlet weak var uiLabelTipoMasa: UILabel!
    @IBOutlet weak var uiLabelTipoQueso: UILabel!
    @IBOutlet weak var uiLabelIngredientes: UILabel!
    @IBOutlet weak var uiButtonPedido: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.uiLabelTamanyo.text = tamanyos[self.tamanyo]
        self.uiLabelTipoMasa.text = masas[self.masa]
        self.uiLabelTipoQueso.text = quesos[self.queso]
        
        // recorremos lista de ingredientes
        var items = ""
        for item in self.pizza.sort() {
            items = items + item + "\n"
        }
        self.uiLabelIngredientes.text = items
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pedidoPizza() {
        
        let confirmar = UIAlertController(title: "Pizzas", message: "¿ Desea realizar el pedido de su pizza ?", preferredStyle: UIAlertControllerStyle.Alert)
        
        confirmar.addAction(UIAlertAction(title: "Aceptar", style: .Default, handler: { (action: UIAlertAction!) in
            self.alerta("Pedido Pizza Realizado")
            self.uiButtonPedido.hidden = true
        }))
        
        confirmar.addAction(UIAlertAction(title: "Cancelar", style: .Default, handler: { (action: UIAlertAction!) in
            print("Pedido Cancelado ...")
        }))
        
        if (self.pizza.count < 5) {
            // mostramos mensaje alerta ingredientes
            alerta("Debe seleccionar al menos 5 ingredientes para su pizza.")
        } else {
            // mostramos alerta de confirmacion
            presentViewController(confirmar, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "pizzaIngredientesSegue") {
            let vc = segue.destinationViewController as! PizzaIngredientesViewController
            vc.masa = self.masa
            vc.queso = self.queso
            vc.tamanyo = self.tamanyo
            vc.pizza = self.pizza
        }
    }

    func alerta(mensaje : String) {
        let confirmar = UIAlertController(title: "Pizzas", message: mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        
        confirmar.addAction(UIAlertAction(title: "Aceptar", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        
        presentViewController(confirmar, animated: true, completion: nil)
    }
}
