//
//  UIColor.swift
//  ExtensionKit
//
//  Created by DeShawn Jackson on 7/5/16.
//  Copyright © 2016 Piive. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    public func rgb() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = fRed * 255.0
            let iGreen = fGreen * 255.0
            let iBlue = fBlue * 255.0
            let iAlpha = fAlpha * 255.0
            
            return (red: iRed, green: iGreen, blue: iBlue, alpha: iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}

extension UIColor {
    
    // MARK: - UI Items -
    
    public class var borderGray: UIColor { return .lightGray }
    public class var disabledGray: UIColor { return .gray }
    public class var systemBlue: UIColor { return rgb(99,169,225) }
    public class var switchGreen: UIColor { return rgb(90,220,97) }
    public class var toolbarGray: UIColor { return rgb(247,247,247) }
    public class var backgroundGray: UIColor { return rgb(242,242,242) }
    public class var placeholder: UIColor { return rgb(199,199,205) }
    
    // MARK: - Pastels -
    
    public class var pastelRed: UIColor { return rgb(233,139,146) }
    public class var pastelOrange: UIColor { return rgb(245,195,123) }
    public class var pastelYellow: UIColor { return rgb(255,247,142) }
    public class var pastelGreen: UIColor { return rgb(203,223,140) }
    public class var pastelBlue: UIColor { return rgb(181,205,227) }
    public class var pastelPurple: UIColor { return rgb(187,128,178) }
    public class var pastelPink: UIColor { return rgb(245,214,230) }
    
    // MARK: - Custom -
    
    public class var lightBlue: UIColor { return rgb(226,231,236) }
    public class var darkTeal: UIColor { return rgb(0,52,52) } //return rgb(54,72,82)
    public class var darkRed: UIColor { return rgb(167,41,42) }
    public class var darkGreen: UIColor { return rgb(48,104,1) }
    public class var darkBlueGray: UIColor { return rgb(154,167,181) }
    // public class var limeGreen: UIColor { return rgb(92,182,90) } //seaGreen: UIColor { return rgb(92,182,90) }
    
    // MARK: - 140 Web Colors -
    
    // http://www.w3schools.com/colors/color_tryit.asp?hex=808080
    // http://www.w3schools.com/colors/colors_names.asp
    
