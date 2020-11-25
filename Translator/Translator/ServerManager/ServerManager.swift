//
//  ServerManager.swift
//  Translator
//
//  Created by admin on 24.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ServerManager {
    
    static let shared = ServerManager()
    
    let URL = "https://tech.yandex.com/translate/"
    var apiKey = "trnsl.1.1.20200324T142745Z.2120f2a51bea64cc.727157bc6cf44fe7463be9c0e0c0d3d916116b87"
    
    var textKeeper = ""
    var lg = NSLocalizedString("en-ru", comment: "Language label")
    
    func getTranslate(texts: String, completion: @escaping (String) -> ()) {
        
        Alamofire.request("\(URL)translate?key=\(apiKey)&lang=\(lg)&text=\(texts)&ui=ru".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
            .responseJSON{(response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value);
                    self.textKeeper = json["text"][0].stringValue
                    DispatchQueue.main.async {
                        completion(self.textKeeper)
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        completion(self.textKeeper)
                    }
                }
            }
    }
}
