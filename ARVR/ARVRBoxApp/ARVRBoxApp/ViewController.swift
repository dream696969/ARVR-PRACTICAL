//
//  ViewController.swift
//  ARVRBoxApp
//
//  Created by SpiderMurphy on 24/02/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var arscnView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arscnView.delegate = self
        arscnView.autoenablesDefaultLighting = true
        arscnView.showsStatistics = true
        let scene = SCNScene()
        arscnView.scene = scene
        
        addBoxToScene()
    }
    
    private func addBoxToScene(){
        let box = SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.red
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0,0, -1)
        arscnView.scene.rootNode.addChildNode(boxNode)
        
        
    }


}