    public class var aliceBlue: UIColor { return rgb(240,248,255) }
    public class var antiqueWhite: UIColor { return rgb(250,235,215) }
    public class var aqua: UIColor { return rgb(0,255,255) }
    public class var aquamarine: UIColor { return rgb(127,255,212) }
    public class var azure: UIColor { return rgb(240,255,255) }
    public class var beige: UIColor { return rgb(245,245,220) }
    public class var bisque: UIColor { return rgb(255,228,196) }
    //public class var black: UIColor { return rgb(0,0,0) }
    public class var blanchedAlmond: UIColor { return rgb(255,235,205) }
    //public class var blue: UIColor { return rgb(0,0,255) }
    public class var blueViolet: UIColor { return rgb(138,43,226) }
    //public class var brown: UIColor { return rgb(165,42,42) }
    public class var burlyWood: UIColor { return rgb(222,184,135) }
    public class var cadetBlue: UIColor { return rgb(95,158,160) }
    public class var chartreuse: UIColor { return rgb(127,255,0) }
    public class var chocolate: UIColor { return rgb(210,105,30) }
    public class var coral: UIColor { return rgb(255,127,80) }
    public class var cornflowerBlue: UIColor { return rgb(100,149,237) }
    public class var cornsilk: UIColor { return rgb(255,248,220) }
    public class var crimson: UIColor { return rgb(220,20,60) } /// Red
    //public class var cyan: UIColor { return aqua }
    public class var darkBlue: UIColor { return rgb(0,0,139) }
    public class var darkCyan: UIColor { return rgb(0,139,139) }
    public class var darkGoldenRod: UIColor { return rgb(184,134,11) }
    // public class var darkGray: UIColor { return rgb(169,169,169) }
    //public class var darkGrey: UIColor { return rgb(169,169,169) }
    public class var darkGreenII: UIColor { return rgb(0,100,0) }
    public class var darkKhaki: UIColor { return rgb(189,183,107) }
    public class var darkMagenta: UIColor { return rgb(139,0,139) }
    public class var darkOliveGreen: UIColor { return rgb(85,107,47) }
    public class var darkOrange: UIColor { return rgb(255,140,0) }
    public class var darkOrchid: UIColor { return rgb(153,50,204) }
    public class var darkRedII: UIColor { return rgb(139,0,0) }
    public class var darkSalmon: UIColor { return rgb(233,150,122) }
    public class var darkSeaGreen: UIColor { return rgb(143,188,143) }
    public class var darkSlateBlue: UIColor { return rgb(72,61,139) }
    public class var darkSlateGray: UIColor { return rgb(47,79,79) }
    public class var darkSlateGrey: UIColor { return rgb(47,79,79) }
    public class var darkTurquoise: UIColor { return rgb(0,206,209) }
    public class var darkViolet: UIColor { return rgb(148,0,211) }
    public class var deepPink: UIColor { return rgb(255,20,147) }
    public class var deepSkyBlue: UIColor { return rgb(0,191,255) }
    public class var dimGray: UIColor { return rgb(105,105,105) }
    //public class var dimGrey: UIColor { return rgb(105,105,105) }
    public class var dodgerBlue: UIColor { return rgb(30,144,255) }
    public class var fireBrick: UIColor { return rgb(178,34,34) }
    public class var floralWhite: UIColor { return rgb(255,250,240) }
    public class var forestGreen: UIColor { return rgb(34,139,34) }
    public class var fuchsia: UIColor { return rgb(255,0,255) }
    public class var gainsboro: UIColor { return rgb(220,220,220) }
    public class var ghostWhite: UIColor { return rgb(248,248,255) }
    public class var gold: UIColor { return rgb(255,215,0) }
    public class var goldenRod: UIColor { return rgb(218,165,32) }
    //public class var gray: UIColor { return rgb(128,128,128) }
    //public class var grey: UIColor { return rgb(128,128,128) }
    //public class var green: UIColor { return rgb(0,128,0) }
    public class var greenYellow: UIColor { return rgb(173,255,47) }
    public class var honeyDew: UIColor { return rgb(240,255,240) }
    public class var hotPink: UIColor { return rgb(255,105,180) }
    public class var indianRed: UIColor { return rgb(205,92,92) }
    public class var indigo: UIColor { return rgb(75,0,130) }
    public class var ivory: UIColor { return rgb(255,255,240) }
    public class var khaki: UIColor { return rgb(240,230,140) }
    public class var lavender: UIColor { return rgb(230,230,250) }
    public class var lavenderBlush: UIColor { return rgb(255,240,245) }
    public class var lawnGreen: UIColor { return rgb(124,252,0) }
    public class var lemonChiffon: UIColor { return rgb(255,250,205) }
    public class var lightBlueII: UIColor { return rgb(173,216,230) }
    public class var lightCoral: UIColor { return rgb(240,128,128) }
    public class var lightCyan: UIColor { return rgb(224,255,255) }
    public class var lightGoldenRodYellow: UIColor { return rgb(250,250,210) }
    //public class var lightGray: UIColor { return rgb(211,211,211) }
    //public class var lightGrey: UIColor { return rgb(211,211,211) }
    public class var lightGreen: UIColor { return rgb(144,238,144) }
    public class var lightPink: UIColor { return rgb(255,182,193) }
    public class var lightSalmon: UIColor { return rgb(255,160,122) }
    public class var lightSeaGreen: UIColor { return rgb(32,178,170) }
    public class var lightSkyBlue: UIColor { return rgb(135,206,250) }
    public class var lightSlateGray: UIColor { return rgb(119,136,153) }
    public class var lightSlateGrey: UIColor { return rgb(119,136,153) }
    public class var lightSteelBlue: UIColor { return rgb(176,196,222) }
    public class var lightYellow: UIColor { return rgb(255,255,224) }
    public class var lime: UIColor { return rgb(0,255,0) }
    public class var limeGreen: UIColor { return rgb(50,205,50) }
    public class var linen: UIColor { return rgb(250,240,230) }
    //public class var magenta: UIColor { return rgb(255,0,255) }
    public class var maroon: UIColor { return rgb(128,0,0) }
    public class var mediumAquaMarine: UIColor { return rgb(102,205,170) }
    public class var mediumBlue: UIColor { return rgb(0,0,205) }
    public class var mediumOrchid: UIColor { return rgb(186,85,211) }
    public class var mediumPurple: UIColor { return rgb(147,112,219) }
    public class var mediumSeaGreen: UIColor { return rgb(60,179,113) }
    public class var mediumSlateBlue: UIColor { return rgb(123,104,238) }
    public class var mediumSpringGreen: UIColor { return rgb(0,250,154) }
    public class var mediumTurquoise: UIColor { return rgb(72,209,204) }
    public class var mediumVioletRed: UIColor { return rgb(199,21,133) }
    public class var midnightBlue: UIColor { return rgb(25,25,112) }
    public class var mintCream: UIColor { return rgb(245,255,250) }
    public class var mistyRose: UIColor { return rgb(255,228,225) }
    public class var moccasin: UIColor { return rgb(255,228,181) }
    public class var navajoWhite: UIColor { return rgb(255,222,173) }
    public class var navy: UIColor { return rgb(0,0,128) }
    public class var oldLace: UIColor { return rgb(253,245,230) }
    public class var olive: UIColor { return rgb(128,128,0) }
    public class var oliveDrab: UIColor { return rgb(107,142,35) }
    //public class var orange: UIColor { return rgb(255,165,0) }
    public class var orangeRed: UIColor { return rgb(255,69,0) }
    public class var orchid: UIColor { return rgb(218,112,214) }
    public class var paleGoldenRod: UIColor { return rgb(238,232,170) }
    public class var paleGreen: UIColor { return rgb(152,251,152) }
    public class var paleTurquoise: UIColor { return rgb(175,238,238) }
    public class var paleVioletRed: UIColor { return rgb(219,112,147) }
    public class var papayaWhip: UIColor { return rgb(255,239,213) }
    public class var peachPuff: UIColor { return rgb(255,218,185) }
    public class var peru: UIColor { return rgb(205,133,63) }
    public class var pink: UIColor { return rgb(255,192,203) }
    public class var plum: UIColor { return rgb(221,160,221) }
    public class var powderBlue: UIColor { return rgb(176,224,230) }
    //public class var purple: UIColor { return rgb(128,0,128) }
    public class var rebeccaPurple: UIColor { return rgb(102,51,153) }
    //public class var red: UIColor { return rgb(255,0,0) }
    public class var rosyBrown: UIColor { return rgb(188,143,143) }
    public class var royalBlue: UIColor { return rgb(65,105,225) }
    public class var saddleBrown: UIColor { return rgb(139,69,19) }
    public class var salmon: UIColor { return rgb(250,128,114) }
    public class var sandyBrown: UIColor { return rgb(244,164,96) }
    public class var seaGreen: UIColor { return rgb(46,139,87) }
    public class var seaShell: UIColor { return rgb(255,245,238) }
    public class var sienna: UIColor { return rgb(160,82,45) }
    public class var silver: UIColor { return rgb(192,192,192) }
    public class var skyBlue: UIColor { return rgb(135,206,235) }
    public class var slateBlue: UIColor { return rgb(106,90,205) }
    public class var slateGray: UIColor { return rgb(112,128,144) }
    public class var slateGrey: UIColor { return rgb(112,128,144) }
    public class var snow: UIColor { return rgb(255,250,250) }
    public class var springGreen: UIColor { return rgb(0,255,127) }
    public class var steelBlue: UIColor { return rgb(70,130,180) }
    public class var tan: UIColor { return rgb(210,180,140) }
    public class var teal: UIColor { return rgb(0,128,128) }
    public class var thistle: UIColor { return rgb(216,191,216) }
    public class var tomato: UIColor { return rgb(255,99,71) }
    public class var turquoise: UIColor { return rgb(64,224,208) }
    public class var violet: UIColor { return rgb(238,130,238) }
    public class var wheat: UIColor { return rgb(245,222,179) }
    //public class var white: UIColor { return rgb(255,255,255) }
    public class var whiteSmoke: UIColor { return rgb(245,245,245) }
    //public class var yellow: UIColor { return rgb(255,255,0) }
    public class var yellowGreen: UIColor { return rgb(154,205,50) }
    
