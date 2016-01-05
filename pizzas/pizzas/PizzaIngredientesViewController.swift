//
//  PizzaIngredientesViewController.swift
//  pizzas
//
//  Created by Javier Cantos on 05/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import UIKit

class PizzaIngredientesViewController: UIViewController {

    // lista de ingredientes de pizza
    let ingredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    // índice del tamaño de pizza seleccionado
    var tamanyo = 0
    
    // índice del tipo de masa seleccionado
    var masa = 0
    
    // índice del tipo de queso seleccionado
    var queso = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // recorremos lista de ingredientes
        var idx = 0
        for item in self.ingredientes.sort() {
            addSelector(item, offset: ++idx * 35)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func switchValueDidChange(sender:UISwitch!) {
        print("\(sender.restorationIdentifier) = '\(sender.on)'")
    }
    
    func addSelector(item : String, offset : Int) {
        self.view.addSubview(addLabel(item,  offset: offset))
        self.view.addSubview(addSwitch(item, offset: offset))
    }
    
    func addLabel(text : String, offset : Int) -> UILabel {
        let label = UILabel(frame: CGRectMake(40, CGFloat(40 + offset), 200, 21))
        label.text = text
        label.textAlignment = NSTextAlignment.Left
        return label
    }
    
    func addSwitch(text : String, offset : Int) -> UISwitch {
        let view = UISwitch(frame:CGRectMake(180, CGFloat(40 + offset), 0, 0))
        view.restorationIdentifier = text
        view.on = false
        view.setOn(false, animated: false)
        view.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        return view
    }

}
