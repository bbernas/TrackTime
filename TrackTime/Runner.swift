//
//  character.swift
//  TrackTime
//
//  Created by brady on 2/15/24.
//

import SpriteKit
import GameplayKit

class Runner: SKSpriteNode {
    
    var stamina = 0 //trained
    var energy = 0 //sleeping variable
    
    init(stamina: Int = 0, energy: Int = 0) {
        self.stamina = stamina
        self.energy = energy
        let texture = SKTexture(imageNamed: "frame1")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getStam() -> Int{
        print(stamina)
        return(stamina)
    }
    
    func getEner() -> Int{
        print(energy)
        return(stamina)
    }
    
    
}
