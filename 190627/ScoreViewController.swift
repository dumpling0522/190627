//
//  ScoreViewController.swift
//  190627
//
//  Created by 水餃 on 2019/8/1.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var result: GameResult?

    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var dugtrio: UILabel!
    @IBOutlet weak var alolaDugtrio: UILabel!
    @IBOutlet weak var alolaDiglett: UILabel!
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let resultValue = result!
        score.text = resultValue.score.description
        dugtrio.text = resultValue.dugtrio.description
        alolaDugtrio.text = resultValue.alolaDugtrio.description
        alolaDiglett.text = resultValue.alolaDiglett.description
        
        var scores = UserDefaults.standard.array(forKey: "scores")
        if scores == nil {
            scores = [Int]()
        }
        scores?.append(resultValue.score)
        UserDefaults.standard.set(scores, forKey: "scores")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
