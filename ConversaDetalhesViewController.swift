//
//  ConversaDetalhesViewController.swift
//  AmiProject
//
//  Created by student on 29/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConversaDetalhesViewController: UIViewController {
    
    var dialogo:Conversa?
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var brinquedoLabel: UILabel!
    @IBOutlet weak var perigoLabel: UILabel!
    @IBOutlet weak var tagPrincipalLabel: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        brinquedoLabel.text = dialogo?.brinquedo
        dataLabel.text = dialogo?.data
        perigoLabel.text = dialogo?.perigo
        tagPrincipalLabel.text = dialogo?.tagPrincipal
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
