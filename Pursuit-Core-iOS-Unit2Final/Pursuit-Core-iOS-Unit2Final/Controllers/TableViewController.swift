//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = [Crayon]() {
        didSet {
            tableView.reloadData()
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    crayons = Crayon.allTheCrayons
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to properly segue")
        }
        
        let currentColor = crayons[indexPath.row]
        
        detailVC.currentColor = currentColor
        
        
    }


}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        
        let thisCrayon = crayons[indexPath.row]
        
        cell.textLabel?.text = thisCrayon.name
        cell.detailTextLabel?.text = thisCrayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(thisCrayon.red / 255), green: CGFloat(thisCrayon.green / 255), blue: CGFloat(thisCrayon.blue / 255), alpha: 1.0)
        
        if thisCrayon.name == "Black" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        
        return cell
        
    }
    
  
    
    
    
    
    
}
