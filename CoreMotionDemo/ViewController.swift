//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by Ankita Jain on 2020-01-21.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            setWallpaper()
        }
        func setWallpaper()
        {
            let min = CGFloat(-20)
            let max = CGFloat(20)
            
            let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
                   xMotion.minimumRelativeValue = min
                   xMotion.maximumRelativeValue = max
            
             let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
            yMotion.minimumRelativeValue = min
            yMotion.maximumRelativeValue = max
            
            let motionEffectGroup = UIMotionEffectGroup()
            motionEffectGroup.motionEffects = [xMotion, yMotion]
            
            imgView.addMotionEffect(motionEffectGroup)
        }
        
        
        
        


    }


