//
//  ViewController.swift
//  UILabel_FontSizeToFit
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    let words = [String](["apple", "orange", "banana", "grape", "kiwi", "mango", "lychee", "lemon", "coconut", "pear", "pineapple", "peach", "strawberry", "fig", "lime", "papaya", "nectarine", "plum", "quince", "raspberry", "ohajiki", "watermelon", "blackberry", "cherry", "avocado"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        // Setup UILabel
        self.label.numberOfLines = 0
        self.label.frame = CGRectMake(0, 0, 300, 100)
        self.label.text = self.words[0]
        self.label.textAlignment = .Center
        self.label.font = UIFont.systemFontOfSize(50.0)
        self.label.textColor = UIColor.whiteColor()
        self.label.lineBreakMode = .ByWordWrapping
        self.label.layer.borderWidth = 2.0
        self.label.layer.borderColor = UIColor.redColor().CGColor
        self.label.layer.cornerRadius = 3.0
        self.view.addSubview(self.label)
        self.label.center = self.view.center
        
        // Start Demo Loop
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "addWord1", userInfo: nil, repeats: true);
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func addWord1() {
        // Simply add word to label
        let random = Int(arc4random()) % self.words.count
        let fruit = self.words[random]
        let newText = String(format: "%@ %@", self.label.text!, fruit)
        self.label.text = newText
        self.label.fontSizeToFit()
    }
    
    func addWord2() {
        // Add word which with lineSpacing
        let random = Int(arc4random()) % self.words.count
        let fruit = self.words[random]
        let newText = String(format: "%@ %@", self.label.text!, fruit)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5.0
        let attributes = [NSParagraphStyleAttributeName: paragraph]
        let attributedText = NSAttributedString(string: newText, attributes: attributes)
        self.label.attributedText = attributedText
        self.label.fontSizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

