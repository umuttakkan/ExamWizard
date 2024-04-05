//
//  DetailViewController.swift
//  ExamWizard
//
//  Created by Umut on 1.04.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    let questions = ["Aşağıdakilerden hangisi, organik maddelerde en çok rastlanan elementler içinde yer alır?", "Prokaryot DNA'sı hücrenin neresinde bulunur?", "Proteinlerin sentezlendikten sonra katlanıp üç boyutlu yapılarının kazandırılmasından sorumlu olan organel aşağıdakilerden hangisidir?", "Aşağıdakilerden hangisi hücre yapısına en fazla giren elementlerden biridir?","Aşağıdakilerden hangisi Domain Eucaria içerisinde yer almaz?"];
    let answers = [["Karbon", "Sodyum", "Potasyum"],["Protoplasma ile karışmış bir halde","Membrana bağlı halde","Mitokondrilerde"], ["Endoplazmik Retikulum","Golgi Kompleks","Ribozomlar"],["Karbon","Fosfor","Oksijen"],["Bakteriler","Bitkiler","Hayvanlar"]]
    
    var currentQuestion = 0;
    var score = 0;
    var rightAnswer:UInt32 = 0;
    
    var defaults = UserDefaults.standard;
    @IBOutlet weak var textview1: UITextView!
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnA.layer.cornerRadius = 10;
        btnB.layer.cornerRadius = 10;
        btnC.layer.cornerRadius = 10;
        
    }
    override func viewWillAppear(_ animated: Bool) {
          nextQuestion()
      }
    
    @IBAction func btn(_ sender: UIButton) {
               
               if sender.tag == Int(rightAnswer) {
                   
                   print("RIGHT!!")
                   score += 1
               }
               else {
                   print("WRONG!!!!!")
               }
               
               if currentQuestion != questions.count {
                   
                   nextQuestion()
                   
               }else {
                   defaults.set(String(score), forKey: "score")
                   defaults.synchronize()
                   self.dismiss(animated: true, completion: nil)
               }
               
    }
    func nextQuestion() {
            lbl1.text = "Soru \(currentQuestion + 1)"

           textview1.text = questions[currentQuestion]
           
           rightAnswer = arc4random_uniform(3) + 1
           
           var button = UIButton()
           var x = 1
           
           for i in 1...3 {
               
               button = view.viewWithTag(i) as! UIButton
               
               if i == Int(rightAnswer) {
                   
                   button.setTitle(answers[currentQuestion][0], for: .normal)
                   
               }else {
                   button.setTitle(answers[currentQuestion][x], for: .normal)
                   x = 2
               }
           }
           
           currentQuestion += 1
           
       }

}
//
