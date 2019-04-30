//
//  ViewController.swift
//  AppIOT
//
//  Created by Bruno Corte on 14/07/17.
//  Copyright © 2017 Felipe Corte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var sobrenome: UILabel!
    
    @IBOutlet weak var idade: UILabel!
    
    @IBOutlet weak var humor: UILabel!
    
    var analises = [Dados]()
    
    var number: Int = 0
    var liberado: Bool = false
    override func viewDidLoad(){
        super.viewDidLoad()
        self.number = 0
        self.liberado = false
    }
    @IBAction func botao(_ sender: Any) {
        number = Int(arc4random_uniform(2))
        
        //OBSERVACAO: ELE EXECUTA O PRINT analises ANTES DE ATUALIZAR O ARRAY DE analises
        dadosDAO.getPessoa (quem: number, callback: { (analises,analise) in
            self.nome.text = String(describing: analise.toyID)
            self.sobrenome.text = String(analise.humor[.joy]!)
            self.idade.text = String(analise.humor[.fear]!)
            self.humor.text = String(analise.humor[.anger]!)
            self.analises = analises
            self.liberado = true;
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ultimoIdentifier"{
            if let ultimoVC = segue.destination as? UltimoViewController{
                ultimoVC.sessao = analises[number]
                print(analises[number].toyID)
                
            }
        }
        
        
    }
}




