//
//  SegmentedControl.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 6/07/22.
//

import Foundation
import UIKit

@IBDesignable class SegmentedControl: UIControl {
    private var labels = [UILabel]()
    var thumbView = UIView()
    
    @IBInspectable var font : UIFont = UIFont.systemFont(ofSize: 16)
    
    var green : UIColor = UIColor(rgb: 0x3AAF0D)
    var items: [String] = ["All","Favorites"] {
        didSet {
            setUpLabels()
        }
    }
    
    var segmentSize: CGFloat {
        return frame.width / CGFloat(items.count)
    }
    
    var selectedIndex: Int  = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if let newIndex = calculatedIndex {
            selectedIndex = newIndex
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectedFrame = self.bounds
        let newWidth = selectedFrame.width / CGFloat(items.count)
        
        selectedFrame.size.width = newWidth
        thumbView.frame = selectedFrame
        thumbView.backgroundColor = .white
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        for index in 0...labels.count - 1 {
            let label = labels[index]
            let xPosition = CGFloat(index) * labelWidth
            
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
    }
    
    @objc
    private func didTap(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: self)
        selectedIndex = Int(location.x / segmentSize)
    }
    
    func setUpView() {
        layer.cornerRadius = 5
        layer.borderColor = UIColor(rgb: 0x3AAF0D).cgColor
        layer.borderWidth = 1
        
        setUpLabels()
        displayNewSelectedIndex()
        insertSubview(thumbView, at: 0)
        
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        )
    }
    
    func setUpLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            label.textColor = .white
            label.font = font
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    func displayNewSelectedIndex() {
        for (_, item) in labels.enumerated() {
            item.textColor = green
            item.backgroundColor = UIColor.clear
        }
        
        let label = labels[selectedIndex]
        label.textColor = .white
        label.backgroundColor = green
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       animations: { [weak self] in
            self?.thumbView.frame = label.frame
        }, completion: nil)
    }
}
