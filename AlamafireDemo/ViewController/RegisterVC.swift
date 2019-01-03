//
//  RegisterVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 29/11/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SVProgressHUD
import FirebaseStorage
import SQLite3

class RegisterVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txLasttName:UITextField!
    @IBOutlet weak var txtGender:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtDob:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    @IBOutlet weak var imgProfile:UIImageView!
    
    var refDatabase: DatabaseReference!
    
    var picker = UIImagePickerController()
    
    var alert: UIAlertController!
    
    var downLoadURL:String?
    
    var stmt: OpaquePointer?
    
    var url: URL?
    
    var db: OpaquePointer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title="Register"
   
        // craete database
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            .appendingPathComponent("UserProfile.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS UserProfile (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, lastname TEXT,gender TEXT,email TEXT,dob TEXT,password INTEGER,image Text)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        self.imgProfile.layer.cornerRadius = 50
        self.imgProfile.layer.masksToBounds=true

        
        txtName.delegate=self
        txLasttName.delegate=self
        txtGender.delegate=self
        txtEmail.delegate=self
        txtDob.delegate=self
        txtPassword.delegate=self
        
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary

        
        refDatabase = Database.database().reference().child("User")
    }
    public enum ImageFormat {
        case png
        case jpeg(CGFloat)
    }
    
    func convertImageTobase64(format: ImageFormat, image:UIImage) -> String? {
        var imageData: NSData?
        switch format {
        case .png: imageData = UIImagePNGRepresentation(image) as NSData?
        case .jpeg(let compression): imageData = UIImageJPEGRepresentation(image, compression)! as NSData 
        }
        return imageData?.base64EncodedString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func saveRegisterObj()
    {
        if (txtName.text == "" && txLasttName.text == "" && txtGender.text == "" && txtEmail.text == "" && txtDob.text == "" && txtPassword.text == "")
        {
        }else
        {
            let queryString = "INSERT INTO UserProfile (name,lastname,gender,email,dob,password) VALUES (?,?,?,?,?,?)"
            
            if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing insert: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 1, self.txtName.text , -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt, 2, self.txLasttName.text , -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 3, self.txtGender.text, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 4, self.txtEmail.text, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            if sqlite3_bind_text(stmt, 5, self.txtDob.text, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_int(stmt, 6, (self.txtPassword.text! as NSString).intValue) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding name: \(errmsg)")
                return
            }
//            if sqlite3_bind_text(stmt, 7, url, -1, nil) != SQLITE_OK{
//                let errmsg = String(cString: sqlite3_errmsg(db)!)
//                print("failure binding name: \(errmsg)")
//                return
//            }
            if sqlite3_step(stmt) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting hero: \(errmsg)")
                return
            }
            
            
            SVProgressHUD.show()
            let key = refDatabase.childByAutoId().key
            
            let storage = Storage.storage()
            let storageReference = storage.reference().child("UploadImage").child("1543842836.21203.jpg")
            storageReference.downloadURL(completion: { (url, error) in
                
                guard let url = url else {
                    return
                }
                DispatchQueue.main.async { () -> Void in
                    self.downLoadURL = url.absoluteString
                    self.refDatabase.child(key).setValue(["id":key,
                                                          "Name": self.txtName.text! as String,
                                                          "LastName": self.txLasttName.text! as String,
                                                          "Gender": self.self.txtGender.text! as String,
                                                          "Email": self.txtEmail.text! as String,
                                                          "Dob": self.txtDob.text! as String,
                                                          "Password": self.txtPassword.text! as String,
                                                          "Profile":self.downLoadURL!
                        ])
                    SVProgressHUD.dismiss()
                    let uploadObj = self.storyboard?.instantiateViewController(withIdentifier: "UploadImageVC") as? UploadImageVC
                    self.navigationController?.pushViewController(uploadObj!, animated: true)
                }
            })
        }
    }
    @IBAction func backviewController()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func uploadImage(_ sender: Any)
    {
        self.openGallary()
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
        url = info[UIImagePickerControllerImageURL] as? URL
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgProfile.image = chosenImage

        let base64String = convertImageTobase64(format: .png, image: imgProfile.image!)
        
        let storage = Storage.storage()
        let storageReference = storage.reference()

        let imageName = "\(Date().timeIntervalSince1970).jpg"
        let imagesReference = storageReference.child("UploadImage").child(imageName)
        
//        let storageRef = FIRStorage.storage().reference().child("myImage.png")
        if let uploadData = UIImageJPEGRepresentation(chosenImage, 0.8) {
            imagesReference.putData(uploadData, metadata: nil) { (metadata, error) in
                
                guard let metadata = metadata else{
                    return
                }
            }
//        url = info["UIImagePickerControllerImageURL"] as! NSURL
//        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        imgProfile.image=chosenImage
//
//        // storage image
//        let storage = Storage.storage()
//        let storageReference = storage.reference()
//
//        // storage/carImages/image.jpg
//        let imageName = "\(Date().timeIntervalSince1970).jpg"
//        let imagesReference = storageReference.child("UploadImage").child(imageName)
//
//        if let imageData = UIImageJPEGRepresentation(chosenImage, 0.8) {
//            //            let metadata = StorageMetadata()
//            //            metadata.contentType = "image/jpeg"
//
//            let uploadTask = imagesReference.putData(imageData, metadata: nil, completion: { (metadata, error) in
//
//
//                if let metadata = metadata
//                {
//                } else {
//                }
//
//            })
//
//        } else {
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if txtDob == textField {
            txtDob.resignFirstResponder()
            RPicker.selectDate(title: "Select Date", didSelectDate: { (selectedDate) in
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MMM-yyyy"
                let myString = (String(describing: selectedDate))
                self.txtDob.text = myString
            })
        }
    }
}
