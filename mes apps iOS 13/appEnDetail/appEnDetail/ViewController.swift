//
//  ViewController.swift
//  appEnDetail
//
//  Created by Benoît Bouton on 17/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vue: MyView!
    var btn: UIButton!
    var label: UILabel?
    var isRotated = false
    let color: UIColor = .red
    //RGB => valeur entre 0 et 1
    //Le spectre de couleurs va entre 0 et 255
    //Valeur du spectre / 255 pour obtenir la valeur RGB
    let customColor = UIColor(red: 92 / 255, green: 64 / 255, blue: 215 / 255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did Load")
        createView()
        setupGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will Appear")
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Will Disapear")
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Did Disapear")
    }
    
    func setupLabel() {
        if label == nil {
            label = UILabel()
            label?.backgroundColor = .systemTeal
            label?.text = "Salut"
            label?.frame = vue.bounds
            label?.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(remove))
            tap.numberOfTapsRequired = 2
            label?.addGestureRecognizer(tap)
            if label != nil {
                vue.addSubview(label!)
            }
        }
    }
    
    func createView() {
        //1. Instancier la vue.
        //CGRect = CGPoint + CGSize
        vue = MyView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        //2. Configurer la vue
        vue.backgroundColor = .red
        //3. positionner la vue
        //4. ajouter la vue
        view.addSubview(vue)
        print(vue.frame)
        setupLabel()
        print("Frame: \(vue.frame) / Bounds: \(vue.bounds)")
        //Frame: Positionnement et taille par rapport à se supervue
        //Bounds: Positionnement et taille par rapport à lui-même
        //Bounds: x et y toujours 0.
        btn = UIButton()
        btn.setTitle("Push me", for: .normal)
        btn.backgroundColor = .systemTeal
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(rotate), for: .touchUpInside)
        btn.frame = CGRect(x: view.frame.width / 3, y: view.frame.height - 75, width: view.frame.width / 2 - view.frame.width / 6, height: 50)
        view.addSubview(btn)
    }
    
    @objc func remove() {
        label?.removeFromSuperview()
        label = nil
    }
    
    @objc func rotate() {
        UIView.animate(withDuration: 1, animations: {
            //Rotation
            //let angle = CGFloat(Double.pi / 180) * CGFloat(45)
            //self.vue.transform = !self.isRotated ? CGAffineTransform(rotationAngle: angle) : CGAffineTransform.identity
            
            //CGPoint
            //self.vue.center = self.view.center
            
            //CGSize
            self.vue.frame.size = CGSize(width: 250, height: 250)
        }, completion: { (success) in
            self.isRotated = !self.isRotated
            print("Frame: \(self.vue.frame) / Bounds: \(self.vue.bounds)")
            self.setupLabel()
        })
    }
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [color.cgColor, customColor.cgColor, UIColor.systemPink.cgColor, UIColor.yellow.cgColor, UIColor.white.cgColor, UIColor.orange.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        //gradient.locations = [0, 0.5, 0.66]
        gradient.frame = view.bounds
        //view.layer.addSublayer(gradient)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == label {
            print(touch.preciseLocation(in: self.view))
            vue?.center = touch.preciseLocation(in: self.view)
        }
    }
}

class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Programmatique
        print("frame")
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //Storyboards
        print("coder")
        setup()
    }
    
    func setup() {
        print("Setup elements")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
        //Appeler dès que l'on devra redessiner la vue
        layer.cornerRadius = 15
        clipsToBounds = true
    }
}
