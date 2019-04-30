
import UIKit

class UltimoViewController: UIViewController {
    var sessao: Dados?
    @IBOutlet weak var graph: RSPizzaGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let mySessao = sessao{
            print(100*mySessao.humor[.joy]!)
            print(100*mySessao.humor[.sadness]!)
            let graphs = [RSPizzaGraph(value: Int(100*mySessao.humor[.joy]!), color: UIColor.red),
                          RSPizzaGraph(value: Int(100*mySessao.humor[.sadness]!), color: UIColor.blue),
                          RSPizzaGraph(value: Int(100*mySessao.humor[.fear]!), color: UIColor.green),
                          //RSPizzaGraph(value: Int(100*mySessao.humor[.disgust]!), color: UIColor.black),
                RSPizzaGraph(value: Int(100*mySessao.humor[.anger]!), color: UIColor.darkGray)]
            
            graph.configureGraph(borderWidth: 150,
                                 graphs: graphs,
                                 animation: .circular,
                                 shouldShowText: true,
                                 font: UIFont.systemFont(ofSize: 15),
                                 textColor: UIColor.white,
                                 unityText: "%")
        }
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
}
