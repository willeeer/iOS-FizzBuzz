//
//  ScoreTableViewController.swift
//  FizzBuzz
//
//  Created by Treinamento on 03/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

import UIKit
import CoreData

class ScoreTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?
    
    var scores: [ScoreMO] = []
    
    var recebeNome: String?
    var recebeFoto: UIImage?
    var recebePontos: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        self.managedContext = appDelegate?.persistentContainer.viewContext
        
        save(nome: recebeNome!, foto: recebeFoto!, pontos: String(recebePontos!))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest: NSFetchRequest<ScoreMO> = ScoreMO.fetchRequest()
        
        do{
            try self.scores = (self.managedContext?.fetch(fetchRequest))!
        } catch let error as NSError {
            print("Deu ruim pai: \(error)")
        }
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
        return self.scores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "scoreCell"

        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ScoreTableViewCell
            else{
                fatalError("qq coisa")
        }
        
        let celulaAtual = self.scores[indexPath.row]
        cell.scoreNome.text = celulaAtual.nome
        cell.scorePontos.text = celulaAtual.pontos
    
        
        guard let imgData = celulaAtual.foto as Data?, let imagem = UIImage(data: imgData) else{
            return cell
        }
        
        cell.scoreFoto.image = imagem
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let scoreDeletado = self.scores[indexPath.row]
            self.managedContext?.delete(scoreDeletado)
            self.appDelegate?.saveContext()
            
            let fetchDelete: NSFetchRequest<ScoreMO> = ScoreMO.fetchRequest()
            
            do{
                try self.scores = (self.managedContext?.fetch(fetchDelete))!
                tableView.reloadData()
            } catch {
                print( "Erro na delecao")
            }
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
    
    func save (nome: String, foto: UIImage, pontos: String){
        
        let novoScore = ScoreMO(context: self.managedContext!)
        novoScore.nome = nome
        novoScore.foto = NSData(data: UIImageJPEGRepresentation(foto, 1)!)
        novoScore.pontos = pontos
        
        
        do{
            try self.managedContext?.save()
            self.scores.append(novoScore)
            self.tableView.reloadData()
        } catch let error as NSError{
            print("Deu ruim de novo pai: .\(error)")
        }
        
        
    }

    

}
