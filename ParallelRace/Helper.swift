//
//  Helper.swift
//  ParallelRace
//
//  Created by Eren Limon on 8/9/18.
//  Copyright © 2018 Eren Limon. All rights reserved.
//

import Foundation
import UIKit

class Helper : NSObject {
    
    func randomBetweenTwoNumbers(firstNumber : CGFloat ,  secondNumber : CGFloat) -> CGFloat{
        return CGFloat(arc4random())/CGFloat(UINT32_MAX) * abs(firstNumber - secondNumber) + min(firstNumber, secondNumber)
    }
    
    
    
}
