//
//  PizzaTamanyoViewController.swift
//  pizzas
//
//  Created by Javier Cantos on 05/01/16.
//  Copyright © 2016 Javier Cantos. All rights reserved.
//

import UIKit

class PizzaTamanyoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // lista de tamaños de pizzas
    let tamanyos = ["Chica", "Mediana", "Grande"]
    
    // índice del tamaño de pizza seleccionado
    var tamanyo = 0
    
    // índice del tipo de masa seleccionado
    var masa = 0
    
    // índice del tipo de queso seleccionado
    var queso = 0

    @IBOutlet weak var uiPickerTamanyos: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.uiPickerTamanyos.selectRow(self.tamanyo, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.tamanyos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.tamanyos[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.tamanyo = row
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destinationViewController as! PizzaTipoMasaViewController
        vc.masa = self.masa
        vc.queso = self.queso
        vc.tamanyo = self.tamanyo
    }

}
