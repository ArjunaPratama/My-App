//
//  ViewController.swift
//  Art
//
//  Created by Jun  on 12/7/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: UIView!
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            startPoint = point
        
            
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            touchPoint = point
        }
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
       
        //call draw
        draw()
    }
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.lineWidth = 5
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
    canvasView.layer.addSublayer(strokeLayer)
        canvasView.setNeedsDisplay()
        
        
    }

    @IBAction func clearPressed(_ sender: UIButton) {
        path.removeAllPoints()
        canvasView.layer.sublayers = nil
        canvasView.setNeedsDisplay()
    }
}

