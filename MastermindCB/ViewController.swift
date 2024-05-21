//
//  ViewController.swift
//  MastermindCB
//
//  Created by Jason Cox on 5/21/24.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var tableView: NSTableView!
    
    @IBOutlet var guess: NSTextField!
    
    var answer = ""
    var guesses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func submitGuess(_ sender: Any) {
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return guesses.count
    }
    
    func result (for guess: String) -> String {
        return "Result"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        if tableColumn?.title == "Guess" {
            //this is the Guess column, show a previous guess
            vw.textField?.stringValue = guesses[row]
        } else {
            //this is the Result column, call our new method
            vw.textField?.stringValue = result(for: guesses[row])
        }
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
}

