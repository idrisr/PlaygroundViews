//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let tableVC = UITableViewController()

class TableDelegate: NSObject {}
let tableDelegate = TableDelegate()

let colors = [UIColor.green, UIColor.red, UIColor.blue, UIColor.black, UIColor.yellow]

extension TableDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = colors[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
}

extension TableDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

tableVC.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseID")
tableVC.tableView.dataSource = tableDelegate
tableVC.tableView.delegate = tableDelegate

tableVC.tableView.frame = CGRect(x: 0, y: 0, width: 337, height: 650)
//PlaygroundPage.current.liveView = tableVC.tableView
