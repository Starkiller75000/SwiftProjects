//
//  ViewController.swift
//  NotifCenter
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor), name: Notification.Name("ChangeBG"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reset), name: UIApplication.willEnterForegroundNotification, object: nil)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchView)))
    }
    
    @objc func changeColor(_ notification: Notification) {
        //Sent object
        /*if let color = notification.object as? UIColor {
            view.backgroundColor = color
        }*/
        
        //Sent userInfo
        if let color = notification.userInfo!["color"] as? UIColor {
            view.backgroundColor = color
        }
        print(notification.userInfo)
    }
    
    @objc func keyboardShow(_ notification: Notification) {
        if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            UIView.animate(withDuration: 0.5) {
                self.btnBottomConstraint.constant = -frame.height
                self.tfBottomConstraint.constant = -frame.height
            }
        }
    }
    
    @objc func keyboardHide(_ notification: Notification) {
        UIView.animate(withDuration: 1) {
            self.btnBottomConstraint.constant = 0
            self.tfBottomConstraint.constant = 0
        }
    }
    
    @objc func touchView() {
        view.endEditing(true)
    }
    
    @objc func reset(_ notification: Notification) {
        textLabel.text = ""
    }
    
    @IBAction func save(_ sender: UIButton) {
        view.endEditing(true)
        textLabel.text = tf.text
    }
    
    @IBAction func stopObserver(_ sender: Any) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

