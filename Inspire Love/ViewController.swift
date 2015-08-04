//
//  ViewController.swift
//  Inspire Love
//
//  Created by Cathy Oun on 7/29/15.
//  Copyright (c) 2015 The Love Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
  
  var quotesToDisplay: [String] = []
  var count = 0
  @IBOutlet weak var quoteLabel: UILabel!
  
  func jsonData(jsonData : NSData) -> [String] {
    var error : NSError?
    if let quote = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String] {
      return quote
    }
    return []
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //        self.view.backgroundColor = UIColor(patternImage: UIImage(named: ))
    if let filepath = NSBundle.mainBundle().pathForResource("TestingArray", ofType: "json") {
      if let data = NSData(contentsOfFile: filepath) {
        quotesToDisplay = jsonData(data)
        quoteLabel.text = quotesToDisplay[count] // initially count = 0
      }
    }

    var tapGestrue = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
    view.addGestureRecognizer(tapGestrue)
    
  }
  
  func handleTapGesture(tapGesture: UITapGestureRecognizer ) {
    quoteLabel.text = quotesToDisplay[++count % quotesToDisplay.count] // in order to loop through the whole array over and over again
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

