//
//  LeaderBoardViewController.swift
//  190627
//
//  Created by 水餃 on 2019/8/30.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var leaderBoard: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var scores = UserDefaults.standard.array(forKey: "scores") as? [Int]
        scores?.sort(by: { (grade1, grade2) -> Bool in
            return grade1 > grade2
        })
        var number = 1
        if scores != nil {
            for score in scores! {
                leaderBoard.text.append("NO" + number.description + " " + score.description + "\n")
                number += 1
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
