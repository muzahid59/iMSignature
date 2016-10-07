//
//  iMSignature.swift
//  iMSignature
//
//  Created by Muzahidul Islam on 5/2/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class iMSignature: UIView {
	
	fileprivate var path: UIBezierPath!
	fileprivate var strokeColor = UIColor.black // default signature color
	fileprivate var lineWidth: CGFloat = 5.0 // default signature line width
	
	fileprivate(set) var signatureIsGiven = false
		
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.lightGray // default background color of the container view
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
	
	func setBackGroundColor(_ color: UIColor) -> Void {
		self.backgroundColor = color
	}
	
	/// Change the signature color
	/// - Parameter color: Color of the Signature
	/// - Returns: Nothing to return
	
	func setStrokeColor(_ color: UIColor) -> Void {
		self.strokeColor = color
		
	}

	/// Set the width of the line
	/// - Parameter width: The line width of the signature
	/// - Returns: Nothing to return
	
	func setLineWidth(_ width: CGFloat) -> Void {
		self.lineWidth = width
		self.path.lineWidth = width
	}
	
  /// Handle long press. When long press happen then erase the current
  ///signature
	/// - Parameter longPress:  Long press geture recognizer
	/// - Returns: Nothing to return
	
	func longPress(_ longPress: UILongPressGestureRecognizer) -> Void {
		self.erase()
	}
	
	/// Handle pan gesture.
	/// - Parameter pan:  Dynamically when user move the finger caught
  /// by pan gesture.
	/// - Returns: Nothing to return
	
	func handlePan(_ pan: UIPanGestureRecognizer) -> Void {
		let currentPoint = pan.location(in: self)
		if pan.state == .began {
			path.move(to: currentPoint)
		}else if pan.state == .changed{
			self.signatureIsGiven = true
			path.addLine(to: currentPoint) // draw signature as the path user move his finger
		}
		self.setNeedsDisplay() // force to draw the UIBeizerPath
	}
	
	/// Erase the current signature
	
	func erase() -> Void {
		self.signatureIsGiven = false
		self.path = UIBezierPath()
		self.setNeedsDisplay()
	}

	/// Draw the UIBeizerPath on the container view
	
	override func draw(_ rect: CGRect) {
		self.path.lineWidth = self.lineWidth
		self.strokeColor.setStroke()
		path.stroke()
	}

}
