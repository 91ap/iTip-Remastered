//
//  CalculateModel.swift
//  Tipzzz
//
//  Created by apat on 3/4/25.
//

import UIKit

struct CalculateModel {
    
    var splitBill: SplitBillModel?
    
    mutating func individualAmount(bill: Double?, tip: String?, people: Int?) -> String{
        let tipDouble = Double(tip ?? "0") ?? 0.0
        let bill = bill ?? 0.0
        let people = people ?? 0
        
        let billAndTip = bill * tipDouble
        let billTotal = billAndTip + bill
        let individualAmount = billTotal / Double(people)
        
        return String(format: "%.2f", individualAmount)
    }
    
    mutating func getTotalBill(bill: Double?, tip: Double, people: Int?) -> String{
        
        let bill = bill ?? 0.0
        let people = people ?? 0
        let billAndTip = bill * tip
        let billTotal = billAndTip + bill
        
        return "Split between \(people) people, with \(String(format: "%.2f", tip))% tip for a grand total of $ \(String(format: "%.2f", billTotal))"
    }
    
    
}
