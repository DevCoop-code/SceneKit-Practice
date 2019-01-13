//
//  Molecules.swift
//  SceneKitQuickStart
//
//  Created by HanGyo Jeong on 12/01/2019.
//  Copyright © 2019 HanGyoJeong. All rights reserved.
//

import Foundation
import SceneKit

class Molecules{
    class func methaneMolecule() -> SCNNode{
        var methaneMolecule = SCNNode()
        
        nodeWithAtom(atom: Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0))
        
        nodeWithAtom(atom: Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(-4, 0, 0))
        nodeWithAtom(atom: Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(+4, 0, 0))
        nodeWithAtom(atom: Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, -4, 0))
        nodeWithAtom(atom: Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +4, 0))
        
        return methaneMolecule
    }
    
    class func ethanolMolecule() -> SCNNode{
        var ethanolMolecule = SCNNode()
        return ethanolMolecule
    }
    
    class func ptfeMolecule() -> SCNNode{
        var ptfeMolecule = SCNNode()
        return ptfeMolecule
    }
    
    class func nodeWithAtom(atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> Void{
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
    }
}
