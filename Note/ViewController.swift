//
//  ViewController.swift
//  Note
//
//  Created by JohnPham on 10/30/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var notes: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }
    
    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else{
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completetion = {noteTitle, note in self.notes.append((title: noteTitle, note: note))
            self.navigationController?.popViewController(animated: true)
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let note = notes[indexPath.row]
        
        // Show Note Controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Notes"
        vc.noteTitle = note.title
        vc.noteContent = note.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

