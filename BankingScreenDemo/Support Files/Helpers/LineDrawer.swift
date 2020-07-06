//
//  LineDrawer.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 06.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {

       //design the path
   let path = UIBezierPath()
   path.move(to: start)
   path.addLine(to: end)

       //design path in layer
   let shapeLayer = CAShapeLayer()
   shapeLayer.path = path.cgPath
   shapeLayer.strokeColor = lineColor.cgColor
   shapeLayer.lineWidth = 0.5

       view.layer.addSublayer(shapeLayer)
   }
