//
//  iMSignature.swift
//  iMSignature
//
//  Created by Muzahidul Islam on 5/2/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class iMSignature: UIView {
	
	private var path: UIBezierPath!
	private var strokeColor = UIColor.blackColor() // default signature color
	private var lineWidth: CGFloat = 2.0 // default signature line width
	
	private(set) var signatureIsGiven = false
		
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.lightGrayColor() // default background color of the container view
		path = UIBezierPath()
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(iMSignature.handlePan(_:)))
		self.addGestureRecognizer(panGesture)
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(iMSignature.longPress(_:)))
		self.addGestureRecognizer(longPress)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// Change the background color of the signature container view
	/// - Parameter color: The background color to set
	/// - Returns: Nothing to return
	
	func setBackGroundColor(color: UIColor) -> Void {
		self.backgroundColor = color
	}
	
	/// Change the signature color
	/// - Parameter color: Color of the Signature
	/// - Returns: Nothing to return
	
	func setStrokeColor(color: UIColor) -> Void {
		self.strokeColor = color
		
	}

	/// Set the width of the line
	/// - Parameter width: The line width of the signature
	/// - Returns: Nothing to return
	
	func setLineWidth(width: CGFloat) -> Void {
		self.lineWidth = width
		self.path.lineWidth = width
	}
	
  /// Handle long press. When long press happen then erase the current
  ///signature
	/// - Parameter longPress:  Long press geture recognizer
	/// - Returns: Nothing to return
	
	func longPress(longPress: UILongPressGestureRecognizer) -> Void {
		self.erase()
	}
	
	/// Handle pan gesture.
	/// - Parameter pan:  Dynamically when user move the finger caught
  /// by pan gesture.
	/// - Returns: Nothing to return
	
	func handlePan(pan: UIPanGestureRecognizer) -> Void {
		let currentPoint = pan.locationInView(self)
		if pan.state == .Began {
			path.moveToPoint(currentPoint)
		}else if pan.state == .Changed{
			self.signatureIsGiven = true
			path.addLineToPoint(currentPoint) // draw signature as the path user move his finger
		}
		self.setNeedsDisplay()
	}
	
	/// Erase the current signature
	
	func erase() -> Void {
		self.signatureIsGiven = false
		self.path = UIBezierPath()
		self.setNeedsDisplay()
	}

	/// Draw the UIBeizerPath on the container view
	
	override func drawRect(rect: CGRect) {
		self.path.lineWidth = self.lineWidth
		self.strokeColor.setStroke()
		path.stroke()
	}

}
