//
//  HomeViewController.swift
//  190627
//
//  Created by 水餃 on 2019/8/1.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var hammer: UIImageView!
    @IBOutlet weak var leaderboard: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var whackAMole: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.leaderboard.center.x = -200
        self.play.center.x = 500
        self.whackAMole.center.x = -200
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, animations: {
            self.leaderboard.center.x = self.view.center.x
            self.play.center.x = self.view.center.x
            self.whackAMole.center.x = self.view.center.x
            })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 1, animations: {
            self.hammer.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 90)
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 2, animations: {
            self.hammer.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * -20)
        })
    }
    
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
    
    @IBAction func goHome(segue:UIStoryboardSegue) {
        
    }
}
