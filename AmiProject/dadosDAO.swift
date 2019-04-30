import Foundation

enum Humor : String{
    case joy = "joy"
    case sadness = "sadness"
    case fear = "fear"
    case disgust = "disgust"
    case anger = "anger"
    case other = "other"
    
}
enum PalavrasChave : String{
    case abusives = "abusives"
    case badWords = "badWords"
    case violents = "violents"
    case other = "other"
    
}

class Dados{
    
    var toyID: String
    //var date: Date
    var humor: [Humor: Double]
    var keys: [PalavrasChave: Int]
    init(){
        self.toyID = "Sem dados"
        
        self.humor = [
            .joy : 0,
            .sadness : 0,
            .fear : 0,
            .anger : 0,
            .other : 0
        ]
        self.keys = [
            .abusives : 0,
            .badWords : 0,
            .violents : 0,
            .other : 0
        ]
    }
    init(json: [String: AnyObject]){
        self.humor = [
            .joy : 0,
            .sadness : 0,
            .fear : 0,
            .anger : 0,
            .other : 0
        ]
        self.keys = [
            .abusives : 0,
            .badWords : 0,
            .violents : 0,
            .other : 0
        ]
        
        self.toyID = json["toyID"] as? String ?? ""
        
        let jsonHumor = json["humor"] as? [String:AnyObject]
        
        self.humor[.joy] = Double(jsonHumor!["joy"] as? String ?? "")
        self.humor[.sadness] = Double(jsonHumor!["sadness"] as? String ?? "")
        self.humor[.fear] = Double(jsonHumor!["fear"] as? String ?? "")
        self.humor[.disgust] = Double(jsonHumor!["disgust"] as? String ?? "")
        self.humor[.anger] = Double(jsonHumor!["anger"] as? String ?? "")
    }
    
}

class dadosDAO {
    
    static func getPessoa (quem: Int, callback: @escaping (([Dados],Dados) -> Void)) {
        
        let endpoint: String = "https://watsonchatsbsnbot.mybluemix.net/ver"
        
        guard let url = URL(string: endpoint) else {
            print("Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        var analise = Dados()
                        var analises = [Dados]()
                        for i in 0..<json.count{
                            analises.append(Dados(json: json[i]))
                            
                        }
                        
                        if(quem<json.count){
                            analise = Dados(json: json[quem])
                        }
                        callback(analises,analise)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
        
    }
    
    
}
