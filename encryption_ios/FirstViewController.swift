//
//  FirstViewController.swift
//  encryption_ios
//
//  Created by jingqiang hu on 2/7/2017.
//  Copyright © 2017 jingqiang hu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cryptoLib = CryptLib();
        let plainText = "This is the text to be encrypted."
        
        let key = cryptoLib.sha256("my secret key", length: 32)!
        let iv = "4NAfcTL5nWERGSLl"
        // ((cryptoLib.generateRandomIV(11) as NSData).base64Encoding(withLineLength: 0) as NSString).substring(to: 16)
        
        print("key:\(key)")
        print("isv:\(iv)")
        let encryptedData=cryptoLib.encrypt(plainText.data(using: .utf8), key: key as String!, iv: iv)
        //print("encryptedString:\(String(describing: NSString(data: encryptedString!, encoding: String.Encoding.utf8.rawValue)))")
        print("encrypted string:\((encryptedData! as NSData).base64Encoding(withLineLength: 0)!)")
        
        let decryptedData = cryptoLib.decrypt(encryptedData, key: key as String!, iv: iv)
        print("decrypted string:\(String(describing: NSString(data: decryptedData!, encoding: String.Encoding.utf8.rawValue)!))")
        //print("encrypted string: \((decryptedData! as NSData).base64Encoding(withLineLength: 0))")
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

