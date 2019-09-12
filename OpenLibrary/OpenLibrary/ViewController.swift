//
//  ViewController.swift
//  OpenLibrary
//
//  Created by AWM Solutions on 9/11/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,   UITextViewDelegate {
    @IBOutlet weak var ISBNLibro: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    @IBAction func buscarLibro(_ sender: Any) {
        let isbn : String?
        isbn = ISBNLibro.text
        ISBNLibro.text = String()
        print(isbn!)
    
        //Conexion 
        let urls1 = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let urls = urls1 + isbn!
        let url = NSURL(string: urls)
        let datos :NSData? = NSData(contentsOf: url! as      URL)
        let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
        print(texto!)
        print(urls)
       //Imprimir en TextView
        myTextView.text = "\(String(describing: texto))"
    }
    @IBAction func clear(_ sender: Any) {
        myTextView.text = ""
    }
}

