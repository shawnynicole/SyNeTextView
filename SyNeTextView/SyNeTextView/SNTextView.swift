//
//  SyNeTextView.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

/// Using tab to go to next field only works when field is within a UICollectionView or UITableView.
open class SyNeTextView: UITextView {
    
    // MARK: ************************************ Editable *******************************************
    
    open override var isEditable: Bool {
        get { return super.isEditable }
        set {
            super.isEditable = newValue
            textColor = newValue ? _textColor : ._disabledGray
            singleTap?.isEnabled = !newValue
            doubleTap?.isEnabled = !newValue
        }
    }
    
    open override var textColor: UIColor? {
        get { return super.textColor }
        set {
            _textColor = newValue
            super.textColor = isEditable ? newValue : ._disabledGray
        }
    }
    
    private lazy var _textColor: UIColor? = textColor
    
    open override var textContainerInset: UIEdgeInsets {
        get { return super.textContainerInset }
        set {
            _textContainerInset = newValue
            updateInsets()
        }
    }
    
    // MARK: ************************************ Placeholder *******************************************
    
    private lazy var placeholderView: UITextView = {
       
        let view = UITextView()
        view.isSelectable = false
        view.isEditable = false
        view.isScrollEnabled = false
        view.isUserInteractionEnabled = false
        view.isHidden = hasText
        view.font = font
        view.textColor = placeholderColor
        view.backgroundColor = .clear
        view.textContainer.lineFragmentPadding = textContainer.lineFragmentPadding
        
        return view
    }()
    
    private var placeholderColor: UIColor = ._placeholder
    
    @IBInspectable
    public var placeholder: String? {
        get { return placeholderView.text }
        set { placeholderView.text = newValue }
    }
    
    private func togglePlaceholder() {
        
        placeholderView.isHidden = hasText
    }
    
    // MARK: ************************************ Editing Button(s) ******************************************s
    
    private lazy var _textContainerInset: UIEdgeInsets = textContainerInset
    
    func toggleEditingButton() {
        
        toggleClearButton()
        toggleDoneButton()
        updateInsets()
    }
    
    func updateInsets() {
        
        let leftRightViewBuffer: CGFloat = 3
        
        let clearButtonInset = shouldShowClearButton ? clearButtonSize.width : 0
        let doneButtonInset = _shouldShowDoneButton ? doneButtonSize.width : 0
        let rightViewInset = rightView?.frame.width ?? 0
        let rightInset = clearButtonInset + doneButtonInset + (rightViewInset == 0 ? 0 : rightViewInset + leftRightViewBuffer)
        
        super.textContainerInset.right = _textContainerInset.right + rightInset
        // textContainerInset.right = rightInset == 0 ? _textContainerInsetRight : rightInset
        
        let leftViewInset = leftView?.frame.width ?? 0
        let leftInset = (leftViewInset == 0 ? 0 : leftViewInset + leftRightViewBuffer)
        
        super.textContainerInset.left = _textContainerInset.left + leftInset
        // textContainerInset.left = leftInset == 0 ? _textContainerInsetLeft : leftInset
        
        placeholderView.textContainerInset = textContainerInset
    }
    
    // MARK: ************************************ Done Button ******************************************s
    
    public lazy var shouldShowDoneButton: Bool = !shouldReturn
    
    private var _shouldShowDoneButton: Bool {
        return isEditing && shouldShowDoneButton
    }
    
    let doneButtonSize = CGSize(width: 44, height: 44)
    
    lazy var doneButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(._dodgerBlue, for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.bold()

        return button
    }()
    
    @objc func doneButtonAction() {

        resignFirstResponder()
    }
    
