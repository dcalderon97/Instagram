//
//  ComposeViewController.swift
//  instagram
//
//  Created by Daniel Calderon on 2/22/18.
//  Copyright © 2018 Daniel Calderon. All rights reserved.
//

import UIKit
import UITextView_Placeholder

class ComposeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {
    @IBOutlet weak var photoUploadImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!

    var vc: UIImagePickerController!
    var imageUpload: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextView.placeholder = "Enter Your Cpation"
        captionTextView.placeholderColor = UIColor.lightGray
        vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        // Do any additional setup after loading the view.
        self.present(vc, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = resize(image: originalImage, newSize: CGSize(width: 300, height: 300))
        imageUpload = editedImage
        // Do something with the images (based on your use case)
        photoUploadImageView.image = editedImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        imageUpload = #imageLiteral(resourceName: "image_placeholder")
        photoUploadImageView.image = imageUpload
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onShare(_ sender: Any) {
        Post.postUserImage(image: photoUploadImageView.image, withCaption: captionTextView.text) {
            (success, error) in
            if success{
                print("Image upload successful!")
                self.backToHome()
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }

    @IBAction func onTapImageView(_ sender: UITapGestureRecognizer) {
        vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        // Do any additional setup after loading the view.
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        backToHome()
    }
    func backToHome(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let feedViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        self.present(feedViewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
