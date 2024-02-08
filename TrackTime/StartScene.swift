//
//  StartScene.swift
//  TrackTime
//
//  Created by brady on 2/7/24.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    override func didMove(to view: SKView) {

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
