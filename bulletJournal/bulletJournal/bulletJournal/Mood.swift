//
//  Mood.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

enum Mood: String {
    
    case angry
    case content
    case happy
    case excited
    case sad
    case depressed
    case nervous
    case productive
    case calm
    case indifferent
    
    var color: UIColor {
        
        switch self {
            
        case .angry:
            return #colorLiteral(red: 1, green: 0.4946183562, blue: 0.4877641797, alpha: 1)
            
        case .content:
            return #colorLiteral(red: 1, green: 0.7395557761, blue: 0.4782435894, alpha: 1)
            
        case .happy:
            return #colorLiteral(red: 1, green: 0.9826100469, blue: 0.4628928304, alpha: 1)
            
        case .excited:
            return #colorLiteral(red: 0.7553443313, green: 0.9702134728, blue: 0.6244162321, alpha: 1)
            
        case .sad:
            return #colorLiteral(red: 0.6464167833, green: 1, blue: 0.9786196351, alpha: 1)
            
        case .depressed:
            return #colorLiteral(red: 0.4947487116, green: 0.5115323067, blue: 1, alpha: 1)
            
        case .nervous:
            return #colorLiteral(red: 0.5797910094, green: 0.8275373578, blue: 0.8702875972, alpha: 1)
            
        case .productive:
            return #colorLiteral(red: 0.6454957128, green: 0.4759011865, blue: 0.8406335115, alpha: 1)
            
        case .calm:
            return #colorLiteral(red: 0.8433251977, green: 0.8082900643, blue: 0.9780240655, alpha: 1)
            
        case .indifferent:
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
        }
    }
    
    static func returnAllMoods() -> [Mood] {
        return [.angry, .content, .happy, .excited, .sad, .depressed, .nervous, .productive, .calm,
                .indifferent]
    }
    
}
