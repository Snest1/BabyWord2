//
//  ASMathViewController.swift
//  BabyWords2
//
//  Created by Admin on 24.01.2019.
//  Copyright © 2019 Developer Inspirus. All rights reserved.
//

import UIKit
import AVKit
import Foundation

class ASMathViewController: UIViewController {
    @IBOutlet weak var MathButton: UIButton!
    
    var size:Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MathButton.setTitle(String(Int.random(in: Int(pow(Double(10),Double(size-1)))..<Int(pow(Double(10),Double(size))))), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func HomeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func MoreButton(_ sender: UIButton) {
        if (size < 7) {
            size = size + 1
            MathButton.setTitle(String(Int.random(in: Int(pow(Double(10),Double(size-1)))..<Int(pow(Double(10),Double(size))))), for: .normal)
        }
    }
    
    @IBAction func LessButton(_ sender: UIButton) {
        if (size > 1) {
            size = size - 1
            MathButton.setTitle(String(Int.random(in: Int(pow(Double(10),Double(size-1)))..<Int(pow(Double(10),Double(size))))), for: .normal)
            
        }
    }
    
    @IBAction func MathButton(_ sender: UIButton) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: MathButton.currentTitle!.replacingOccurrences(of: " ", with: ""))
        utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
        synthesizer.speak(utterance)
        
    }
    
    @IBAction func RefreshButton(_ sender: UIButton) {
        MathButton.setTitle(String(Int.random(in: Int(pow(Double(10),Double(size-1)))..<Int(pow(Double(10),Double(size))))), for: .normal)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
