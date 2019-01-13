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
    
    //Geometry
    var geometryNode: SCNNode = SCNNode()
    
    //Gestures
    var currentAngle: Float = 0.0
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sceneSetUp()
        
        //Add Lighting
        //sceneView.autoenablesDefaultLighting = true
        //add camera control
        //sceneView.allowsCameraControl = true
        
        geometryLabel.text = "Atoms\n"
        geometryNode = Atoms.allAtoms()
        sceneView.scene!.rootNode.addChildNode(geometryNode)
    }
    
    //MARK: transition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        sceneView.stop(nil);
        sceneView.play(nil);
    }
    
    //MARK: IBAction
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        geometryNode.removeFromParentNode()
        currentAngle = 0
        
        switch sender.selectedSegmentIndex{
        case 0:
            geometryLabel.text = "Atoms\n"
            geometryNode = Atoms.allAtoms()
        case 1:
            geometryLabel.text = "Methane\n"
            geometryNode = Molecules.methaneMolecule()
        case 2:
            geometryLabel.text = "Ethanol"
        case 3:
            geometryLabel.text = "Polytetrafluoroethylene"
        default:
            break
        }
        
        sceneView.scene!.rootNode.addChildNode(geometryNode)
    }
    
    //MARK: Scene
    func sceneSetUp(){
        let scene = SCNScene()
        
//        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
//        let boxNode = SCNNode(geometry: boxGeometry)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        
//        scene.rootNode.addChildNode(boxNode)
        scene.rootNode.addChildNode(ambientLightNode)
        scene.rootNode.addChildNode(omniLightNode)
        scene.rootNode.addChildNode(cameraNode)
        
        sceneView.scene = scene
        
//        geometryNode = boxNode
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
        sceneView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(Double.pi)/180.0
        newAngle += currentAngle
        
        geometryNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizer.State.ended){
            currentAngle = newAngle
        }
    }
}
