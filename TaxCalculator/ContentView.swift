//
//  ContentView.swift
//  TaxCalculator
//
//  Created by Mati Shirzad on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var amount = ""
    
    var dAmount:Int{
        return Int(amount) ?? 0
    }
    
    var finalTax:Int{
        var tax = 0
        
        if dAmount >= 1 && dAmount <= 5000 {
            tax = 0
        } else if dAmount >= 5001 && dAmount <= 12500{
            let temp = dAmount - 5000
            tax = (temp/100) * 2
        } else if dAmount >= 12501 && dAmount <= 100000 {
            let temp = dAmount - 12500
            tax = ((temp/100) * 10) + 150
        } else if dAmount >= 100001 {
            let temp = dAmount - 100000
            tax = (temp/100) * 20 + 8750 + 150
        }
        
        return tax
    }
    
    var finalSalary:Int{
        return dAmount - finalTax
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("AFG TAX CALCULATOR")
                            .bold()
                ){
                    TextField("Enter Monthly Salary in AFN", text:$amount)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("RESULT"), footer: Text("""
                Note:
                1-5000: No Tax
                5001-12500: 2% Tax
                12501-100000: 10% Tax
                >100000: 20% Tax
                """)){
                    Text("Total Tax:    \(finalTax) afn.")
                    Text("Total Salary after Tax:   \(finalSalary) afn.")
                }
            }
        }.navigationBarTitle(Text("AFG TAX CALCULATOR"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
