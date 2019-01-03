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
import AlamofireObjectMapper
import Alamofire
import NVPullToRefresh
import SVProgressHUD
import ObjectMapper

class UploadImageVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

//    var ref:DatabaseReference?
    
    var url:NSURL!
    
    let window:UIWindow? = nil
    
    var picker = UIImagePickerController()
    
    var datamain:MainUrlDataModel?
    
    var arrRes4 = [MainUrlDataModel]()
    
    var arrRes5 = [CountryData1]()
    
    var arrRes2 = [MainModelData]()
    
    var companyDic:[String:Any] = [String:Any]()
    
    var arrRes3 = [CountryData]()

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var tableList:UITableView!
    
    let cellReuseable = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let wd = UIApplication.shared.delegate?.window {
            var vc = wd!.rootViewController
            if(vc is UINavigationController){
                vc = (vc as! UINavigationController).visibleViewController
                
            }
            
            if(vc is UploadImageVC){
                print("hi")
                
            }
        }
        
        print(GlobelConstant.kBirthDate)
        
        let date:String? = "22/01/1992"
        
        
        print(Date.convertStringToDate(strDate: date!, dateFormate:DD_MM_YYYY))
        print(Date.convertLocalToUTC(strDate: date!, oldFormate: DD_MM_YYYY, newFormate:YYYY_MM_DD_HH_MM_SS))
        
        //UIAlertController.showAlertMessage(vc: self, titleStr: "login", messageStr: "login")
        
        
        self.navigationItem.title="Home"
        
        //image related
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary

//        ref = Database.database().reference().child("MyUploadImage")
//        DispatchQueue.main.async {
        self.jsonDecoding()
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        var refresher = NVPullToRefresh(NVActivityIndicatorType: .circleStrokeSpin, Color: .black)
        
        tableList.addPullToRefresh(refresher)
        {
            self.callwsGetWebService()
            self.tableList.endAllRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gotoProfileVC(){
        
        let profileObj = storyboard?.instantiateViewController(withIdentifier: "SqlProfileVC") as? SqlProfileVC
        self.navigationController?.pushViewController(profileObj!, animated: true)
    }

    @IBAction func logout(_ sender: Any)
    {
        let kUserDefault = UserDefaults.standard
        kUserDefault.removeObject(forKey: "UserObj")
        kUserDefault.synchronize()
        UserDefaults.standard.setLoggedIn (value: false)
        
//        let loginObj = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.popViewController(animated: true)
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
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
    }
    
    func callwsGetWebService()
    {
        SVProgressHUD.show()
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseArray { (response: DataResponse<[MainModelData]>) in
            
            let forecastArray = response.result.value
            
            if let forecastArray = forecastArray {
                for forecast in forecastArray {
                    self.arrRes2.append(forecast)
                }
                SVProgressHUD.dismiss()
                self.tableList.reloadData()
            }
        }
    }
    
    func jsonDecoding() {
        SVProgressHUD.show()
        
        
        // array of dictionary in ios in swift uisng
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let dataResponse = data,
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//            do{
//                //here dataResponse received from a network request
//                let jsonResponse = try JSONSerialization.jsonObject(with:
//                    dataResponse, options: [])
//                print(jsonResponse)
//
//                guard let jsonArray = jsonResponse as? [[String: Any]] else {
//                    return
//                }
//
//                for dic in jsonArray{
//                    self.arrRes4.append(MainUrlDataModel.init(dictionary:dic)!)
//                }
//                SVProgressHUD.dismiss()
//                print(jsonArray)
//
//                DispatchQueue.main.async {
//                    self.tableList.reloadData()
//                }
//
//            } catch let parsingError {
//                print("Error", parsingError)
//            }
//        }
//        task.resume()
        
        
        // reponce comes in dictionary in class model in ios in swift
        guard let url = URL(string: "https://thetool.ch/apiservices/public/api/v1/country/list") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                SVProgressHUD.dismiss()
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse)
                
                guard let jsonDictionary = jsonResponse as? [String: Any] else {
                    return
                }
                
                for (key,value) in jsonDictionary{
                    if (key == "data")
                    {
                        if let Dataarray:[[String:Any]] = value as? [[String:Any]]{
                            for dict in Dataarray{
//                                self.arrRes5.append(CountryListMain.init(dictionary: (dict as NSDictionary) as! [String : Any])!)
                                self.arrRes5.append(CountryData1.init(dictionary: dict )!)
                            }
                        }
                    }
                }
                SVProgressHUD.dismiss()
                print(jsonDictionary)
                
                DispatchQueue.main.async {
                    self.tableList.reloadData()
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
        
        
        
    }
    func callwsGetWebService1()
    {
         DispatchQueue.main.async {
            SVProgressHUD.show()
        Alamofire.request("https://thetool.ch/apiservices/public/api/v1/country/list").responseObject { (response: DataResponse<countryModel>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.data)
            
            if  (weatherResponse?.data?.count)! > 0 {
                self.arrRes3 = (weatherResponse?.data)!
                SVProgressHUD.dismiss()
                self.tableList.reloadData()
            }
        }
      }
    }
    @IBAction func gotoNextVC(){
        let codeObj = storyboard?.instantiateViewController(withIdentifier: "DynamicVC") as? DynamicVC
        self.navigationController?.pushViewController(codeObj!, animated: true)
        
        
//        let codeObj = storyboard?.instantiateViewController(withIdentifier: "SendDataVC") as? SendDataVC
//        codeObj?.arrCountry = self.arrRes5
//        self.navigationController?.pushViewController(codeObj!, animated: true)

    }
}
extension UploadImageVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 61.0
    }
}
extension UploadImageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.arrRes5.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: ListCell! = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? ListCell
        if cell == nil {
            tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: cellReuseable)
            cell = tableView.dequeueReusableCell(withIdentifier: cellReuseable) as? ListCell
        }
        
        
        
        cell.vwCorner?.layer.cornerRadius = 6
        cell.vwCorner?.layer.masksToBounds=true
        
        cell.lblUsername?.text = self.arrRes5[indexPath.row].country_name
        cell.lblEmail?.text = self.arrRes5[indexPath.row].code
        
        return cell
    }
    
    
}
