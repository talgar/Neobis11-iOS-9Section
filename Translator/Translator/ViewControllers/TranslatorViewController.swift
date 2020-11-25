//
//  ViewController.swift
//  Translator
//
//  Created by admin on 18.11.2020.
//

import UIKit
import SwiftyJSON
import Alamofire

class TranslatorViewController: UIViewController , UITextViewDelegate {

    var item : Text?
    var translateTimer : Timer?
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var firstTextView: UITextView!
    @IBOutlet weak var secondTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageChange(item: ServerManager.shared.lg)
    }

    @objc func runTime(){
        ServerManager.shared.getTranslate(texts: firstTextView.text,  completion:putTranslatedText(translate:))
    }
    
    func putTranslatedText(translate : String) {
        if translate.isEmpty {
            secondTextView.text = "No internet connection"
        } else {
            secondTextView.text = translate
            saveData()
        }
    }
    
    func saveData() {
        let item = Text()
        item.inputText = firstTextView.text
        item.translatedText = secondTextView.text
        if item.inputText != "" {
            DBManager.sharedDB.addData(object: item)
        }
    }
    
    
    @IBAction func rotateBTN(_ sender: Any) {
        if ServerManager.shared.lg.description == "en-ru" {
            ServerManager.shared.lg = "ru-en"
            ruToEN()
        } else {
            ServerManager.shared.lg = "en-ru"
            enToRu()
        }
    }
    
    @IBAction func tSpeakerBTN(_ sender: Any) {
    }
    
    
    func ruToEN() {
        firstImageView.image = UIImage(named: "iRuss")
        secondImageView.image = UIImage(named: "iUK")
    }
    
    func enToRu() {
        firstImageView.image = UIImage(named: "iUK")
        secondImageView.image = UIImage(named: "iRuss")
    }
    
    func imageChange(item : String) {
        if item == "en-ru" {
            enToRu()
        } else {
            ruToEN()
        }
    }
}


