//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Rohat Karakuyu on 25.09.2019.
//  Copyright © 2019 RohatKarakuyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let firstView = UIView()
    private let secondView = UIView()
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        //Question 2
//
//        firstView.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
//        firstView.backgroundColor = UIColor.blue
//        self.view.addSubview(firstView)
//
//
//        //Question 3
//        
//        secondView.frame = CGRect(x: 50, y:50, width:75, height:75)
//        secondView.backgroundColor = UIColor.green
//        self.view.addSubview(secondView)
//
//        //Question 4
//
//        secondView.removeFromSuperview()
//        firstView.addSubview(secondView)
        
    }
    
    //By doing this, the place varies as the top texfield content varies
    @IBAction func fieldEditingDidChange(_ sender: Any) {
        
        //The below is the answers of formatter questions 8 and 9
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        if var fahrenheitString = fahrenheitLabel.text {
            
            //By putting comma prohibits changing to Int
            fahrenheitString = fahrenheitString.replacingOccurrences(of: ",", with: "")
            
            if let fahrenheitValue = nf.number(from: fahrenheitString)?.intValue{
                let celciusResult = ((fahrenheitValue-32)*5)/9;
                celsiusLabel.text = nf.string(from: NSNumber(value:celciusResult));
                fahrenheitLabel.text = nf.string(from: NSNumber(value: fahrenheitValue))
            }
            
        }else{
            
            //I entered default values so that I am able to prevent optionals mistakes
            
            celsiusLabel.text = "10"
            fahrenheitLabel.text = "50"
        }
    }
    
    //I joined tapgesturecognizer to the storyboard,then I attached them to IBActions
    
    @IBAction func tappedOnView(_ sender: Any) {
        self.view.endEditing(true);
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = fahrenheitLabel.text

        if currentText != "" {
            let stringRange = Range(range, in: currentText!)
            let updatedText = currentText!.replacingCharacters(in: stringRange!, with: string)
            
            //Why 7. Thats why I am not willing ti pass through millions and 2nd comma.Because of 9th question.
            return updatedText.count <= 7
        }
        
        return true
    }
    
}
