//
//  DeatailedViewController.swift
//  App2OnApi
//
//  Created by Akshara Vangala on 11/07/22.
//

import UIKit
import Foundation

class DetailedViewController: UIViewController {
    
    static var identifier = "DetailedViewController"
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var betterCalledSoleAppearance: UILabel!
    @IBOutlet weak var potrayed: UILabel!
    @IBOutlet weak var appearance: UILabel!
    
    var pro = UIImage()
    var nm = ""
    var occup: [String] = []
    var btr: [Int] = []
    var port = ""
    var app: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sumOfOccupationText = occup.reduce(" ") { (result, a) -> String in
            return result + " " + String(a)
        }
        let btrr = btr.reduce("") { (result, a) -> String in
            return result + " " + String(a)
        }
        let appp = app.reduce("") { (result, a) -> String in
            return result + " " + String(a)
        }
        profile.image = pro
        nameL.text = "Name: \(nm)"
        occupation.text = "Occupation : \(sumOfOccupationText)"
        appearance.text = "Appearence: \(appp)"
        potrayed.text = "Portrayed: \(port)"
        betterCalledSoleAppearance.text = "Better Called Sole Appearance: \(btrr)"
    }
}
