//
//  ViewController.swift
//  TapAndSave
//
//  Created by Benoît Bouton on 23/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var numberOfTapsLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var tapButton: TapButton!
    @IBOutlet weak var changeTimeButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var timeRemaining = 5
    var timer = Timer()
    var isRunning = false
    var numberOfTaps = 0
    var userDefaults = UserDefaults.standard
    let userDefaultsKey = "bestScore"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeLabel()
        tapButton.setup((view.frame.width - 80) / 2)
        enableButtons()
        updateNumberOfTapsLabel()
        updateBestScore()
    }
    
    func setScore(score: Int) {
        userDefaults.set(score, forKey: userDefaultsKey)
    }
    
    func getBestScore() -> Int {
        return userDefaults.integer(forKey: userDefaultsKey)
    }
    
    func updateBestScore() {
        bestScoreLabel.text = "Meilleur Score: \(getBestScore())"
    }
    
    func updateTimeLabel() {
        timeRemainingLabel.text = "Temps Restant: \(timeRemaining) secondes"
        playButton.isEnabled = timeRemaining > 0
    }
    
    func setTime(timer: Int) {
        timeRemaining = timer
        updateTimeLabel()
    }
    
    func stopTimer() {
        isRunning = !isRunning
        timer.invalidate()
        enableButtons()
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        enableButtons()
        let best = getBestScore()
        let myScore = numberOfTaps
        let title = myScore > best ? "Félicitations" : "Bien joué"
        let msg = "Votre score: \(myScore). Le meilleur score était de \(best)"
        let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
        if myScore > best {
            setScore(score: myScore)
        }
        numberOfTaps = 0
        timeRemaining = 0
        updateTimeLabel()
        updateNumberOfTapsLabel()
        updateBestScore()
    }
    
    func enableButtons() {
        tapButton.isEnabled = isRunning
        changeTimeButton.isEnabled = !isRunning
    }
    
    func updateNumberOfTapsLabel() {
        numberOfTapsLabel.text = "Nombre de Taps: \(numberOfTaps)"
    }
    
    @IBAction func tapPressed(_ sender: TapButton) {
        numberOfTaps += 1
        updateNumberOfTapsLabel()
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        if isRunning {
            stopTimer()
        } else {
            isRunning = !isRunning
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            enableButtons()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    self.updateTimeLabel()
                } else {
                    self.stopTimer()
                }
            })
        }
    }
    
    @IBAction func changeTime(_ sender: UIButton) {
        let controller = UIAlertController(title: "Changer de durée", message: "Quelle est la durée que vous voulez", preferredStyle: .actionSheet)
        let five = UIAlertAction(title: "5 secondes", style: .default) { (action) in
            self.setTime(timer: 5)
        }
        let ten = UIAlertAction(title: "10 secondes", style: .default) { (action) in
            self.setTime(timer: 10)
        }
        let fifteen = UIAlertAction(title: "15 secondes", style: .default) { (action) in
            self.setTime(timer: 15)
        }
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            controller.popoverPresentationController?.sourceView = self.view
            controller.popoverPresentationController?.sourceRect = sender.frame
        }
        controller.addAction(five)
        controller.addAction(ten)
        controller.addAction(fifteen)
        controller.addAction(cancel)
        present(controller, animated: true, completion: nil)
    }
}

