//
//  ThirdViewController.swift
//  YamievanWijnbergen-pset2
//
//  Created by Yamie van Wijnbergen on 12/04/2017.
//  Copyright © 2017 Yamie van Wijnbergen. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    var storyIdentifier: String?
    var words: String?
    
    @IBOutlet weak var storyText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display story text
        storyText.text = words

        // Do any additional setup after loading the view.
    }

    @IBAction func newStory(_ sender: Any) {
        
        // make words empty
        words = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
