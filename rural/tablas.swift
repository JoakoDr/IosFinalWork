//
//  tablas.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 5/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//
//-> return
import UIKit
import Firebase
import FirebaseDatabase

class tablas:
UIViewController,UITableViewDelegate,UITableViewDataSource,DataHolderDelegate {
    @IBOutlet var btnsalir:UIButton?
    @IBOutlet var tablas:UITableView?
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if(DataHolder.sharedInstance.arPueblos==nil){
          // return 0
        //}else{
        print("skere--->",DataHolder.sharedInstance.arCiudades.count)
        return DataHolder.sharedInstance.arCiudades.count
      // }
    //}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCelda") as! celdaPrototiopo
        celda.lblNombre?.text = DataHolder.sharedInstance.arCiudades[indexPath.row].sNombre
        celda.Label?.text = DataHolder.sharedInstance.arCiudades[indexPath.row].sProvincia
        //celda.mostrarImagen(url: DataHolder.sharedInstance.arPueblos[indexPath.row].sImagen!)
        celda.mostrarImagen(url:  DataHolder.sharedInstance.arCiudades[indexPath.row].sImagen!)
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarColeccion(delegate: self)
                /*DataHolder.sharedInstance.firestoreDB?.collection("pueblos").getDocuments() { (querySnapshot, err) in
            if let err = err {º                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    let puebloi = pueblos(valores: document as! [String:AnyObject])
                    DataHolder.sharedInstance.arPueblos?.append(puebloi)
                    
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        */
        DataHolder.sharedInstance.firestoreDB?.collection("perfiles").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                DataHolder.sharedInstance.arCiudades = []
                for document in querySnapshot!.documents {
                    let pueblo:Perfil = Perfil()
                    pueblo.sID=document.documentID
                    pueblo.setMap(valores: document.data())
                    DataHolder.sharedInstance.arCiudades.append(pueblo)
                    print("\(document.documentID) => \(document.data())")
                }
                self.refreshUI()
            }
            
        }
      // DataHolder.sharedInstance.firDataBasRef.child("pueblos").observe(DataEventType.value, with: { (snapshot) in
           // let arTemp = snapshot.value as? Array<AnyObject>
            //let pueblos0=pueblos(valores : arTemp?[0] as! [String:AnyObject])
            //if(DataHolder.sharedInstance.arPueblos == nil){
                //DataHolder.sharedInstance.arPueblos = Array<pueblos>
            //}
            //for co in arTemp! as [AnyObject]{
                
            //}
         
       //  self.tablas?.reloadData()
           // let coches0 = arTemp?[0] as? [String:AnyObject]
        //print("lo descargado es: ",0)
      //  })
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DHDdescargaCiudades(blFin: Bool) {
        if(blFin)
        {
            print("Me he descargado la tabla")
             self.refreshUI()
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
    func refreshUI () {
        DispatchQueue.main.async(execute:{self.tablas?.reloadData()})
    }

}
