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
    var placeholder: String?
    var story: Story?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var wordButton: UIButton!
    @IBOutlet weak var goStoryButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start of with goStoryButton hidden
        goStoryButton.isHidden = true
        
        // start with the right elements for the chosen story
        
        let countPlaceholder = story!.getPlaceholderRemainingCount()
        wordCount.text = "\(story!.getPlaceholderCount()) word(s) left"
        
        placeholder = story?.getNextPlaceholder()
        inputField.placeholder = "fill in a \(placeholder!)"
    }
    
    // open each text file depending on which story the user chooses and make title.
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
        guard let story = self.story else {
            return
        }
        
        // ensure proper usage
        if inputField.text!.isEmpty {
            inputField.placeholder = "You must fill in a \(placeholder!)!"
        }
            
        else {
            
        // for each word filled in, give it to the story text
        if !story.isFilledIn() {
            
                
                // update everything when a placeholder is filled in and remove text
                story.fillInPlaceholder(word: inputField.text!)
                wordCount.text = "\(story.getPlaceholderRemainingCount()) word(s) left"
                placeholder = story.getNextPlaceholder()
                inputField.text?.removeAll()
                
                // disable oke button so user can't change words afterwards
                if story.isFilledIn() {
                    inputField.placeholder = "All the words are filled in!"
                    wordButton.isEnabled = false
                    
                    // make goStoryButton appear if all words are filled in
                    goStoryButton.isHidden = false
                }
                    
                else {
                    inputField.placeholder = "fill in a \(placeholder!)"
                }
            }
        }
    }
    
    // apply the filled in story text to a variable when this button is clicked
    @IBAction func goStoryButton(_ sender: Any) {
        words = story!.toString()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // prepare for segue and give variable with story text to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? ThirdViewController {
            nextViewController.words = words!
        }
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
