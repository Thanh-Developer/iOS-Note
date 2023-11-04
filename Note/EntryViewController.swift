//
//  EntryViewController.swift
//  Note
//
//  Created by JohnPham on 10/30/23.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completetion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
    }
    
    @objc func didTapSave(){
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completetion?(text, noteField.text)
        }
    }
}