    public class var colors: [UIColor] {
        return [
        UIColor.white,
        UIColor.mintCream,
        UIColor.azure,
        UIColor.honeyDew,
        UIColor.lightCyan,
        UIColor.aliceBlue,
        UIColor.whiteSmoke,
        UIColor.ghostWhite,
        UIColor.ivory,
        UIColor.snow,
        UIColor.floralWhite,
        UIColor.seaShell,
        UIColor.oldLace,
        UIColor.lavenderBlush,
        UIColor.linen,
        UIColor.antiqueWhite,
        UIColor.mistyRose,
        UIColor.pink,
        UIColor.lightPink,
        UIColor.hotPink,
        UIColor.deepPink,
        UIColor.paleVioletRed,
        UIColor.rosyBrown,
        UIColor.mediumVioletRed,
        UIColor.indianRed,
        UIColor.lightCoral,
        UIColor.lightSalmon,
        UIColor.salmon,
        UIColor.darkSalmon,
        UIColor.crimson,
        UIColor.cornsilk,
        UIColor.blanchedAlmond,
        UIColor.bisque,
        UIColor.navajoWhite,
        UIColor.wheat,
        UIColor.burlyWood,
        UIColor.tan,
        UIColor.darkKhaki,
        UIColor.goldenRod,
        UIColor.darkGoldenRod,
        UIColor.peru,
        UIColor.chocolate,
        UIColor.sienna,
        UIColor.brown,
        UIColor.fireBrick,
        UIColor.saddleBrown,
        UIColor.darkRed,
        UIColor.maroon,
        UIColor.sandyBrown,
        UIColor.coral,
        UIColor.tomato,
        UIColor.red,
        UIColor.orangeRed,
        UIColor.darkOrange,
        UIColor.orange,
        UIColor.gold,
        UIColor.yellow,
        UIColor.lightYellow,
        UIColor.lemonChiffon,
        UIColor.lightGoldenRodYellow,
        UIColor.beige,
        UIColor.papayaWhip,
        UIColor.moccasin,
        UIColor.peachPuff,
        UIColor.paleGoldenRod,
        UIColor.khaki,
        UIColor.lavender,
        UIColor.thistle,
        UIColor.plum,
        UIColor.fuchsia,
        UIColor.violet,
        UIColor.orchid,
        UIColor.mediumOrchid,
        UIColor.mediumPurple,
        UIColor.blueViolet,
        UIColor.darkViolet,
        UIColor.darkOrchid,
        UIColor.darkMagenta,
        UIColor.purple,
        UIColor.indigo,
        UIColor.darkSlateBlue,
        UIColor.slateBlue,
        UIColor.mediumSlateBlue,
        UIColor.paleGreen,
        UIColor.greenYellow,
        UIColor.chartreuse,
        UIColor.lawnGreen,
        UIColor.lime,
        UIColor.springGreen,
        UIColor.mediumSpringGreen,
        UIColor.lightGreen,
        UIColor.limeGreen,
        UIColor.mediumSeaGreen,
        UIColor.seaGreen,
        UIColor.forestGreen,
        UIColor.green,
        UIColor.darkGreen,
        UIColor.yellowGreen,
        UIColor.oliveDrab,
        UIColor.olive,
        UIColor.darkOliveGreen,
        UIColor.darkSeaGreen,
        UIColor.mediumAquaMarine,
        UIColor.lightSeaGreen,
        UIColor.darkCyan,
        UIColor.teal,
        UIColor.aqua,
        UIColor.aquamarine,
        UIColor.paleTurquoise,
        UIColor.turquoise,
        UIColor.mediumTurquoise,
        UIColor.darkTurquoise,
        UIColor.cadetBlue,
        UIColor.steelBlue,
        UIColor.lightSteelBlue,
        UIColor.powderBlue,
        UIColor.lightBlue,
        UIColor.skyBlue,
        UIColor.lightSkyBlue,
        UIColor.deepSkyBlue,
        UIColor.dodgerBlue,
        UIColor.cornflowerBlue,
        UIColor.royalBlue,
        UIColor.blue,
        UIColor.mediumBlue,
        UIColor.darkBlue,
        UIColor.navy,
        UIColor.midnightBlue,
        UIColor.gainsboro,
        UIColor.lightGray,
        UIColor.silver,
        UIColor.darkGray,
        UIColor.lightSlateGray,
        UIColor.slateGray,
        UIColor.gray,
        UIColor.dimGray,
        UIColor.darkSlateGray,
        UIColor.black
    ]}

}

extension UIColor {
    
    // https://stackoverflow.com/a/27203691/3739895
    
    public static func hex(_ hex: String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

    /*func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }*/

