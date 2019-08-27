//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restart()
        
    }
    
    func updateView(story: String, answerA: String? = nil, answerB: String? = nil) {
        storyTextView.text = story
        if answerA != nil {
            topButton.setTitle(answerA, for: .normal)
        } else {
            topButton.isHidden = true
            restartButton.isHidden = false
        }
        if answerA != nil {
            bottomButton.setTitle(answerB, for: .normal)
        } else {
            bottomButton.isHidden = true
        }
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            switch (topButton.currentTitle) {
            case answer1a:
                updateView(story: story3, answerA: answer3a, answerB: answer3b)
                break;
            case answer2a:
                updateView(story: story3, answerA: answer3a, answerB: answer3b)
                break
            case answer3a:
                updateView(story: story6)
                break
                
            default:
                restart()
                break;
            }
        } else {
            switch (bottomButton.currentTitle) {
            case answer1b:
                updateView(story: story2, answerA: answer2a, answerB: answer2b)
                break;
            case answer2b:
                updateView(story: story4)
                break
            case answer3b:
                updateView(story: story5)
                break
                
            default:
                restart()
                break;
            }
        }
        
    
    }
    
    func restart() {
        restartButton.isHidden = true
        topButton.isHidden = false
        bottomButton.isHidden = false
        updateView(story: story1, answerA: answer1a, answerB: answer1b)
    }
    
    @IBAction func restartButtonClicked(_ sender: UIButton) {
        restart()
    }
    


}

