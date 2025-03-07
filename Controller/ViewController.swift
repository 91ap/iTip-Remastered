//
//  ViewController.swift
//  Tipzzz
//
//  Created by apat on 2/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    
    
    
    var calculateModel = CalculateModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
       
        
    }
    
    
    
    @IBAction func tipPercentagePressed(_ sender: UIButton) {
        
        if sender == zeroButton {
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false

        } else if sender == tenButton {
            tenButton.isSelected = true
            twentyButton.isSelected = false
            zeroButton.isSelected = false

        } else if sender == twentyButton {
            twentyButton.isSelected = true
            zeroButton.isSelected = false
            tenButton.isSelected = false
        }
    }
    
    
    
    @IBAction func stepperValuePressed(_ sender: UIStepper) {
        
        if sender.isSelected {
            let numberOfPeople = Int(sender.value) + 1
            splitNumberLabel.text = "\(numberOfPeople)"
            print(numberOfPeople)
        } else {
            let numberOfPeople = Int(sender.value) - 1
            splitNumberLabel.text = "\(numberOfPeople)"
            print(numberOfPeople)
        }
        
    }
    
    
    
    
    
    
    func getValue() -> String {
        
        zeroButton.setTitle("0.00", for: .normal)
        tenButton.setTitle("0.10", for: .normal)
        twentyButton.setTitle("0.20", for: .normal)
        
        if zeroButton.isSelected {
            
            print(zeroButton.titleLabel?.text ?? "0")
            return "0.00"
            
            
        } else if tenButton.isSelected {
        
            print(tenButton.titleLabel?.text ?? "0.10")
            return "0.10"
        } else if twentyButton.isSelected {

            print(twentyButton.titleLabel?.text ?? "0.20")
            return "0.20"
        }
        return UIButton().titleLabel?.text ?? "0"
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let people = splitNumberLabel.text ?? "1"
        let bill =  billTextField.text ?? "0"
       
        let zeroButtonValue = zeroButton.titleLabel?.text ?? "0"
        let tenButtonValue = tenButton.titleLabel?.text ?? "0.10"
        let twentyButtonValue = twentyButton.titleLabel?.text ?? "0.20"
        let zeroBV = Double(zeroButtonValue) ?? 0.0
        let tenBV = Double(tenButtonValue) ?? 0.0
        let twentyBV = Double(twentyButtonValue) ?? 0.0

        if zeroButton.isSelected {
            print(calculateModel
                .getTotalBill(
                    bill: Double(bill),
                    tip: zeroBV,
                    people: Int(people)
                ))
        } else if tenButton.isSelected {
            print(calculateModel
                .getTotalBill(
                    bill: Double(bill),
                    tip: tenBV,
                    people: Int(people)
                ))
        } else if twentyButton.isSelected {
            print(calculateModel
                .getTotalBill(
                    bill: Double(bill),
                    tip: twentyBV,
                    people: Int(people)
                ))
        }
        
        print("\(String(describing: UIButton().title(for: .selected)))")
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let people = splitNumberLabel.text ?? "1"
        let bill =  billTextField.text ?? "0"
        let billDouble = Double(bill) ?? 0
        let peopleInt = Int(people) ?? 1
        let tipChosen = getValue()
        let doubleTipChosen = Double(tipChosen) ?? 0
        let result = calculateModel.getTotalBill(
            bill: billDouble,
            tip: doubleTipChosen,
            people: peopleInt
        )
        let soloResult = calculateModel
            .individualAmount(
                bill: billDouble,
                tip: getValue() ,
                people: peopleInt
            )
            
        
        
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = result
            destinationVC.bill = soloResult
        }
    }
    
    
    

}

