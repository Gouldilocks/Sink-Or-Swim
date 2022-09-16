//
//  SegmentedViewController.swift
//  terribleApp
//
//  Created by Christian Gould on 9/15/22.
//

import UIKit

class SegmentedViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            imageView.image = UIImage(named: "ness")
        }
        else {
            imageView.image = UIImage(named: "potato")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "ness")
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

}
