//
//  ConstraintsViewController.swift
//  PlaceholderTextView
//
//  Created by Globak Maxim on 05/10/2017.
//  Copyright © 2017 Globak Maxim. All rights reserved.
//

import UIKit

class ConstraintsViewController: UIViewController {
  
  var placeholderTextView: PlaceholderTextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    placeholderTextView = PlaceholderTextView()
    placeholderTextView.placeholder = """
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    """
    
    view.addSubview(placeholderTextView)
    
    placeholderTextView.translatesAutoresizingMaskIntoConstraints = false
    placeholderTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    placeholderTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
    placeholderTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
    placeholderTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
    
  }
  
}
