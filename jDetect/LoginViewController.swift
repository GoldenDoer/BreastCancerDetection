//
//  LoginViewController.swift
//  jDetect
//
//  Created by frestie ngongo on 4/15/19.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//

import UIKit
// importing firebase class
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // declaring of text fields and button
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!// text box declaration
    @IBOutlet weak var btnoutletsignup: UIButton! // button declaration
    @IBOutlet weak var btnoutletlogin: UIButton!
    var uid :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.btnoutletlogin.layer.cornerRadius = 5.0 // this code create a curner in button
        self.btnoutletsignup.layer.cornerRadius = 5.0  // this code create a curner in button
    }
    
    @IBAction func btnsignup(_ sender: Any) {
    }
    
    //login button Action
    @IBAction func btnLogin(_ sender: Any) {
        
        // check to see if the text boxes are not empty
        if txtemail.text != nil && txtpassword.text != nil{
            

            // if the boxes are not empty tperform this action
            //AUTH take in parameters paass in from the text boxes and send to server to check if it exit
            Auth.auth().signIn(withEmail: txtemail.text!, password: txtpassword.text!){(result,error) in
                if error != nil{    // check if response as erro print the error else the app login
                    print("erro")

                    let rr = error
                    print(rr!) // print error message in console
                    
                    // calling a message function that display eror message
                    self.showSimpleAlert(msg: "wrong Email or password, please check and try again")
                }else{  // when parameters have been sent and their is no erro our app will be signed in
                    print("logged in")
                    self.uid = (result?.user.uid)! // asign user that login id here

                    self.performSegue(withIdentifier: "LoginVC", sender: self) // send the app tp next view after successful logined
                    
                }

            }
        }else{
            self.showSimpleAlert(msg: "Email or password can not be empty")// this code will show an alert to tell you that the text boxex can not be empty
        }
    }
   
    
    func login(user:String, pass:String){
        // check to see if the text boxes are not empty
     txtemail.text = user
        txtpassword.text = pass
        if txtemail.text != nil && txtpassword.text != nil{
            
            // if the boxes are not empty this action will be perform
            //AUTH take in parameters paass in from the text boxes and send to server to check if it exit
            Auth.auth().signIn(withEmail: txtemail.text!, password: txtpassword.text!){(result,error) in
                if error != nil{    // check if response as erro print the error else the app login
                    print("erro")
                    
                    let rr = error
                    print(rr!)
                    self.showSimpleAlert(msg: "wrong Email or password, please check and try again")
                }else{  // when parameters have been sent and their is no erro the app will be signed in
                    print("logged in")
                    self.uid = (result?.user.uid)! // hasign user that login id here
                    
                    self.performSegue(withIdentifier: "LoginVC", sender: self) //send the app tp next view after successful logined
                }
            }
        }else{
            self.showSimpleAlert(msg: "Email or password can not be empty")// this code will show an alert to tell you that the text boxex can not be empty
        }
    }
    
    /**
     error login Alert
     - Show alert with title and alert message
     */
    
    // creating alert function  that can be call any where in the program within the class
    func showSimpleAlert( msg:String) {
        let alert = UIAlertController(title: "Error", message: msg,         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }

    // this is a function that open new view when the user and password are corect
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //this check for which view controller is been call
        if segue.identifier == "LoginVC"{
            let vcView = segue.destination as! ViewController
            vcView.userID = uid
        }
    }
}// end of the class
