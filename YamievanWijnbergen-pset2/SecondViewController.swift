//
//  SecondViewController.swift
//  YamievanWijnbergen-pset2
//
//  Created by Yamie van Wijnbergen on 11/04/2017.
//  Copyright © 2017 Yamie van Wijnbergen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // list of variables
    var words: String?
    var countPlaceholder: Int?
    var placeholder: String?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var wordButton: UIButton!
    @IBOutlet weak var goStoryButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // only appear when all the words are filled in
        goStoryButton.isHidden = true
        
        // get the right descriptives for the chosen story
        countPlaceholder = story!.getPlaceholderRemainingCount()
        //wordCount.text = "\(countPlaceholder!) word(s) left"
        placeholder = story?.getNextPlaceholder()
        inputField.placeholder = "fill in a \(placeholder!)"
    }
    
    // open each text file depending on which story the user chooses and make title.
    var story: Story?
    var storyIdentifier: String?
    {
        didSet {
            self.title = self.storyIdentifier
            if self.storyIdentifier == "Simple"{
                let file = Bundle.main.path(forResource: "madlib0_simple", ofType: "txt")!
                let text = try! String(contentsOfFile: file)
                story = Story(stream: text)
            }
              
            if self.storyIdentifier == "Tarzan"{
                let file = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt")!
                let text = try! String(contentsOfFile: file)
                story = Story(stream: text)
            }
            
            if self.storyIdentifier == "University"{
                let file = Bundle.main.path(forResource: "madlib2_university", ofType: "txt")!
                let text = try! String(contentsOfFile: file)
                story = Story(stream: text)
            }
            
            if self.storyIdentifier == "Clothes"{
                let file = Bundle.main.path(forResource: "madlib3_clothes", ofType: "txt")!
                let text = try! String(contentsOfFile: file)
                story = Story(stream: text)
            }
            
            if self.storyIdentifier == "Dance"{
                let file = Bundle.main.path(forResource: "madlib4_dance", ofType: "txt")!
                let text = try! String(contentsOfFile: file)
                story = Story(stream: text)
            }
        }
    }

    @IBAction func wordButton(_ sender: AnyObject){
        
        // appear when all the words are filled in
        if countPlaceholder == 1 {
            goStoryButton.isHidden = false
        }
        
        // if the input is empty, give an error
        if inputField.text!.isEmpty {
            inputField.placeholder = "You must fill in a \(placeholder!)!"
        }
            
        else {
            
        // for each word filled in, give it to text
        if countPlaceholder! >= 1 {
                
                // update all variables when new word is filled in and remove when it's done
                countPlaceholder = countPlaceholder! - 1
                //wordCount.text = "\(countPlaceholder!) word(s) left"
                story?.fillInPlaceholder(word: inputField.text!)
                placeholder = story?.getNextPlaceholder()
                inputField.text?.removeAll()
                
                // disable ok button when all the words are filled in
                if countPlaceholder! == 0 {
                    inputField.placeholder = "All the words are filled in!"
                    wordButton.isEnabled = false
                }
                    
                else {
                    inputField.placeholder = "fill in a \(placeholder!)"
                }
            
//                // If all words are filled in, go to the next screen.
//                if story!.isFilledIn() {
//                    performSegue(withIdentifier: "ThirdViewController", sender: self)
//                }
            }
            
        }
    }
    
    
    @IBAction func goStoryButton(_ sender: Any) {
        
        // give the story text to variable
        words = story!.toString()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewcontroller = segue.destination as? ThirdViewController {
//            viewcontroller.words = words
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
