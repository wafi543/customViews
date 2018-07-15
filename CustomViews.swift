//
//  Core.swift
//  MyLectures
//
//  Created by Wafi Alshammari on 7/7/2018
//  Copyright © 2018 Wafi Alshammari. All rights reserved.
//

import Foundation
import UIKit

public class ConfigureButton {
    let cornerRadius : CGFloat = 0
    let radiusType : Int = 2
    let Gradient: Bool = true
    let Color1: UIColor = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    let Color2: UIColor = UIColor(red: 72.0 / 255.0, green: 106.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
    let LocationX : Double = 2.0
    let LocationY : Double = 8.0
    let Direction : Int = 2
    let ColorTemplate : Int = 2
}

class Colors {
    var gl1 : CAGradientLayer!
    let color1 = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    let color2 = UIColor(red: 72.0 / 255.0, green: 106.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
    let template1_1 = UIColor(red: 137.0 / 255.0, green: 153.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    let template1_2 = UIColor(red: 76.0 / 255.0, green: 139.0 / 255.0, blue: 198.0 / 255.0, alpha: 1.0)
    let template2_1 = UIColor(red: 80.0 / 255.0, green: 55.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0) // purple
    let template2_2 = UIColor(red: 10 / 255.0, green: 95 / 255.0, blue: 255 / 255.0, alpha: 1.0) // blue
    let template3_1 = UIColor(red: 16.0/255.0, green: 12.0/255.0, blue: 54.0/255.0, alpha: 1.0)
    let template3_2 = UIColor(red: 57.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, alpha: 1.0)
    
    init() {
        self.gl1 = CAGradientLayer()
        self.gl1.colors = [color1.cgColor, color2.cgColor]
        self.gl1.locations = [0.0, 1.0]
    }
    
    func template (number: Int) -> [UIColor] {
        switch number {
        case 1:
            return [template1_1,template1_2]
        case 2:
            return [template2_1,template2_2]
        default:
            return [color1,color2]
        }
    }
}

@IBDesignable class GradientView: UIView {
    let colors = Colors()
    @IBInspectable var Color1: UIColor = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    @IBInspectable var Color2: UIColor = UIColor(red: 72.0 / 255.0, green: 106.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
    @IBInspectable var LocationX : Double = 0.0
    @IBInspectable var LocationY : Double = 1.0
    @IBInspectable var Direction : Int = 0
    @IBInspectable var ViewRadius : Int = 0 {
        didSet {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = CGFloat(ViewRadius)
        }
    }
    @IBInspectable var ColorTemplate : Int = 0 {
        didSet {
            let gradient = colors.template(number: ColorTemplate)
            Color1 = gradient[0]
            Color2 = gradient[1]
            layoutSubviews()
        }
    }
    
    func setAngle (angle : Double) {
        let x: Double! = angle / 360.0
        let a = pow(sinf(Float(2.0*Double.pi*((x+0.75)/2.0))),2.0)
        let b = pow(sinf(Float(2*Double.pi*((x+0.0)/2))),2)
        let c = pow(sinf(Float(2*Double.pi*((x+0.25)/2))),2)
        let d = pow(sinf(Float(2*Double.pi*((x+0.5)/2))),2)
        (layer as! CAGradientLayer).startPoint = CGPoint(x: CGFloat(a), y: CGFloat(b))
        (layer as! CAGradientLayer).endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [Color1.cgColor, Color2.cgColor]
        (layer as! CAGradientLayer).locations = [LocationX/10, LocationY/10] as [NSNumber]
//        (layer as! CAGradientLayer).endPoint = Vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0) // Vertical is Boolean
        
        switch Direction {
        case 1:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.0, y: 0.5)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 1.0, y: 0.5)
        case 2:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 1.0, y: 0.5)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.0, y: 0.5)
        case 3:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.5, y: 0.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.5, y: 1.0)
        case 4:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.5, y: 1.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.5, y: 0.0)
        case 5:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.0, y: 0.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 1.0, y: 1.0)
        case 6:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 1.0, y: 0.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.0, y: 1.0)
        case 7:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.0, y: 1.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 1.0, y: 0.0)
        default:
            (layer as! CAGradientLayer).startPoint = CGPoint(x: 1.0, y: 1.0)
            (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.0, y: 0.0)
        }
    }
}

