import UIKit
import QuartzCore

class GradientProgressView: UIView {
    var maskLayer: CALayer!
    var colors = [CGColor]()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 1.0)
        
        fillColors()
        
        gradientLayer.colors = colors
        
        maskLayer = CALayer()
        maskLayer.frame = self.bounds
        maskLayer.backgroundColor = UIColor.blackColor().CGColor
        gradientLayer.mask = maskLayer
    }
    
    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        print("layoutSubviews")
        var maskRect = maskLayer.frame
        maskRect.size.width = CGRectGetWidth(self.bounds)
        maskLayer.frame = maskRect
    }
    
    func performAnimation() {
        print("performAnimation")
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 1.0)

        var next = (gradientLayer.colors as! [CGColor]).map { $0 }
        
        let last = next.last!
        next.insert(last, atIndex: 0)
        next.removeLast()

        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.fromValue = gradientLayer.colors
        gradientAnimation.toValue = next
        gradientAnimation.duration = 3
        gradientAnimation.removedOnCompletion = true
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        gradientAnimation.delegate = self
        
        // reset gradientLayerColors
        gradientLayer.colors = next
        
        gradientLayer.addAnimation(gradientAnimation, forKey: "gradientAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        performAnimation()
    }
    
    func fillColors() {
        colors.append(ProjectColorsString.Android.color.CGColor)
        colors.append(ProjectColorsString.Business.color.CGColor)
        colors.append(ProjectColorsString.CSS.color.CGColor)
        colors.append(ProjectColorsString.Design.color.CGColor)
        colors.append(ProjectColorsString.HTML.color.CGColor)
        colors.append(ProjectColorsString.iOS.color.CGColor)
        colors.append(ProjectColorsString.PHP.color.CGColor)
        colors.append(ProjectColorsString.Python.color.CGColor)
        colors.append(ProjectColorsString.Ruby.color.CGColor)
        colors.append(ProjectColorsString.WordPress.color.CGColor)
        colors.append(ProjectColorsString.Undefined.color.CGColor)
        
        
//        for var hue:Double = 0; hue <= 120; hue += 5 {
//            
//            let color = UIColor(hue: CGFloat(hue / 120.0),
//                saturation:1.0,
//                brightness:1.0,
//                alpha:1.0)
//            
//            colors.append(color.CGColor)
//        }
    }
}