//
//  VCprincipal.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 5/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit

class VCprincipal: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,DataHolderDelegate {
    @IBOutlet var coleccion: UICollectionView?
    @IBOutlet var btnsalir:UIButton?
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return DataHolder.sharedInstance.arCiudades.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVcolection = collectionView.dequeueReusableCell(withReuseIdentifier: "idcelda2", for: indexPath) as! CVcolection
        /*cell.lblNombre?.text = DataHolder.sharedInstance.arCiudades[indexPath.row].sNombre
        print(DataHolder.sharedInstance.arCiudades[indexPath.row].sNombre as Any)
        cell.mostrarImagen(url: DataHolder.sharedInstance.arCiudades[indexPath.row].sImagen!)//DataHolder.sharedInstance.miPerfil.sImagen!)
        print("------------------------>"+DataHolder.sharedInstance.arCiudades[indexPath.row].sImagen!)
        //arCiudades[indexPath.row].sImagen!)
        return cell
    */
        cell.lblNombre?.text = DataHolder.sharedInstance.arCiudades[indexPath.row].sNombre
        //print("----->INDEX  :",indexPath.row)
        //celda.mostrarImagen(url: DataHolder.sharedInstance.arPueblos[indexPath.row].sImagen!)
        cell.mostrarImagen(url:  DataHolder.sharedInstance.arCiudades[indexPath.row].sImagen!,indx: indexPath.row)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataHolder.sharedInstance.vcPrincipal = self
        DataHolder.sharedInstance.descargarColeccion(delegate: self)
    }
    func DHDdescargaCiudades(blFin: Bool) {
        print("me he descargado collections")
    if(blFin)
    {
        self.refreshUI()
        }
    }
        // Do any additional setup after loading the view.
    

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

        func refreshUI () {
            DispatchQueue.main.async(execute:{self.coleccion?.reloadData()})
        }
    }

