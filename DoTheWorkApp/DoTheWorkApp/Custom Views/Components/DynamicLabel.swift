//
//  DynamicLabel.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 6/2/21.
//

import UIKit

@IBDesignable
class DynamicLabel: UILabel {
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        view = loadViewFromNib(nibName: String(describing: self))
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.frame = self.bounds
        addSubview(view)
    }
    
    private func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        
        // TODO: Create test case to remove optional
        return view ?? UIView()
    }
    
}
