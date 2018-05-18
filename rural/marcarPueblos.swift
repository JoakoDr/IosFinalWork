//
//  marcarPueblos.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 10/5/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//
import Foundation
import MapKit
import MapKit
import UIKit


class marcarPueblos: UIViewController,MKMapViewDelegate{
    @IBOutlet var mapaMarcar:MKMapView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressed = UILongPressGestureRecognizer()
        
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
