//
//  ViewController.swift
//  audioplayer
//
//  Created by Javier Cantos on 23/12/15.
//  Copyright © 2015 Javier Cantos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var player : AVAudioPlayer!
    var canciones : Array<Array<String>> = Array<Array<String>>()
    
    @IBOutlet weak var uiLabelTitulo: UILabel!
    @IBOutlet weak var uiImgPortada: UIImageView!
    @IBOutlet weak var uiPickerCanciones: UIPickerView!
    @IBOutlet weak var uiControlAudio: UISegmentedControl!
    @IBOutlet weak var uiSliderVolumen: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // inicializamos lista de canciones
        self.canciones.append(["Amor Es Solo Amar", "PALABRAMUJER.PNG", "AmarEsSoloAmor"])
        self.canciones.append(["El Despertar", "ADAGIO.PNG", "ElDespertar"])
        self.canciones.append(["Pantera En Libertad", "MONICA4.0.PNG", "PanteraEnLibertad"])
        self.canciones.append(["Chicas Malas", "CHICASMALAS.PNG", "ChicasMalas"])
        self.canciones.append(["Sobreviviré", "MINAGE.PNG", "Sobrevivire"])
        
        let cancionURL = NSBundle.mainBundle().URLForResource(self.canciones[0][2], withExtension: "mp3")
        
        do {
            
            try self.player = AVAudioPlayer(contentsOfURL: cancionURL!)
            
            // volumen x defecto del reproductor
            self.player.volume = self.uiSliderVolumen.value
            
            // mostramos titulo / portada cancion seleccionada
            self.uiLabelTitulo.text = self.canciones[0][0]
            self.uiImgPortada.image = UIImage(named: self.canciones[0][1])
            
        } catch {
            print("Error al iniciar reproductor de audio.")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.canciones.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.canciones[row][0]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cancionURL = NSBundle.mainBundle().URLForResource(self.canciones[row][2], withExtension: "mp3")
        
        do {
            
            try self.player = AVAudioPlayer(contentsOfURL: cancionURL!)
            
            self.uiControlAudio.selectedSegmentIndex = 0
            
            // mostramos titulo / portada cancion seleccionada
            self.uiLabelTitulo.text = self.canciones[row][0]
            self.uiImgPortada.image = UIImage(named: self.canciones[row][1])
            
            // empezamos a reproducir la cancion seleccionada
            self.player.play()
            
        } catch {
            print("Error al iniciar reproductor de audio.")
        }
        
    }
    
    @IBAction func changeVolume() {
        self.player.volume = self.uiSliderVolumen.value
    }
    
    @IBAction func audiocontrol() {
        // iniciamos reproduccion de la cancion
        if (self.uiControlAudio.selectedSegmentIndex == 0) {
            print("play()")
            if (self.player != nil && !self.player.playing) {
                self.player.play()
            }
        }
        
        // pausamos reproduccion de la cancion
        if (self.uiControlAudio.selectedSegmentIndex == 1) {
            print("pause()")
            if (self.player != nil && self.player.playing) {
                self.player.pause()
            }
        }
        
        // paramos reproduccion de la cancion
        if (self.uiControlAudio.selectedSegmentIndex == 2) {
            print("stop()")
            if (self.player != nil && self.player.playing) {
                self.player.stop()
                self.player.currentTime = 0
            }
        }
        
        // reproducción aleatoria de la cancion
        if (self.uiControlAudio.selectedSegmentIndex == 3) {
            print("shuffle()")

            // numero aleatorio
            let random : Int = Int(arc4random() % 5)
            
            // seleccion aleatoria de cancion
            self.uiPickerCanciones.selectRow(random, inComponent: 0, animated: true)
            self.pickerView(self.uiPickerCanciones, didSelectRow: random, inComponent: 0)
            
        }
    }
    
}

