







import UIKit

public enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}

extension UIImage {
    
    public func base64(format: ImageFormat) -> String {
        var imageData: NSData
        switch format {
        case .PNG: imageData = UIImagePNGRepresentation(self)! as NSData
        case .JPEG(let compression): imageData = UIImageJPEGRepresentation(self, compression)! as NSData
        }
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
    
    // Convert UIImage to a base64 representation
    //
    class func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
    
    //
    // Convert a base64 representation to a UIImage
    //
//    class func convertBase64ToImage(imageString: String) -> UIImage {
//        let imageData = NSData(base64Encoded: imageString, options: .ignoreUnknownCharacters)!
//        return UIImage(data: imageData)!
//    }
}
