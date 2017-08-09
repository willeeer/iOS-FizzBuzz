//
//  ScoreMO+CoreDataProperties.swift
//  FizzBuzz
//
//  Created by Treinamento on 03/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

import Foundation
import CoreData


extension ScoreMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoreMO> {
        return NSFetchRequest<ScoreMO>(entityName: "Score")
    }

    @NSManaged public var nome: String?
    @NSManaged public var foto: NSData?
    @NSManaged public var pontos: String?

}
