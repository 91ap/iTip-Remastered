//
//  ResultsViewController.swift
//  Tipzzz
//
//  Created by apat on 3/4/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var totalEachLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var numberOfPeople = 0
    var bill = "0.0"
    var tip = 0.0
    var total = "$0.00"
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        messageLabel.text = "Split between \(numberOfPeople) people, with 20% tip for a grand total of $ \(String(format: "%.2f", bill)), each person pays: $\(String(format: "%.2f",total))"
        totalEachLabel.text = "$\(bill) "
        messageLabel.text = total
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
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
