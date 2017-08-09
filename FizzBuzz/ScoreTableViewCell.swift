//
//  ScoreTableViewCell.swift
//  FizzBuzz
//
//  Created by Treinamento on 03/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreFoto: UIImageView!
    @IBOutlet weak var scoreNome: UILabel!
    @IBOutlet weak var scorePontos: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
