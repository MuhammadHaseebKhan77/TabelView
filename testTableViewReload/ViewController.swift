//
//  ViewController.swift
//  testTableViewReload
//
//  Created by Apple on 11/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var arr = [String]()
    var index=IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        arr = ["label1","label2","label3","label4","label5","label6","label7","label8","label9","label10"]
       
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let cell = tableView.cellForRow(at: index){
            cell.textLabel?.text=self.txtfield.text
        }
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath)
        if cell != nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index=indexPath
        self.txtfield.text=arr[indexPath.row]
    }
}
