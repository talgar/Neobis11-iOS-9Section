//
//  DBManager.swift
//  Translator
//
//  Created by admin on 24.11.2020.
//

import Foundation
import RealmSwift

class DBManager {
    
    var dataBase : Realm
    static let sharedDB = DBManager()
    
    init () {
        dataBase = try! Realm()
    }
    
    func getDataFrDB() -> Results<Text> {
        let results : Results<Text> = dataBase.objects(Text.self)
        return results
    }
    
    func addData(object : Text) {
        try! dataBase.write {
            dataBase.add(object)
        }
    }
    
    func deleteFrDB(object : Text) {
        try! dataBase.write {
            dataBase.delete(object)
        }
        deleteItem()
    }
    
    func deleteItem() {
        let result = getDataFrDB()
        if result.count > 30 {
            try! dataBase.write {
                dataBase.delete(result.sorted(byKeyPath: "date", ascending: false).last!)
            }
        }
    }
}
