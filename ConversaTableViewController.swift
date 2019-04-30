//
//  ConversaTableViewController.swift
//  AmiProject
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConversaTableViewController: UITableViewController {
    
    var conversas = [Conversa]()
    var exportConversa:Conversa?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleMeals()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return conversas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ConversaTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversaTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let conversa = conversas[indexPath.row]
        cell.brinquedoLabel.text = conversa.brinquedo
        cell.dataLabel.text = conversa.data
        cell.perigoLabel.text = conversa.perigo
        cell.tagPrincipalLabel.text = conversa.tagPrincipal
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exportConversa = conversas[indexPath.row]
        performSegue(withIdentifier: "conversaDetalhes", sender: self)
    }
    
 

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "conversaDetalhes"{
            
            
            
            if let vc = segue.destination as? ConversaDetalhesViewController {
                
//                vc.conversa = exportConversa
                
                let selectCell = tableView.indexPathForSelectedRow?.row
                let conversa = conversas[selectCell!]
                
                vc.dialogo = conversa
                
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
    private func loadSampleMeals() {
     
        guard let conversa1 = Conversa(data: "a", perigo: "1", brinquedo: "a", tagPrincipal: "a") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let conversa2 = Conversa(data: "a", perigo: "1", brinquedo: "conversa2", tagPrincipal: "a") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let conversa3 = Conversa(data: "a", perigo: "1", brinquedo: "conversa3", tagPrincipal: "a") else {
            fatalError("Unable to instantiate meal1")
        }
        
        conversas += [conversa1, conversa2, conversa3]
        
    }
    
}
