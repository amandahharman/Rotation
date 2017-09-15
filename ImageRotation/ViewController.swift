//
//  ViewController.swift
//  ImageRotation
//
//  Created by Amanda Harman on 9/14/17.
//  Copyright © 2017 Amanda Harman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var xTextField: UITextField!
  @IBOutlet weak var yTextField: UITextField!
  @IBOutlet weak var zTextField: UITextField!
  @IBOutlet weak var goButton: UIButton!
  @IBOutlet weak var imageView2D: UIImageView!
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
      setUpUI()
  }

  func setUpUI() {
    xTextField.addLabel("x:")
    yTextField.addLabel("y:")
    zTextField.addLabel("z:")
    xTextField.addBorder()
    yTextField.addBorder()
    zTextField.addBorder()
    goButton.addBorder()
  }

  
  @IBAction func goButtonTapped(_ sender: UIButton) {
    
  }
  
  
}

