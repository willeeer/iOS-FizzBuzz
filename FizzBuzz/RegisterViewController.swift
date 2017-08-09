//
//  RegisterViewController.swift
//  FizzBuzz
//
//  Created by Treinamento on 03/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController{
    
    
    @IBOutlet weak var nomeRegistro: UITextField!
    @IBOutlet weak var fotoRegistro: UIImageView!
    @IBOutlet weak var mensagemLabel: UILabel!
    
    @IBOutlet weak var submitBtn: UIButton!
    var verificaField = false
    var verificaImage = false
    
    var pontos: Int?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeRegistro.delegate = self
        // Do any additional setup after loading the view.
        if(pontos! >= 100){
            self.mensagemLabel.text = "Parabéns você atingiu a pontuação máxima!"
        }
        else{
            self.mensagemLabel.text = "Parabéns você fez: \(String(pontos!)) pontos!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

    @IBAction func imagePicker(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated:true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "scoreSegue"{
            if let destination = segue.destination as? ScoreTableViewController {
                
                destination.recebeNome = nomeRegistro.text
                destination.recebeFoto = fotoRegistro.image
                destination.recebePontos = self.pontos!
            }
        }
        
       
    }


}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.fotoRegistro.image = pickedImage
            
        }
        
        verificaImage = true
        if(verificaField == true && verificaImage == true){
            self.submitBtn.isEnabled = true
        }
    
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let texto = nomeRegistro.text else {
            return true
        }
        
        if texto != ""{
            verificaField = true
            if(verificaField == true && verificaImage == true){
                self.submitBtn.isEnabled = true
            }
        }
        return true
    }

    
}
