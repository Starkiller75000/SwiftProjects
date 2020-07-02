//
//  AuthHelper.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthHelper {
    func startAuth(_ completion: ((_ success: Bool, _ errStr: String?) -> Void)?) {
        let context = LAContext()
        let policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
        let reason = "Débloquer du contenu privé"
        var error: NSError?
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: reason) { (success, err) in
                DispatchQueue.main.async {
                    if err != nil {
                        //Alerte
                        completion?(false, err?.localizedDescription)
                    }
                    if success == true {
                        //Débloquer le contenu
                        completion?(true, nil)
                    }
                }
            }
        } else {
            completion?(false, "Nous ne pouvons pas procéder à l'auth")
        }
    }
}
