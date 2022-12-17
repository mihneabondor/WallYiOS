//
//  NetworthViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 17.12.2022.
//

import UIKit

class NetworthViewController: UIViewController {
    var tableData : [Operation] = data.filter{$0.amount != 0}
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet var operationsTableView: UITableView!
    
    @IBOutlet weak var networthView: UIView!
    @IBOutlet weak var addIncomeView: UIView!
    @IBAction func addIncomeTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddIncomeVC") as! AddIncomeViewController
        self.present(vc, animated: true)
    }
    @IBOutlet weak var addExpenseView: UIView!
    @IBAction func addExpenseTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddExpenseVC") as! AddExpenseViewController
        self.present(vc, animated: true)
    }
    
    @IBOutlet var NetworthLabel : UILabel!
        
    func networthLabelSetup() {
        var sum = 0;
        for item in data {
            sum += item.amount
        }
        
        NetworthLabel.text = "\(sum)\(userPrefs.currency)"
    }
    
    func manageObs() {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshNetWorthView), name: .refreshNetworthView, object: nil)
    }
    
    @objc func refreshNetWorthView() {
        DispatchQueue.main.async {
            self.networthLabelSetup()
            self.tableData = data.filter{$0.amount != 0}
            self.operationsTableView.reloadData()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manageObs()
        networthLabelSetup()
        styleViewController()
    }
    
    func styleViewController() {
        networthView.layer.cornerRadius = 16
        addIncomeView.layer.cornerRadius = addIncomeView.frame.height/2
        addExpenseView.layer.cornerRadius = addExpenseView.frame.height/2
        
        operationsTableView.delegate = self
        operationsTableView.dataSource = self
    }

}
extension NetworthViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OperationCell") as! OperationCell
        cell.numberLbl.text = String(abs(tableData[indexPath.row].amount))
        if tableData[indexPath.row].amount > 0 {
            cell.signIcon.image = UIImage(systemName: "plus")
            cell.numberLbl.textColor = UIColor(named: "OldPurple")!
            cell.signIcon.tintColor = UIColor(named: "OldPurple")!
        } else {
            cell.signIcon.image = UIImage(systemName: "minus")
            cell.numberLbl.textColor = UIColor(named: "BabyBlue")!
            cell.signIcon.tintColor = UIColor(named: "BabyBlue")!
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        cell.dateLbl.text = dateFormatter.string(from: tableData[indexPath.row].date)
        
        return cell
    }
}
