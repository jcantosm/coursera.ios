//
//  ViewController.swift
//  isbn
//
//  Created by Javier Cantos on 19/12/15.
//  Copyright © 2015 Javier Cantos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var uiTextISBN: UITextField!
    @IBOutlet weak var uiTextViewJSON: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.uiTextISBN.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender : UIControl) {
        self.uiTextISBN.resignFirstResponder()
        connectTo()
    }
    
    func connectTo() {
        let library = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let url = NSURL(string:"\(library)\(self.uiTextISBN.text!)")
        let data : NSData? = NSData(contentsOfURL: url!)
        let json = NSString(data:data!, encoding:NSUTF8StringEncoding)
        self.uiTextViewJSON.text = "\(json)"
    }
}

