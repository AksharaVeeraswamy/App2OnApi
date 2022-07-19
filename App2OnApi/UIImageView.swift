//
//  UIImageView.swift
//  App2OnApi
//
//  Created by Akshara Vangala on 13/07/22.
//

import Foundation
import UIKit
@IBDesignable
class RoundImage: UIImageView{


@IBInspectable var cornerRadius: CGFloat = 0 {
    didSet{
        self.layer.cornerRadius = cornerRadius
    }
}

// set border width
@IBInspectable var borderWidth: CGFloat = 0 {
    didSet{
        self.layer.borderWidth = borderWidth
    }
}

// set border color

@IBInspectable var borderColor: UIColor = UIColor.clear {
    didSet{
        self.layer.borderColor = borderColor.cgColor
    }
}

override func awakeFromNib() {
    self.clipsToBounds = true
}


}
