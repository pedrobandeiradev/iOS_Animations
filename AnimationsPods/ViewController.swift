//
//  ViewController.swift
//  AnimationsPods
//
//  Created by Superdigital on 25/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit
import Hero
import Spring

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pushButton: SpringButton!
    
    let listOfNames = ["Alfa", "Bravo", "Charlie", "Delta", "Eco", "Foxtrot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func touchPushButton(_ sender: Any) {
        pushButton.animateToNext {
            
        }
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        vc2.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        present(vc2, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "nameCell")
        cell.textLabel?.text = listOfNames[indexPath.item]
        return cell
    }
}

