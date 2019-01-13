//
//  Atoms.swift
//  SceneKitQuickStart
//
//  Created by HanGyo Jeong on 12/01/2019.
//  Copyright © 2019 HanGyoJeong. All rights reserved.
//

import Foundation
import SceneKit

class Atoms{
    class func carbonAtom() -> SCNGeometry{
        let carbonAtom = SCNSphere(radius: 1.70)
        
        //diffuse response to lighting
        carbonAtom.firstMaterial!.diffuse.contents = UIColor.darkGray
        
        //specular response to lighting
        carbonAtom.firstMaterial!.specular.contents = UIColor.white
        
        return carbonAtom
    }
    
    class func hydrogenAtom() -> SCNGeometry{
        let hydrogenAtom = SCNSphere(radius: 1.20)
        //diffuse response to lighting
        hydrogenAtom.firstMaterial!.diffuse.contents = UIColor.lightGray
        
        //specular response to lighting
        hydrogenAtom.firstMaterial!.specular.contents = UIColor.white
        
        return hydrogenAtom
    }
    
    class func oxygenAtom() -> SCNGeometry{
        let oxygenAtom = SCNSphere(radius: 1.52)
        //diffuse response to lighting
        oxygenAtom.firstMaterial!.diffuse.contents = UIColor.red
        
        //specular response to lighting
        oxygenAtom.firstMaterial!.specular.contents = UIColor.white
        
        return oxygenAtom
    }
    
    class func fluorineAtom() -> SCNGeometry{
        let fluorineAtom = SCNSphere(radius: 1.47)
        //diffuse response to lighting
        fluorineAtom.firstMaterial!.diffuse.contents = UIColor.yellow
        
        //specular response to lighting
        fluorineAtom.firstMaterial!.specular.contents = UIColor.white
        
        return fluorineAtom
    }
    
    class func allAtoms() -> SCNNode{
        let atomsNode = SCNNode()
        
        let carbonNode = SCNNode(geometry: carbonAtom())
        carbonNode.position = SCNVector3Make(-6, 0, 0)
        atomsNode.addChildNode(carbonNode)
        
        let hydrogenNode = SCNNode(geometry: hydrogenAtom())
        hydrogenNode.position = SCNVector3Make(-2, 0, 0)
        atomsNode.addChildNode(hydrogenNode)
        
        let oxygenNode = SCNNode(geometry: oxygenAtom())
        oxygenNode.position = SCNVector3Make(+2, 0, 0)
        atomsNode.addChildNode(oxygenNode)
        
        let fluorineNode = SCNNode(geometry: fluorineAtom())
        fluorineNode.position = SCNVector3Make(+6, 0, 0)
        atomsNode.addChildNode(fluorineNode)
        
        return atomsNode
    }
}
