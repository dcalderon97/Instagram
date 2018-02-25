//
//  DetailViewController.swift
//  instagram
//
//  Created by Daniel Calderon on 2/24/18.
//  Copyright © 2018 Daniel Calderon. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetailViewController: UIViewController {
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    var imageFile: PFFile!
    var postDate: String!
    var postCaption: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.file = imageFile
        postImageView.loadInBackground()
        postCaptionLabel.text = postCaption
        postDateLabel.text = postDate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
