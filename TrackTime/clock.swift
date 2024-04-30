//
//  clock.swift
//  TrackTime
//
//  Created by brady on 4/17/24.
//

import SpriteKit
import GameplayKit

class clock{
    
    public var days: Int
    public var hours: Int
    
    init(days: Int = 0, hours: Int = 0) {
        self.days = days
        self.hours = hours
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getHours() -> Int{
        return self.hours
    }
    
    func getDays() -> Int{
        return self.days
    }
    
    func checkHours(){
        if(self.hours >= 24){
            self.days += 1
            self.hours = self.hours - 24
        }
    }
    
    func addTime(number: Int){
        self.hours += number
        checkHours()
    }
}


