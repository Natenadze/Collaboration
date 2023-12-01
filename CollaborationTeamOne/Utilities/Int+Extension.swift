//
//  Int+Extension.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 01.12.23.
//

import Foundation

extension Int {
    
    func formatNumber() -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedNumber
        }
        
        return "0"
    }
}
