//
//  pueblos.swift
//  rural
//
//  Created by JOAQUIN DIAZ RAMIREZ on 12/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit

class pueblos: NSObject {
    
    let IDNombre = "Nombre"
    let IDPoblacion = "Poblacion"
    let IDProvincia = "Provincia"
    let IDImagen = "img"
    let IDlat = "lat"
    let IDlon = "lon"

    var sID:String?
    var sNombre:String?
    var sPoblacion:String?
    var sProvincia:String?
    var sImagen:String?
    var dlat:Double?
    var dlon:Double?
    
    
    func setMap(valores:[String:Any]){
        sNombre=valores[IDNombre] as? String
        sPoblacion=valores[IDPoblacion] as? String
        sProvincia=valores[IDProvincia] as? String
        sImagen=valores[IDImagen] as? String
        dlon=valores[IDlon] as? Double
        dlat=valores[IDlat] as? Double
        
       // if sImagen == nil{
          //  sImagen = "gs://proyectotest-95913.appspot.com/1.jpg"
       // }
    }
    func getMap()->[String:Any]
    {
        return[
            IDNombre: sNombre as Any,
            IDPoblacion: sPoblacion as Any,
            IDProvincia: sProvincia as Any,
            IDImagen: sImagen as Any,
            IDlat : dlat as Any,
            IDlon : dlon as Any
        ]
    }

}
