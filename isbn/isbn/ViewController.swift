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
    @IBOutlet weak var uiLabelTitulo: UILabel!
    @IBOutlet weak var uiLabelAutores: UILabel!
    @IBOutlet weak var uiImageCover: UIImageView!
    
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
        
        let session = NSURLSession.sharedSession()
        let block = { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                if ((error?.code) != nil) {
                    let ac = UIAlertController(title: "ISBN", message: "Problemas al cargar openlibrary.org",
                        preferredStyle: .Alert)
                    ac.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                    
                    // mostramos mensaje de error
                    self.presentViewController(ac, animated: true, completion: nil)
                }
                
                if (data != nil) {
                    do {
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
                        let isbn = json as! NSDictionary
                        
                        let title = isbn["ISBN:\(self.uiTextISBN.text!)"] as! NSDictionary
                        let authors = (isbn["ISBN:\(self.uiTextISBN.text!)"] as! NSDictionary)["authors"] as! NSArray
                        let covers = (isbn["ISBN:\(self.uiTextISBN.text!)"] as! NSDictionary)["cover"] as! NSDictionary
                        
                        self.uiLabelTitulo.text = title["title"] as! NSString as String
                        
                        var tmp = ""
                        for author in authors {
                            tmp = tmp + (author["name"] as! NSString as String)
                        }
                        self.uiLabelAutores.text = tmp
                        
                        if (covers["large"] != nil) {
                            let url = covers["large"] as! NSString as String
                            self.uiImageCover.image = UIImage(data: NSData(contentsOfURL: NSURL(string: url)!)!)
                        }
                        
                    } catch _ {
                        print("Error al acceder a los datos de openlibrary.org")
                    }
                }
            }
        }
        
        let dt = session.dataTaskWithURL(url!, completionHandler: block)
        dt.resume()
        
    }
}

