//
//  DetailViewController.swift
//  jDetect
//
//  Created by frestie ngongo on 4/15/19.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//

import UIKit
import FirebaseAuth
// Details calss that inherit Uitable view data source and delegate 
class DetailViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
var listofobjects = ["Benign", "Benign", "Malignant","Benign", "Malignant", "Benign","Malignant","Malignant","Benign","Benign","Malignant","Malignant"]
    
    var imagestodisplay = ["nocancer1.png","nocancer2.png","cancer1.png","nocancer3.png","cancer2.png","cancer3.png","cancer4.png","nocancer4.png","nocancer5.png","nocancer6.png","cancer5.png","nocancer6.png"];
    
    var timetaken = ["12:00 Am","01:09 Pm","10:00 Pm","12:00 Pm","04:09 Pm","08:00 Pm","12:00 Am","01:09 Pm","08:50 Pm","12:00 Am","03:59 Pm","08:00 Pm"];
    @IBOutlet weak var tblDetais: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // table view delegate and data source to displave the items in table view
        tblDetais.delegate = self
        tblDetais.dataSource = self
    }
    
    // number of rows in table view cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the total number of array and make cell
        return listofobjects.count
    }

    // table view protocaol
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // creating an instance of table view cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cancerhistories", for: indexPath) as! DetailsTableViewCell
        cell.viewCell.layer.cornerRadius = 1.0
        cell.imgcancer.layer.cornerRadius = 4.0
        
        // label that display list of object in table view
        cell.lblcancer.text = listofobjects[indexPath.row]
        cell.imageView?.image = UIImage(named: imagestodisplay[indexPath.row])
        cell.lbltime.text = timetaken[indexPath.row]
        return cell
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        // sign out code
        try! Auth.auth().signOut()
        // after sign out dismiss the viev controller
        self.dismiss(animated: true, completion: nil)
    }
    
    // Clear button function
    
    @IBAction func btnClear(_ sender: Any) {
        // remove all elements from array list
        listofobjects.removeAll()
        imagestodisplay.removeAll()
        timetaken.removeAll()
        tblDetais.reloadData()
    }
}
