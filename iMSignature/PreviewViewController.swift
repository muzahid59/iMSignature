//
//  PreviewViewController.swift
//  iMSignature
//
//  Created by Muzahidul Islam on 5/2/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

	@IBOutlet var previewImage: UIImageView!
	var img: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
			if let img = self.img{
				self.previewImage.image = img
			}
        // Do any additional setup after loading the view.
    }

	@IBAction func doneAction(_ sender: AnyObject) {
		self.dismiss(animated: true, completion: nil)
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
