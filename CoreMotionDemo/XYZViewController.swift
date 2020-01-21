//
//  XYZViewController.swift
//  CoreMotionDemo
//
//  Created by Ankita Jain on 2020-01-21.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import CoreMotion

class XYZViewController: UIViewController {

    @IBOutlet weak var square: UIView!
    @IBOutlet weak var xLabel: UILabel!
     @IBOutlet weak var yLabel: UILabel!
     @IBOutlet weak var zLabel: UILabel!
      
     // Like the location manager we need a motion manager here
     var motionManager : CMMotionManager!
      
     override func viewDidLoad() {
       super.viewDidLoad()
       motionManager = CMMotionManager()
       motionManager.startAccelerometerUpdates(to: .main){data,error in
         guard let accelerometerData = data else {return}
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        
        let x = formatter.string(for: accelerometerData.acceleration.x)
        let y = formatter.string(for:accelerometerData.acceleration.y)
        let z = formatter.string(for:accelerometerData.acceleration.z)
        print(x,y,z)
        
        self.xLabel.text = "X:\(x)"
        self.yLabel.text = "Y:\(y)"
        self.zLabel.text = "Z:\(z)"
        self.moveSquare(x: CGFloat((accelerometerData.acceleration.x)), y: CGFloat(accelerometerData.acceleration.y))
}
    }
        func moveSquare(x: CGFloat, y:CGFloat)
        {
            // get the current position of the square
            let xPos = square.frame.origin.x
            let yPos = square.frame.origin.y
            
            let width = square.frame.size.width
            let height = square.frame.size.height
            
            //get device frame size
            let screen = UIScreen.main.bounds
            let screenWidth = screen.width
            let screenHeight = screen.height
            
            UIView.animate(withDuration: 0) {
                guard (xPos + x >= 0 && xPos + width + x <= screenWidth) && (yPos - y >= 0 && yPos + height - y <= screenHeight) else {return}
                
                self.square.frame = CGRect(x: xPos + x, y: yPos - y, width: width, height: height)
            }
            
        }
}

