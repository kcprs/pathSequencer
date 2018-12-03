//
//  PathPointNode.swift
//  pathSequencer
//
//  Created by Kacper Sagnowski on 11/15/18.
//  Copyright © 2018 Kacper Sagnowski. All rights reserved.
//

import SpriteKit

class PathPointNode: NodeOnSequencerPath {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(parentPath: SequencerPath) {
        super.init(parentPath: parentPath)
        visibleNode = SKShapeNode(circleOfRadius: 30)
        
        self.zPosition = 2
    }
    
    deinit {
        print("PathPointNode deinit done")
    }
    
    override func touchDown(at pos: CGPoint) {
        parentPath.saveProgress(node: self)
    }
    
    override func touchMoved(to pos: CGPoint) {
        self.position = pos
        parentPath.updateAfterNodeMoved(node: self)
    }
    
    override func touchUp(at pos: CGPoint) {
        parentPath.cursor.resumeMovement()
    }
    
    override func doubleTap(at pos: CGPoint) {
        parentPath.removePoint(self)
    }
}