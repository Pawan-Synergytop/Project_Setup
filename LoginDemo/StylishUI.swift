//
//  StylishUI.swift
//  LoginDemo
//
//  Created by Mac on 03/06/21.
//

import UIKit
//This is IbDesignable class used for different view to add the function from storyboard
@IBDesignable
class StylishUIView: UIView {

    @IBInspectable var  cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }


    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.masksToBounds = false
    }

}
//MARK:- for Button
@IBDesignable
class StylishUIButton: UIButton{

    @IBInspectable var  cornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = cornerRadius
           }
       }

       @IBInspectable var borderColor: UIColor = .clear {
           didSet {
               layer.borderColor = borderColor.cgColor
           }
       }

       @IBInspectable var borderWidth: CGFloat = 0.0 {
           didSet {
               layer.borderWidth = borderWidth
           }
       }
    
    
    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {

            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }

    @IBInspectable var adjustsFontSizeToFitWidth: Bool {
        get {
            return titleLabel!.adjustsFontSizeToFitWidth
        }
        set {
            titleLabel!.adjustsFontSizeToFitWidth = newValue
            titleLabel!.lineBreakMode = .byTruncatingTail
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.masksToBounds = false
    }

}
//MARK:- for Image
@IBDesignable
class StylishUIImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var circleView: Bool = false {
        didSet {
            if circleView{
                layer.cornerRadius = self.frame.width / 2
                cornerRadius = layer.cornerRadius
            } else {
                layer.cornerRadius = 0.0
                cornerRadius = layer.cornerRadius
            }
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }


    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {

            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //      layer.masksToBounds = true
    }

}
//MARK:- for Label
@IBDesignable
class StylishUILabel: UILabel {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var circleView: Bool = false {
        didSet {
            if circleView{
                layer.cornerRadius = self.frame.width / 2
                cornerRadius = layer.cornerRadius
            } else {
                layer.cornerRadius = 0.0
                cornerRadius = layer.cornerRadius
            }
        }
    }



    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }


    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {

            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColorLabel: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColorLabel.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffsetLabel: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffsetLabel
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //       layer.masksToBounds = true
    }

}

//MARK:- for textfield
@IBDesignable
class StylishUITextField: UITextField {


    @IBInspectable var inset: CGFloat = 8

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    @IBInspectable var placeHolderColor: UIColor? {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor!])
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {

            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //    layer.masksToBounds = true
    }

}
//MARK:- for TextView
@IBDesignable
class StylishUITextView: UITextView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }


    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = -1.0 {
        didSet {

            //layer.masksToBounds = false
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable var shadowColor: UIColor = .clear {
        didSet{
            //layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet{
            //layer.masksToBounds = false
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
        didSet {
            //layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //   layer.masksToBounds = true
    }

}

@IBDesignable
class ViewShadow: UIView {

    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.1

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = 2
        layer.shadowPath = shadowPath.cgPath
    }
}
