//
//  RecordVC.swift
//  03-diary-ui
//
//  Created by Mariana Ruzhytska on 29/05/2018.
//  Copyright © 2018 Mariana Ruzhytska. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {
    
    
    enum Mode {
        case create
        case edit
    }
    
   // let mode: Mode = .create
    var record = [Record]()
   // var newRecord =

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleTF = UITextField(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
        titleTF.delegate = self
        titleTF.borderStyle = UITextBorderStyle.roundedRect
        titleTF.placeholder = "Enter text here"
        self.view.addSubview(titleTF)
        
      //  titleTF.text =
        

        let diaryTV = UITextView(frame: CGRect(x: 10, y: 60, width: 100, height: 40))
        diaryTV.isEditable = true
        self.view.addSubview(diaryTV)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RecordVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

}

