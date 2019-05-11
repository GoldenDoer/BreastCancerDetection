//
//  SignupViewController.swift
//  jDetect
//  Created by frestie ngongo on 4/15/19.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//
import UIKit
import FirebaseAuth
class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtcpassword: UITextField!
    @IBOutlet weak var btnOutletsign: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    
    // didload is a function that load all the componebts in the app
    //this fuction load firsty
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // sign up 
    @IBAction func btnSignup(_ sender: Any) {
        if txtemail.text != "" && txtpassword.text != "" && txtcpassword.text != ""{
            if txtpassword.text != txtcpassword.text{
                print("please make sure password and confirm password are same")
            }else{
                // firebase code here
                Auth.auth().createUser(withEmail: txtemail.text!, password: txtpassword.text!){(result,error) in
                    if error != nil{
                        print("erro")
                    }else{
                        self.dismiss(animated: true, completion: nil)
                        //                    ref.setValue(["password":self.txtpassword.text!])
                    }
                }
            }
        }else {
            print("please enter password or email")
        }
    }
}
