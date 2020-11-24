//
//  Text.swift
//  Translator
//
//  Created by admin on 24.11.2020.
//

import Foundation
import RealmSwift

class Text : Object {
    
    @objc dynamic var inputText = ""
    @objc dynamic var translatedText = ""
    @objc dynamic var date : Date = Date()
}
