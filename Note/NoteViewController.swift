//
//  NoteViewController.swift
//  Note
//
//  Created by JohnPham on 10/30/23.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UITextView!
    
    public var noteTitle:String = ""
    public var noteContent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        contentLabel.text = noteContent
    }
    
    
}
