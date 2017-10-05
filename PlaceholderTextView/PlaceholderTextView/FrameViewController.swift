//
//  FrameViewController.swift
//  PlaceholderTextView
//
//  Created by Globak Maxim on 05/10/2017.
//  Copyright © 2017 Globak Maxim. All rights reserved.
//

import UIKit

class FrameViewController: UIViewController {

  var placeholderTextView: PlaceholderTextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    placeholderTextView = PlaceholderTextView(frame: placeholderTextViewFrame)
    placeholderTextView.placeholder = """
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    """
    view.addSubview(placeholderTextView)
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    placeholderTextView.frame = placeholderTextViewFrame
  }
  
  private var placeholderTextViewFrame: CGRect {
    return CGRect(x: view.bounds.minX + 60,
                  y: view.bounds.minY + 120,
                  width: view.bounds.width - 120,
                  height: view.bounds.height - 240)
  }

}
