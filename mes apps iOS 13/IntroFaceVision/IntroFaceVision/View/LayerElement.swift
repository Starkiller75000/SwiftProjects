//
//  LayerElement.swift
//  IntroFaceVision
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class LayerElement: CAShapeLayer {
    init(_ rect: CGRect) {
        super.init()
        setup(.red)
        let path = UIBezierPath(rect: rect)
        self.path = path.cgPath
    }
    
    init(_ points: [CGPoint]) {
        super.init()
        setup(.systemTeal)
        let path = UIBezierPath()
        guard let first = points.first else { return }
        path.move(to: first)
        points.forEach { (point) in
            path.addLine(to: point)
            path.move(to: point)
        }
        path.addLine(to: first)
        self.path = path.cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ color: UIColor) {
        fillColor = UIColor.clear.cgColor
        strokeColor = color.cgColor
        lineWidth = 3
    }
}
