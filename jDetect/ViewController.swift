//
//  ViewController.swift
//  jDetect
//
//  Created by frestie ngongo on 08/04/2019.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imgRadiologist: UIImageView!
    @IBOutlet weak var lblRadiologist: UILabel!
    var userID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //the user sellect the original image
        if let pickedImage = info[UIImagePickerControllerOriginalImage]as? UIImage{
            lblRadiologist.text = "Categorising image"//Set the lebal for feature when loading
            
            //setting image view
            imgRadiologist.contentMode = .scaleToFill //set image guess as scalle
            imgRadiologist.image = pickedImage // Set the image to be the picked image
            
            //getting the model
            guard let model = try? VNCoreMLModel(for: imageType().model) else{ //open the model
                    fatalError("cannot load the model")//pass fetal error cannot load the model
            }
            
            //creating vision requestand calling the model
            let request = VNCoreMLRequest(model: model) {[weak self] request, error in
                //set result as classification observation.
                guard let results = request.results as? [VNClassificationObservation],
                    let topResult = results.first //show highest accuracy first.
                    else{
                        fatalError("Error")////send an error when there is not on the result
                }

                //updating the main UI thread with the labaled resul and their percentage.
                DispatchQueue.main.async {[weak self] in
                    //update label with the top result
                    self?.lblRadiologist.text = "\(topResult.identifier) with \(Int(topResult.confidence * 100))% confidence"
                }
            }
            
            // changing UI image type to CI image type
            guard let ciImage = CIImage(image:pickedImage)//coreMl model need CIImage insteam of UIImage type
                else{
                    fatalError("Unable to read image")//display error
            }
     
            // running the classifier
            let handler = VNImageRequestHandler(ciImage:ciImage) //create a handler that allow ciImage to pass through
            DispatchQueue.global().async{
                do{
                    try handler.perform([request]) //hanfler perform request
                }
                catch{
                    print(error)//if is not image print error
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
//Take a photo from photo library
    @IBAction func takeImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){//open up user photo library
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self //Setview controller to be a delegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false //Set false so it  the don't add their
            self.present(imagePicker,animated: true, completion: nil) //present image picker controller present it as true
        }
    }
    //This allow user to take picture that will be classify with the trained images
    //@IBAction func takePhotoFromCamera(_ sender: Any) {
      //      if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
        //        let imagePicker = UIImagePickerController()
          //      imagePicker.delegate = self
            //    imagePicker.sourceType = UIImagePickerControllerSourceType.camera
              //  imagePicker.allowsEditing = false
                //self.present(imagePicker,animated: true, completion: nil)
            //}
    //}
}



