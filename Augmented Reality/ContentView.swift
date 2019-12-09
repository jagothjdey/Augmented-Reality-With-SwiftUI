import ARKit
import SwiftUI
import RealityKit
import Combine

struct ContentView : View{
    var body : some View{
        ZStack{
            ScenekitView().edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Button(action:{
                        print("Decrese button tapped")
                    }){
                        Text("-")
                            .frame(width: 50, height: 50)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .offset(y: -20)
                            .padding(.all, 12)
                        
                    }
                    Spacer()
                    Button(action:{
                        print("Increased button tapped")
                    }){
                        Text("+")
                            .frame(width: 50, height: 50)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .offset(y: -20)
                            .padding(.all, 12)
                    }
                }
            }
        }
        
    }
}

let arSCNDelegate = SessionDelegate()

struct ScenekitView : UIViewRepresentable{
    func makeUIView(context: Context) -> SCNView {
        let arSCNView = ARSCNView()
        arSCNDelegate.set(arSCNView: arSCNView)
        arSCNView.session.delegate = arSCNDelegate as? ARSessionDelegate
        let configuration = ARWorldTrackingConfiguration()
        arSCNView.session.run(configuration)
        configuration.planeDetection = .horizontal
        arSCNView.debugOptions = [.showFeaturePoints]
        
        return arSCNView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
    }
}
