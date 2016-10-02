//
//  ViewController.swift
//  iMSignature
//
//  Created by Muzahidul Islam on 5/2/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var signature: iMSignature?
	var signatureImage: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "iMSignature"
		// Do any additional setup after loading the view, typically from a nib.
	
		self.signature = iMSignature(frame: self.view.bounds)
		//self.signature?.setLineWidth(5)
		self.signature?.setStrokeColor(UIColor.blue)
		
		self.view.addSubview(self.signature!)
	}
	@IBAction func eraseSignature(_ sender: AnyObject) {
		self.signature?.erase()
	}

	@IBAction func doneBtnAction(_ sender: AnyObject) {
		if self.signature?.signatureIsGiven == false {
			print("isgiven false")
		}else{
			print("isgiven true")
			self.signatureImage = self.captureSceenshot(ofView: self.signature!)
			guard let _ = self.signatureImage else{
				return
			}
			self.performSegue(withIdentifier: "Modal_Preview", sender: self)
		}
	}
	
	func captureSceenshot(ofView _view: UIView) -> UIImage {
		let rect = _view.bounds
		UIGraphicsBeginImageContext(rect.size)
		let contextRef = UIGraphicsGetCurrentContext()
		_view.layer.render(in: contextRef!)
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return img!
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Modal_Preview" {
			let destinationVC = segue.destination as! PreviewViewController
			destinationVC.img = self.signatureImage
		}
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	

}

