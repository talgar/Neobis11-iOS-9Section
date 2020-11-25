//
//  Extensions.swift
//  Translator
//
//  Created by admin on 25.11.2020.
//

import Foundation
import RealmSwift
import SwiftyJSON
import Alamofire

extension TranslatorViewController {
    
    func textViewDidChange(_ textView: UITextView) {
        refreshTimer()
    }
    
    func refreshTimer(){
        translateTimer?.invalidate()
        translateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTime), userInfo: nil, repeats: false)
    }
}
