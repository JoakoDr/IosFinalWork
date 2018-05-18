//
//  ViewController.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 22/3/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController, DataHolderDelegate {
     @IBOutlet var txtUser:NuevoTextField?
     @IBOutlet var txtPassword:NuevoTextField?
     @IBOutlet var btnLogin:UIButton?
     @IBOutlet var btnregistro:UIButton?
    
    
   @IBAction func eventoClickLogin()  {
    DataHolder.sharedInstance.login(user: (txtUser?.text)!, password: (txtPassword?.text)!, delegate: self )
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Auth.auth().addStateDidChangeListener { (auth, user) in
           
        }
       //txtUser?.text = DataHolder.sharedInstance.miNombre
       // print("  "+DataHolder.sharedInstance.miNombre)
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DHDlogin(blFinLogin: Bool) {
        if blFinLogin {
            self.performSegue(withIdentifier: "transicionlogin", sender: self)
        }
        
    }


}

