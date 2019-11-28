//
//  GameViewController.swift
//  190627
//
//  Created by 水餃 on 2019/6/27.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ScoreViewController
        controller.result = GameResult(score: score, alolaDiglett: alolaDiglett, dugtrio: dugtrio, alolaDugtrio: alolaDugtrio)

    }
    let images = [ UIImage(named: "alolaDiglett"),
                   UIImage(named: "Dugtrio"),
                   UIImage(named: "alolaDugtrio")]
    let holeImage = UIImage(named: "hole")
    var score = 0
    var alolaDiglett = 0
    var dugtrio = 0
    var alolaDugtrio = 0
    @IBOutlet var diglettButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    var startTime: Date?
    func showDigletts() {
        var hasDigletts = [true, true, true, true, false, false, false, false, false, false, false, false]
            hasDigletts.shuffle()
            var i = 0
            for hasDiglett in hasDigletts {
                if hasDiglett {
                    let image = self.images.randomElement()!
                    self.diglettButtons[i].setImage(image, for: .normal)
                } else {
                    self.diglettButtons[i].setImage(holeImage, for: .normal)
                }
                i += 1
            }
    }
    
 
    
    @IBAction func startButton(_ sender: UIButton) {
        sender.isHidden = true
        startTime = Date()
        self.showDigletts()
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            let now = Date()
            let interval = now.timeIntervalSince(self.startTime!)
            let dif = 10 - interval
            self.timeLable.text = String(format: "%.2f", dif)
            if dif <= 0 {
                self.timeLable.text = "0.00"
                timer.invalidate()
                self.performSegue(withIdentifier: "result", sender: nil)
            } else if self.timeLable.text?.hasSuffix("00") == true {
                self.showDigletts()
            }
            
        }
    }
    @IBAction func tapDigletts(_ sender: UIButton) {
        if sender.currentImage != holeImage {
            let number = images.firstIndex(of: sender.currentImage)
            if number == 0 {
                score += 10
                alolaDiglett += 1
            } else if number == 1 {
                score += 20
                dugtrio += 1
            } else {
                score += 30
                alolaDugtrio += 1
            }
            scoreLable.text = "\(score)"
            sender.setImage(UIImage(named: "hole"), for: .normal)
        }
    }
    
    
    
}
