//
//  PizzaTipoMasaViewController.swift
//  pizzas
//
//  Created by Javier Cantos on 05/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import UIKit

// lista de tipos de masas de pizza
let masas = ["Delgada", "Crujiente", "Gruesa"]

class PizzaTipoMasaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    // índice del tamaño de pizza seleccionado
    var tamanyo = 0
    
    // índice del tipo de masa seleccionado
    var masa = 0
    
    // índice del tipo de queso seleccionado
    var queso = 0

    // lista de ingredientes seleccionados de la pizza
    var pizza = Array<String>()
    
    // índice del tipo de masa seleccionado
    @IBOutlet weak var uiPickerTipoMasa: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.uiPickerTipoMasa.selectRow(self.masa, inComponent: 0, animated: true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return masas.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return masas[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.masa = row
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "pizzaTamanyoSegue") {
            let vc = segue.destinationViewController as! PizzaTamanyoViewController
            vc.masa = self.masa
            vc.queso = self.queso
            vc.tamanyo = self.tamanyo
            vc.pizza = self.pizza
        }
        if (segue.identifier == "pizzaTipoQuesoSegue") {
            let vc = segue.destinationViewController as! PizzaTipoQuesoViewController
            vc.masa = self.masa
            vc.queso = self.queso
            vc.tamanyo = self.tamanyo
            vc.pizza = self.pizza
        }
    }

}
