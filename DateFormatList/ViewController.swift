//
//  ViewController.swift
//  DateFormatList
//
//  Created by shoeb on 26/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTableView: UITableView!
    let dateFormat = ["EEEE, MMM d, yyyy", "MM/dd/yyyy", "MMMM yyyy", "MMM d, yyyy", "dd.MM.yy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTableView.delegate = self
        dateTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello World")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateFormat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dateTableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
        let date = Date()
        let formattter = DateFormatter()
        formattter.timeZone = .current
        formattter.locale = .current
        formattter.dateFormat = dateFormat[indexPath.row]
        cell.textLabel?.text = formattter.string(from: date)
        return cell
    }
}
