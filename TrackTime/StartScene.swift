//
//  StartScene.swift
//  TrackTime
//
//  Created by brady on 2/7/24.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var txtL : SKSpriteNode?

    override func didMove(to view: SKView) {
        self.txtL = (self.childNode(withName: "//txtL") as? SKSpriteNode)!
        
        //getting the text to fade in/out
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: 2.0)
        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 2.0)
        let fading = SKAction.sequence([fadeOut,fadeIn])
        txtL!.run(SKAction.repeat(fading, count: 50))
    

    }
    
    func showGameScene(){
        let GameScene = SKScene(fileNamed: "GameScene")
        GameScene?.scaleMode = .aspectFit
        view!.presentScene(GameScene!, transition: SKTransition.crossFade(withDuration: 2))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showGameScene()
    }
}

