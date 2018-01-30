//
//  ShuffleExtensions.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/10/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import Foundation

class Global{
    let sharedDouble = DRDouble()
    var user:String?
    var currentBodyPart:String?
    var currentVariation:String?
    var lastClockTime:Int?
    var timer: Timer? 
    var newActivity = true
    var breakPassed = false
    var activityArray = ["Neck", "Pecs", "Traps", "Wrists", "Back", "Hips", "Hamstrings",  "Toes"]
    
    var sessionAdviceArray = [
        "Neck": "Improper placement of computer monitors as well as their stationary nature causes flexion of the spine, which leads to overstretched or tight neck muscles (flexors and extensors, respectively). This can lead to neck pain, discomfort, and increased susceptibility to neck injuries. \n\nTo address this, we want to strengthen the neck flexors and stretch the neck extensors.",
        "Pecs/Traps":"Excess forward leaning common in prolonged computer-based work commonly leads to tight chest and upper back muscles (pecs and traps, respectively). This can lead to upper back pain, discomfort, and increased susceptibility to injuries of related areas. \n\nTo address this, we want to stretch the pecs and traps.",
        "Wrists": "Common computer input devices such as keyboards and mice cause wrist muscle overuse (extensors and flexors, specifically). This can lead to hand pain, discomfort, and increased susceptibility to hand and wrist injuries. \n\nTo address this, we want to stretch the wrist flexors and wrist extensors.",
        "Hips/Hamstrings":"Sitting in a chair for prolonged periods of time leads to tight and weakened hip and hamstring muscles. This can lead to back and hip pain, discomfort, and increased susceptibility to hip and knee injuries. \n\nTo address this, we want to stretch the knee flexors and strengthen the hip abductors.",
        "Toes":"Long periods of stationarity lead to a lack of flexibility in important areas of the feet, causing gait and mobility issues. This can lead to foot pain, discomfort while walking, and increased susceptibility to injuries of related areas. \n\nTo address this problem, we want to stretch the joints of the feet."]
    
    var sessionAdvice:Dictionary<String, String> = [:]
    
    let holdoutAdvice = ["Back": "Sitting or reclining without proper posture cause anterior or posterior tilt of the pelvis due to weak abs and tight lower back muscles. This can lead to lower back pain, discomfort, and increased susceptibility to back injuries. \n\nTo address this, we want to engage your stabilizing abdominal muscles as well as stretch your lower back."]
    
    var seconds = 0
    var timeLimitInSeconds = 600
    var activityLog: [(Session: String, User: String, Advice: String, Activity: String, ActivityDuration: Int, SessionDuration: Int)] = []
   
    
    class var Variables: Global {
        struct Static {
            static let instance = Global()
        }
        return Static.instance
    }
    
    func clockTimeAsString() -> String{
        return "\(Int(Global.Variables.seconds/60)):\(String(format: "%02d", Global.Variables.seconds%60))" //This will update the label.
    }
    
    func getLyingOrSitting(activity: String) -> String{
        var version:String?
        switch activity {
        case "Toes":
            version = "Sitting"
        case "Hips":
            version = "Sitting"
        default:
            version = "Lying"
        }
        return version!
    }
    
    
    
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

extension Dictionary {
    func randomItem() -> Dictionary? {
        if isEmpty { return nil }
        let index: Int = Int(arc4random_uniform(UInt32(self.count)))
        let randomVal = Array(self.values)[index] // 123 or 234 or 345
        let valKey = Array(self.keys)[index]//"key"
        return [valKey: randomVal]
    }
}

import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

