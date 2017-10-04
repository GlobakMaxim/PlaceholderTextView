//
//  PlaceholderTextView.swift
//
//  Created by Globak Maxim on 03/10/2017.
//  Copyright © 2017 Maxim Globak. All rights reserved.
//

import UIKit

fileprivate struct Constants {
  static let defaultAnimationDuration: TimeInterval = 0.15
  static let placeholderAlpha: CGFloat = 0.35
  static let minPadding: CGFloat = 8
}

class PlaceholderTextView: UITextView {
  
  // Mark: - Public properties
  var placeholder: String? {
    didSet {
      placeholderLabel.text = placeholder
    }
  }
  
  // Mark: - Private properties
  private lazy var placeholderLabel: UILabel = {
    let placeholderLabel = UILabel(frame: placeholderFrame)
    placeholderLabel.font = font
    placeholderLabel.textColor = textColor?.withAlphaComponent(Constants.placeholderAlpha)
    addSubview(placeholderLabel)
    addNotifications()
    return placeholderLabel
  }()
  
  private var placeholderFrame: CGRect {
    let verticalPadding: CGFloat = max(textContainerInset.top, Constants.minPadding)
    let horizontalPadding: CGFloat = max(textContainerInset.left, Constants.minPadding)
    let width: CGFloat = bounds.size.width - 2 * horizontalPadding
    let height: CGFloat = 0
    return CGRect(x: horizontalPadding, y: verticalPadding, width: width, height: height)
  }
  
  // Mark: - Supporting functions
  override func layoutSubviews() {
    super.layoutSubviews()
    placeholderLabel.sizeToFit()
  }
  
  private func addNotifications() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(textViewDidChange),
                                           name: NSNotification.Name.UITextViewTextDidChange,
                                           object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc private func textViewDidChange() {
    if self.text.isEmpty {
      showPlaceholder(duration: Constants.defaultAnimationDuration)
    } else {
      hidePlaceholder(duration: Constants.defaultAnimationDuration)
    }
  }
  
  private func showPlaceholder(duration: TimeInterval) {
    placeholderLabel.isHidden = false
    UIView.animate(
      withDuration: duration,
      animations: { [weak self] in
        self?.placeholderLabel.alpha = 1
    })
  }
  
  private func hidePlaceholder(duration: TimeInterval) {
    UIView.animate(withDuration: duration, animations: {
      self.placeholderLabel.alpha = 0
    }, completion: { [weak self] completed in
      self?.placeholderLabel.isHidden = true
    })
  }
  
}