@IBDesignable class ThreeColorsGradientView: UIView {
    @IBInspectable var FirstColor: UIColor = UIColor.red
    @IBInspectable var SecondColor: UIColor = UIColor.green
    @IBInspectable var ThirdColor: UIColor = UIColor.blue
    @IBInspectable var Vertical: Bool = true { didSet { updateGradientDirection() }}
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor, ThirdColor.cgColor]
        layer.startPoint = CGPoint.zero
        return layer }()
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder); applyGradient() }
    override init(frame: CGRect) { super.init(frame: frame);    applyGradient() }
    override func prepareForInterfaceBuilder() { super.prepareForInterfaceBuilder(); applyGradient() }
    override func layoutSubviews() { super.layoutSubviews(); updateGradientFrame() }
    func applyGradient() { updateGradientDirection(); layer.sublayers = [gradientLayer] }
    func updateGradientFrame() { gradientLayer.frame = bounds }
    func updateGradientDirection() { gradientLayer.endPoint = Vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0) }
}

@IBDesignable class RadialGradientView: UIView {
    @IBInspectable var outsideColor: UIColor = UIColor.red
    @IBInspectable var insideColor: UIColor = UIColor.green
    override func awakeFromNib() { super.awakeFromNib(); applyGradient() }
    
    func applyGradient() {
        let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
        let endRadius = sqrt(pow(frame.width/2, 2) + pow(frame.height/2, 2))
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        #if TARGET_INTERFACE_BUILDER
        applyGradient()
        #endif
    }
}

@IBDesignable class CustomLabel: UILabel {
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder); sharedInit() }
    override init(frame: CGRect) { super.init(frame: frame); sharedInit() }
    override func prepareForInterfaceBuilder() { sharedInit() }
    
    func sharedInit() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
}

@IBDesignable class CustomTextView: UITextView {
    @IBInspectable var cornerRadius : CGFloat = 0 { didSet { sharedInit() }}
    @IBInspectable var borderWidth : CGFloat = 0 { didSet { sharedInit() }}
    @IBInspectable var borderColor: UIColor = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0) { didSet { sharedInit() }}
    
    func sharedInit() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
}

@IBDesignable class CustomImage: UIImageView {
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor(red: 34.0 / 255.0, green: 217.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder); sharedInit() }
    override init(frame: CGRect) { super.init(frame: frame); sharedInit() }
    override func prepareForInterfaceBuilder() { sharedInit() }
    
    func sharedInit() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
}

@IBDesignable class CustomButton: UIButton {
    let colors = Colors()
    @IBInspectable var cornerRadius : CGFloat = ConfigureButton().cornerRadius
    @IBInspectable var radiusType : Int  = ConfigureButton().radiusType
    @IBInspectable var Gradient: Bool = ConfigureButton().Gradient
    @IBInspectable var Color1: UIColor = Colors().template2_1
    @IBInspectable var Color2: UIColor = Colors().template2_2
    @IBInspectable var LocationX : Double = ConfigureButton().LocationX
    @IBInspectable var LocationY : Double = ConfigureButton().LocationY
    @IBInspectable var Direction : Int = ConfigureButton().Direction
    @IBInspectable var ColorTemplate : Int = ConfigureButton().ColorTemplate {
        didSet {
            let gradient = colors.template(number: ColorTemplate)
            Color1 = gradient[0]
            Color2 = gradient[1]
            setGradientLayer()
        }
    }
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); sharedInit()}
    override init(frame: CGRect) { super.init(frame: frame); sharedInit()}
    override func prepareForInterfaceBuilder() {sharedInit()}
    
    override var isHighlighted: Bool {
        didSet {
            let touched = CALayer()
            touched.frame = bounds
            touched.backgroundColor = UIColor.black.cgColor
            touched.opacity = 0.3
            if isHighlighted {
                if layer.sublayers?.last?.backgroundColor != UIColor.black.cgColor {
                    layer.addSublayer(touched)
                }
            }else {
                if layer.sublayers?.last?.backgroundColor == UIColor.black.cgColor {
                    layer.sublayers?.removeLast()
                }
            }
        }
    }
    
    func sharedInit() {
        clipsToBounds = true
        switch radiusType {
        case 1: // Round 20%
            cornerRadius = 0
            layer.cornerRadius = frame.size.height / 5
        case 2: // Round 50%
            cornerRadius = 0
            layer.cornerRadius = frame.size.height / 2
        case 3: // Circle 100%
            cornerRadius = 0
            frame = CGRect(origin: frame.origin, size: CGSize(width: frame.height, height: frame.height))
            layer.cornerRadius = frame.height / 2
        default:
            layer.cornerRadius = cornerRadius
        }
        setGradientLayer()
    }
    
    func setGradientLayer() {
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [Color1.cgColor, Color2.cgColor]
        gradient.locations = [LocationX/10, LocationY/10] as [NSNumber]
        
        switch Direction {
        case 1:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case 2:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case 3:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case 4:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        case 5:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case 6:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        case 7:
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        default:
            gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        }
        if Gradient {
            layer.insertSublayer(gradient, at: 1)
        }
    }
}

