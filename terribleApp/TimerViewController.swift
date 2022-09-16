//
//  TimerViewController.swift
//  terribleApp
//
//  Created by Christian Gould on 9/15/22.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    var timer: Timer? = nil
    var seconds: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
              if self.seconds == 10 {
                self.seconds = 0
                  
              } else {
                self.seconds = self.seconds + 1
              }
            self.timerLabel.text = String(format: "%.01d",self.seconds)
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

}
