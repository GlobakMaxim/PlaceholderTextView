//
//  PlaceholderTextView.swift
//  PlaceholderTextView
//
//  Created by Globak Maxim
//  Copyright © Maxim Globak. All rights reserved.
//

import UIKit

fileprivate struct Constants {
  static let defaultAnimationDuration: TimeInterval = 0.15
  static let placeholderAlpha: CGFloat = 0.35
}

@IBDesignable public class PlaceholderTextView: UITextView {
  
  // MARK: - Public properties
  @IBInspectable public var placeholder: String? {
    didSet {
      placeholderLabel.text = placeholder
    }
  }
  
  override open var font: UIFont? {
    didSet {
      placeholderLabel.font = font
    }
  }
  
  override open var textColor: UIColor? {
    didSet {
      updatePlaceholderColor(placeholderLabel)
    }
  }
  
  override open var text: String! {
    didSet {
      hidePlaceholderIfNeeded(placeholderLabel)
    }
  }
  
  
  // MARK: - Initialization
  @available(iOS 7.0, *)
  public override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    commonInit()
  }
  
  public init(frame: CGRect) {
    super.init(frame: frame, textContainer: nil)
    commonInit()
    
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    // FIXME: - Font is nil on init if text is nil
    text = "_"
    text = ""
    //
    configurePlaceholderLabel(placeholderLabel)
    addSubview(placeholderLabel)
    addNotifications()
  }
  
  // MARK: - Common functions
  override public func layoutSubviews() {
    super.layoutSubviews()
    placeholderLabel.frame = placeholderFrame
    placeholderLabel.sizeToFit()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  // MARK: - Private properties
  private var placeholderLabel = UILabel()
  
  private var placeholderFrame: CGRect {
    let verticalPadding: CGFloat = textContainerInset.top
    let horizontalPadding: CGFloat = textContainer.lineFragmentPadding
    let width: CGFloat = bounds.size.width - 2 * horizontalPadding
    let height: CGFloat = 0
    return CGRect(x: horizontalPadding, y: verticalPadding, width: width, height: height)
  }
  
  // MARK: - Supporting functions
  private func configurePlaceholderLabel(_ placeholderLabel: UILabel) {
    placeholderLabel.frame = placeholderFrame
    placeholderLabel.numberOfLines = 0
    placeholderLabel.font = font
    updatePlaceholderColor(placeholderLabel)
  }
  
  private func hidePlaceholderIfNeeded(_ placeholderLabel: UILabel) {
    placeholderLabel.isHidden = !text.isEmpty
    placeholderLabel.alpha = text.isEmpty ? 1 : 0
  }
  
  private func updatePlaceholderColor(_ placeholderLabel: UILabel) {
    let _textColor = self.textColor ?? placeholderLabel.textColor
    placeholderLabel.textColor = _textColor?.withAlphaComponent(Constants.placeholderAlpha)
  }
  
  private func addNotifications() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(textViewDidChange),
                                           name: UITextField.textDidChangeNotification,
                                           object: nil)
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
    UIView.animate(withDuration: duration,
                   animations: { [weak self] in
                    self?.placeholderLabel.alpha = 1
    })
  }
  
  private func hidePlaceholder(duration: TimeInterval) {
    UIView.animate(withDuration: duration,
                   animations: { [weak self] in
                    self?.placeholderLabel.alpha = 0
    }, completion: { [weak self] completed in
      self?.placeholderLabel.isHidden = completed
    })
  }
  
}
