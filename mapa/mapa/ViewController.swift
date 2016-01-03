//
//  ViewController.swift
//  mapa
//
//  Created by Javier Cantos on 24/12/15.
//  Copyright © 2015 Javier Cantos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var uiMapViewMapa: MKMapView!
    @IBOutlet weak var uiControlMap: UISegmentedControl!
    
    private var current = CLLocation()
    private let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // inicializamos datos CLLocationManager
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        
        // inicializamos tipo de mapa x defecto
        self.uiMapViewMapa.zoomEnabled = true
        self.uiMapViewMapa.mapType = MKMapType.Standard
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeMapType() {
        if (self.uiControlMap.selectedSegmentIndex == 0) {
            // inicializamos tipo de mapa x defecto
            self.uiMapViewMapa.mapType = MKMapType.Standard
            
            print("Mapa Tipo Standard.")
        }
        if (self.uiControlMap.selectedSegmentIndex == 1) {
            // inicializamos tipo de mapa x defecto
            self.uiMapViewMapa.mapType = MKMapType.Satellite
            
            print("Mapa Tipo Satélite.")
        }
        if (self.uiControlMap.selectedSegmentIndex == 2) {
            // inicializamos tipo de mapa x defecto
            self.uiMapViewMapa.mapType = MKMapType.Hybrid
            
            print("Mapa Tipo Híbrido.")
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        self.manager.stopUpdatingLocation()
        self.uiMapViewMapa.showsUserLocation = false
        if (status == .AuthorizedWhenInUse) {
            self.manager.startUpdatingLocation()
            self.uiMapViewMapa.showsUserLocation = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // ultima localizacion actualizada
        let location = locations.last! as CLLocation
        
        // inicializamos punto nueva localizacion
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D()
        pin.title = "[Latitud: \(location.coordinate.latitude), Longitud: \(location.coordinate.longitude)]"
        pin.subtitle = "[Distancia: \(location.distanceFromLocation(self.current))]"
        pin.coordinate.latitude = location.coordinate.latitude
        pin.coordinate.longitude = location.coordinate.longitude
        
        // añadimos punto de localizacion
        if (locations[0].distanceFromLocation(self.current) > 50) {
            self.current = location
            self.uiMapViewMapa.addAnnotation(pin)
        }
        
        // centramos mapa ultima posicion
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.uiMapViewMapa.setRegion(region, animated: true)
        
        print("[\(locations[0].coordinate.latitude), \(locations[0].coordinate.longitude), \(locations[0].distanceFromLocation(self.current))]")
    }

}

