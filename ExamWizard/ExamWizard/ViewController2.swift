//
//  ViewController2.swift
//  ExamWizard
//
//  Created by Umut on 1.04.2024.
//

import UIKit
class ViewController2: UIViewController {

    var name = ""
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblName.text = name;
        let score = UserDefaults.standard.string(forKey: "score") ?? "0"
        scoreLabel.text = "Skorunuz: \(score)"
    }
}
