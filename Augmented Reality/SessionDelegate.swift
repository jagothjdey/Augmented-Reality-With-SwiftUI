import ARKit
import SceneKit

final class SessionDelegate: NSObject, ARSCNViewDelegate {
    var arSCNView: ARSCNView!
    
    func set(arSCNView: ARSCNView) {
        self.arSCNView = arSCNView
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let anchorPlane = anchor as? ARPlaneAnchor else { return }
        print("Node added with -> \(anchorPlane.extent)")
    }
    
}
