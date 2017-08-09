//
//  GameViewController.swift
//  FizzBuzz
//
//  Created by Treinamento on 03/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var numeroAtual = 0

    @IBOutlet weak var scoreBtn: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // scoreBtn.textAlignment =
        scoreBtn.text = String(numeroAtual)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addBtn(_ sender: Any) {
        let resultado = checaNumero(numero: self.numeroAtual)
        
        switch resultado {
        case "numero":
            self.numeroAtual += 1
            self.scoreBtn.text = "" + String(self.numeroAtual)
        case "fizz", "buzz" , "fim", "fb":
            performSegue(withIdentifier: "registerSegue", sender: self)
        default:
            break
        }
    }
    
    @IBAction func buzzBtn(_ sender: Any) {
        
        let resultado = checaNumero(numero: self.numeroAtual)
        
        switch resultado {
        case "buzz":
            self.numeroAtual += 1
            self.scoreBtn.text = "" + String(self.numeroAtual)
        case "fizz", "numero" , "fim", "fb":
            performSegue(withIdentifier: "registerSegue", sender: self)
        default:
            break
        }
    }
    
    
    @IBAction func fizzBtn(_ sender: Any) {
        
        let resultado = checaNumero(numero: self.numeroAtual)
        
        switch resultado {
        case "fizz":
            self.numeroAtual += 1
            self.scoreBtn.text = "" + String(self.numeroAtual)
        case "buzz", "numero" , "fim", "fb":
            performSegue(withIdentifier: "registerSegue", sender: self)
        default:
            break
        }
    }

    @IBAction func fbBtn(_ sender: Any) {
        let resultado = checaNumero(numero: self.numeroAtual)
        
        switch resultado {
        case "fb":
            self.numeroAtual += 1
            self.scoreBtn.text = "" + String(self.numeroAtual)
        case "buzz", "numero" , "fim", "fizz":
            performSegue(withIdentifier: "registerSegue", sender: self)
        default:
            break
        }
        
    }
    
    func checaNumero(numero: Int) -> String{
      
        if(numeroAtual == 0){
            return "numero"
        }
        else if(numeroAtual%15 == 0){
            return "fb"
            
        }else if(self.numeroAtual%5 == 0){
            return "buzz"
        }else if(self.numeroAtual%3 == 0){
            return "fizz"
        }else if(self.numeroAtual == 100){
            //self.numeroAtual += 1
            return "fim"
        }else{
            return "numero"
        }
        //return "numero"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "registerSegue"{
            
            if let destination = segue.destination as? RegisterViewController {
                destination.pontos = numeroAtual
            }
            
        }
    }
    
    @IBAction func jogarNovamente (sender: UIStoryboardSegue){
       /*
        guard let view = sender.source as? ScoreTableViewController else{
            return
        }
        */
        
        self.numeroAtual = 0
        self.scoreBtn.text = String(self.numeroAtual)

    
    }
    
}


