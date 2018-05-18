//
//  VCMapa.swift
//  rural
//
//  Created by JOAQUIN DIAZ RAMIREZ on 17/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,DataHolderDelegate,UIGestureRecognizerDelegate {
    @IBOutlet var btnSalir:UIButton?
    @IBOutlet var mapa:MKMapView?
    var locationManager:CLLocationManager?
    var booleano = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        mapa?.showsUserLocation = true
        
        
        // Do any additional setup after loading the view.
       
        
        DataHolder.sharedInstance.descargarColeccion(delegate: self)
    }
    
    
 
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo tpin:String)
    {
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordenada
        //print("********************************* ",coordenada)
        annotation.title = tpin
        mapa?.addAnnotation(annotation)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if(booleano == false){
            //print("------>.", locations[0])
            let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let tempRegion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: miSpan)
      
                mapa?.setRegion(tempRegion, animated: false)
                booleano = true
        }
        
    }
    func DHDdescargaCiudades(blFin: Bool) {
        
        if(blFin)
        {
            //print("---------------------->>>>>>>>> ",DataHolder.sharedInstance.arCiudades.count)
            for pueblo in DataHolder.sharedInstance.arCiudades {
                /*var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = pueblo.sLatitud!
                coordTemp.longitude = pueblo.sLongitud!
                agregarPin(coordenada: coordTemp, titulo: pueblo.sNombre!)*/
            }
            print("me he descargado mapa")
        }else {
            print("error")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //func descargaCiudades(blFin: Bool) {
        
   
//}
}