    func toggleDoneButton() {
        
        let isVisible = _shouldShowDoneButton
        
        if !isVisible {
            
            doneButton.removeFromSuperview()
        }
        
        else if doneButton.superview == nil, let superview = superview {
            
            // Adding doneButton to superview, keeps the doneButton in the same place, even when the TextView scrolls
            
            superview.addSubview(doneButton)
            
            doneButton.removeConstraints(doneButton.constraints)
            
            let rightConstant = (rightView?.frame.width ?? 0)
            
            doneButton.translatesAutoresizingMaskIntoConstraints = false
            doneButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            doneButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightConstant).isActive = true
            doneButton.widthAnchor.constraint(equalToConstant: doneButtonSize.width).isActive = true
            doneButton.heightAnchor.constraint(equalToConstant: doneButtonSize.height).isActive = true
        }
    }
    
    // MARK: ************************************ Clear Button ******************************************s
    
    public var clearButtonMode: SyNeTextViewClearMode = .whileEditing
    
    private let clearButtonSize = CGSize(width: 34, height: 24)
    
    private var shouldShowClearButton: Bool {
        
        switch clearButtonMode {
        case .never: return false
        case .always: return hasText
        case .whileEditing: return isEditing && hasText
        case .unlessEditing: return !isEditing && hasText
        }
    }
    
    lazy var clearButton: UIButton = {
        
        let image = UIImage(named: "clear", in: Bundle(for: SyNeTextView.self), compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        button.setImage(image, for: .normal)

        return button
    }()
    
    @objc func clearButtonAction() {

        text = nil
        toggleClearButton()
    }
    
    func toggleClearButton() {
        
        let isVisible = shouldShowClearButton
        
        if !isVisible {
            
            clearButton.removeFromSuperview()
        }
        
        else if clearButton.superview == nil, let superview = superview {
            
            // Adding clearButton to superview, keeps the clearButton in the same place, even when the TextView scrolls
            
            superview.addSubview(clearButton)
            
            clearButton.removeConstraints(clearButton.constraints)
            
            let rightConstant = (rightView?.frame.width ?? 0) + (shouldShowDoneButton ? doneButtonSize.width : 0)
            
            clearButton.translatesAutoresizingMaskIntoConstraints = false
            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            clearButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightConstant).isActive = true
            clearButton.widthAnchor.constraint(equalToConstant: clearButtonSize.width).isActive = true
            clearButton.heightAnchor.constraint(equalToConstant: clearButtonSize.height).isActive = true
        }
    }
    
    // MARK: ************************************ View *******************************************
    
    public var editingMode: SyNeTextViewMode = .textView
    
    private var shouldReturn: Bool { return editingMode == .textField }
    private var shouldTab: Bool { return editingMode == .textField || editingMode == .tabsToNext }
    
    open lazy var shouldCenterVertically: Bool = shouldReturn
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // Center Vertically
        
        if shouldCenterVertically {
            
            let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
            let size = sizeThatFits(fittingSize)
            let topOffset = (bounds.size.height - size.height * zoomScale) / 2
            let positiveTopOffset = max(-9999, topOffset) //max(1, topOffset)
            contentOffset.y = -positiveTopOffset
        }
        
        // Updates textContainerInsets to accomodate button(s) and/or left/right views
        updateInsets()
        
        configureLeftView()
        configureRightView()
    }
    
    // MARK: ************************************ Observers *******************************************

    public var resetScrollOnExit: Bool = true
    
    public var isEditing: Bool = false
    
    private var fieldObservations: [NSKeyValueObservation] = []
    
    @objc private func textViewDidChangeNotification(_ note: Notification) {

        let object = note.object as! SyNeTextView
        
        object.toggleEditingButton()
        object.togglePlaceholder()
        object.shouldResignOn(tab: shouldTab, return: shouldReturn)
    }
    
    @objc private func textViewDidBeginEditingNotification(_ note: Notification) {
        
        let object = note.object as! SyNeTextView
        
        object.isEditing = true
        object.toggleEditingButton()
    }
    
    @objc private func textViewDidEndEditingNotification(_ note: Notification) {
       
        let object = note.object as! SyNeTextView
        
        object.isEditing = false
        object.toggleEditingButton()
        
        if object.resetScrollOnExit {
            object.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    // MARK: ************************************ Left View *******************************************

    public var leftView: UIView? {
        didSet {
            
            if let oldValue = oldValue {
                oldValue.removeFromSuperview()
                updateInsets()
            }
            
            configureLeftView()
        }
    }
    
    private func configureLeftView() {
        
        guard let leftView = leftView, let superview = superview, leftView.superview != superview else { return }
        
        // Adding leftView to superview, keeps the leftView in the same place, even when the TextView scrolls

        superview.addSubview(leftView)
        
        leftView.removeConstraints(leftView.constraints)
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        leftView.widthAnchor.constraint(equalToConstant: leftView.frame.width).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: leftView.frame.height).isActive = true
    }
    
    // MARK: ************************************ Right View *******************************************

    public var rightView: UIView? {
        didSet {
            
            if let oldValue = oldValue {
                oldValue.removeFromSuperview()
                updateInsets()
            }
            
            configureRightView()
        }
    }
    
    private func configureRightView() {
        
        guard let rightView = rightView, let superview = superview, rightView.superview != superview else { return }
        
        // Adding rightView to superview, keeps the rightView in the same place, even when the TextView scrolls
        
        superview.addSubview(rightView)
        
        rightView.removeConstraints(rightView.constraints)
        
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: rightView.frame.width).isActive = true
        rightView.heightAnchor.constraint(equalToConstant: rightView.frame.height).isActive = true
    }
    
    // MARK: ************************************ Taps *******************************************
    
    private final func wordRange(at point: CGPoint) -> UITextRange? {
        
        if let textPosition = closestPosition(to: point) {
            return  tokenizer.rangeEnclosingPosition(textPosition, with: .word, inDirection: 1)
        }
        
        return nil
    }
    
    private var singleTap: UITapGestureRecognizer!
    private var doubleTap: UITapGestureRecognizer!

    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        
        let point = sender.location(ofTouch: 0, in: sender.view)
        
        if sender.numberOfTapsRequired == 2 {
            
            // Select text at point of double tap (even when disabled)
            _ = becomeFirstResponder()
            selectedTextRange = wordRange(at: point)
            
            return
        }
        
        guard !isEnabled else {
            if !isFirstResponder {
                _ = becomeFirstResponder()
            }
            return
        }
        
        // Unselect any selected text
        resignFirstResponder()
        
        if let collectionView = _traverseViewHierarchy(UICollectionView.self) {
            guard let cell = _traverseViewHierarchy(UICollectionViewCell.self) else { return }
            guard let ip = collectionView.indexPath(for: cell) else { return }
            collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: ip)
        }
        
        else if let tableView = _traverseViewHierarchy(UITableView.self) {
            
            guard let cell = _traverseViewHierarchy(UITableViewCell.self) else { return }
            guard let ip = tableView.indexPath(for: cell) else { return }
            tableView.delegate?.tableView?(tableView, didSelectRowAt: ip)
        }
    }
    
    
    // MARK: ************************************ View *******************************************

    /// Called after init. Must call super.
    open func viewDidLoad() {
        
        // Removes default white background
        backgroundColor = .clear //UIColor.yellow.withAlphaComponent(0.1)
        
        // Removes default padding
        textContainer.lineFragmentPadding = 0
        
        // Placeholder View
        addSubview(placeholderView)
        placeholderView.frame = bounds
        placeholderView.translatesAutoresizingMaskIntoConstraints = true
        placeholderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Gestures
        
        singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        singleTap.numberOfTapsRequired = 1
        singleTap.isEnabled = !isEditable
        addGestureRecognizer(singleTap)
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.isEnabled = !isEditable
        addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
        
        fieldObservations.append(

            observe(\.text, changeHandler: { (object, change) in
                object.toggleEditingButton()
                object.togglePlaceholder()
            })
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textViewDidChangeNotification(_:)),
            name: Notification.Name.UITextViewTextDidChange,
            object: self
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textViewDidBeginEditingNotification(_:)),
            name: Notification.Name.UITextViewTextDidBeginEditing,
            object: self
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textViewDidEndEditingNotification(_:)),
            name: Notification.Name.UITextViewTextDidEndEditing,
            object: self
        )
    }
    
    // MARK: ************************************ Deinit / Init *******************************************
    
    deinit {
        
        fieldObservations.forEach { $0.invalidate() }
        
        fieldObservations.removeAll()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        viewDidLoad()
    }
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        viewDidLoad()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewDidLoad()
    }
    
    public init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        viewDidLoad()
    }
    
    public required init() {
        super.init(frame: .zero, textContainer: nil)
        viewDidLoad()
    }
    
    // MARK: ************************************  *******************************************
}
