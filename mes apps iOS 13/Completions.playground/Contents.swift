import UIKit

//var timer: Timer

//timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
    //print("Je suis appelé")
//})

class MyClass {
    typealias MyCompletion = ((String) -> Void)?
    
    var completion: ((String) -> Void)?

    func firstCompletion(str: String, completion: MyCompletion) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (t) in
            completion?("Je suis: \(str)")
        }
    }
    
    //func firstCompletion(str: String, completion: ((String) -> Void)?) {
        //self.completion = completion
        //Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (t) in
            //completion?("Je suis: \(str)")
            //self.response("Je suis \(str)")
        //}
    //}
    
    //func response(_ str: String) {
        //self.completion?(str)
    //}
}


MyClass().firstCompletion(str: "Matt") { (string) in
    print(string)
}
