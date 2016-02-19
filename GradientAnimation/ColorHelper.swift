import UIKit

enum ProjectColorsHex : UInt32 {
    case HTML = 0x39add1ff
    case CSS = 0x3079abff
    case JavaScript = 0xc25975ff
    case Ruby = 0xe15258ff
    case Business = 0xf9845bff
    case WordPress = 0x838cc7ff
    case PHP = 0x7d669eff
    case iOS = 0x53bbb4ff
    case Android = 0x51b46dff
    case Design = 0xe0ab18ff
    case Python = 0xf092b0ff
    case Undefined = 0xb7c0c7
}

enum ProjectColorsString : String {
    case HTML = "39add1ff"
    case CSS = "3079abff"
    case JavaScript = "c25975ff"
    case Ruby = "e15258ff"
    case Business = "f9845bff"
    case WordPress = "838cc7ff"
    case PHP = "7d669eff"
    case iOS = "53bbb4ff"
    case Android = "51b46dff"
    case Design = "e0ab18ff"
    case Python = "f092b0ff"
    case Undefined = "b7c0c7"
}

extension UIColor {
    convenience init(named name: ProjectColorsHex) {
        let rgba = name.rawValue.toRGBA
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha)
    }
    
    convenience init(named name: ProjectColorsString) {
        self.init(named: ProjectColorsHex(rawValue: name.rawValue.toUInt32)!)
    }
}

extension ProjectColorsHex {
    var color : UIColor {
        return UIColor(named: self)
    }
}

extension ProjectColorsString {
    var color : UIColor {
        return UIColor(named: self)
    }
}

extension String {
    var toUInt32 : UInt32 { return UInt32(self, radix: 16)! }
}

extension UInt32 {
    var toRGBA : (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        get {
            let red   = CGFloat((self >> 24) & 0xff) / 255.0
            let green = CGFloat((self >> 16) & 0xff) / 255.0
            let blue  = CGFloat((self >>  8) & 0xff) / 255.0
            let alpha = CGFloat((self      ) & 0xff) / 255.0
            
            return (red, green, blue, alpha)
        }
    }
}
