//
//  ViewController.swift
//  SceneKitQuickStart
//
//  Created by HanGyo Jeong on 12/01/2019.
//  Copyright © 2019 HanGyoJeong. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController
{
    @IBOutlet weak var geometryLabel: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sceneSetUp()
        
        //Add Lighting
        sceneView.autoenablesDefaultLighting = true
        //add camera control
        sceneView.allowsCameraControl = true
    }
    
    //MARK: transition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        sceneView.stop(nil);
        sceneView.play(nil);
    }
    
    //MARK: IBAction
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        
    }
    
    //MARK: Scene
    func sceneSetUp(){
        let scene = SCNScene()
        
        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        let boxNode = SCNNode(geometry: boxGeometry)
        
        scene.rootNode.addChildNode(boxNode)
        
        sceneView.scene = scene
    }
}
