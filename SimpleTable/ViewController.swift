//
//  ViewController.swift
//  SimpleTable
//
//  Created by 정재훈 on 16/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        
        return formatter
    }()

    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var dates: [Date] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier
                , for: indexPath)
            
            let text = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            
            return cell
        } else {
            guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as? CustomTableViewCell else {
                preconditionFailure("테이블 뷰 셀 가져오기 실패")
            }
            
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        
        return nil
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        // self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: .automatic)
    }
}
