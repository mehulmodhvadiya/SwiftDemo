//
//  UploadImageVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 28/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage



class UploadImageVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var ref:DatabaseReference?
    
    var url:NSURL!
    
    var picker = UIImagePickerController()
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // optional binding
        let str:String? = "Home"
        
        if let strName = str {
            print(strName)
        }
        
        self.navigationItem.title="Home"
        
        //image related
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary

        ref = Database.database().reference().child("MyUploadImage")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gotoProfileVC(){
        let profileObj = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        self.navigationController?.pushViewController(profileObj!, animated: true)
    }

    @IBAction func uploadImage(_ sender: Any)
    {
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to capture image andvideo?", preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Photo", style: .default, handler: { action in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Video", style: .default, handler: { action in
            self.openGallary()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            picker.sourceType = UIImagePickerControllerSourceType.camera
            self .present(picker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallary()
    {
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
   // PickerView Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        picker .dismiss(animated: true, completion: nil)
        
        url = info["UIImagePickerControllerImageURL"] as! NSURL
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImageView.image=chosenImage

        // storage image
        let storage = Storage.storage()
        let storageReference = storage.reference()

        // storage/carImages/image.jpg
        let imageName = "\(Date().timeIntervalSince1970).jpg"
        let imagesReference = storageReference.child("UploadImage").child(imageName)

        if let imageData = UIImageJPEGRepresentation(chosenImage, 0.8) {
//            let metadata = StorageMetadata()
//            metadata.contentType = "image/jpeg"

            let uploadTask = imagesReference.putData(imageData, metadata: nil, completion: { (metadata, error) in

                if let metadata = metadata {
                } else {
                }

            })

        } else {
        }
    }
    
//    @objc(imagePickerController:didFinishPickingMediaWithInfo:) func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        {
////            let data = Data()
////            let storageRef = Storage.storage().reference().child("myImage.png")
//            if let uploadData = UIImageJPEGRepresentation(image,0.5) as Data?
//            {
////                storageRef.putData(uploadData as Data)
//
//                Storage.storage().reference().child("myImage").putData(uploadData, metadata: nil, completion:
//                    {(metadata, error) in
//
//                        if error != nil {
//                            print("error")
//                            return
//                        }
//
//                        print(metadata)
//
//                        //how do I put the download URL in the metadata into my database
//
//                }
//                )
//            }
//
//        }
//        else
//        {
//            //error
//        }
//
//        self.dismiss(animated: true, completion: nil)
//
////        let metadata = StorageMetadata()
////        metadata.contentType = "image/jpeg"
////        Storage.storage().reference().child(imgUid).putData(imgData, metadata: metadata) { (metadata, error) in
////            if error != nil {
////                print("Didn't upload image in Firebase Storage")
////                self.isUploaded = false
////            } else {
////                print("Uploaded in Firebase Storage")
////                self.isUploaded = true
////                let downloadURL = metadata?.downloadURL()?.absoluteString
////                if let url = downloadURL {
////                    self.setUser(img: url)
////                    self.downloadPhoto(user: self.name)
////                }
////            }
////        }
//
//
//
//    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
    }

}
