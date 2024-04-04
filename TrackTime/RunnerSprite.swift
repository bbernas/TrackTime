//
//  RunnerSprite.swift
//  TrackTime
//
//  Created by brady on 2/22/24.
//

import SpriteKit
import GameplayKit

class RunnerSprite{
    
    public var stamina: Int
    public var energy: Int
    
    init(stamina: Int = 0, energy: Int = 0) {
        self.stamina = stamina
        self.energy = energy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getEner() -> Int{
        return energy
    }
    func getStam() -> Int{
        return stamina
    }
    func setStam(number: Int){
         self.stamina = number
    }
    func setEner(number: Int){
        self.energy = number
    }
}
