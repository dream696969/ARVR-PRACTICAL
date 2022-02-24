//
//  ViewController.swift
//  WorldTrackingApp
//
//  Created by SpiderMurphy on 24/02/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var arscnView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    @IBAction func addButton(_ sender: Any) {
        
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node.position = SCNVector3(0,0,0)
        self.arscnView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        self.arscnView.session.pause()
        self.arscnView.scene.rootNode.enumerateChildNodes{ (node, _) in
            node.removeFromParentNode()
            
        }
        self.arscnView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arscnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.arscnView.session.run(configuration)
        
        // Do any additional setup after loading the view.
    }
    
}

