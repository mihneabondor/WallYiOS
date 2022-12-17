//
//  NetworthViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 17.12.2022.
//

import UIKit

class NetworthViewController: UIViewController {
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
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
    
    var data = Functions.SharedInstance.getData(key: "wallyios.savedOperations")
    
    func networthLabelSetup() {
        var sum = 0;
        for item in data {
            sum += item.amount
        }
        
        NetworthLabel.text = "\(sum)\(userPrefs.currency)"
    }
    
    func manageObs() {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshHomeScreen), name: .refreshHomeScreen, object: nil)
    }
    
    @objc func refreshHomeScreen() {
        DispatchQueue.main.async {
            self.networthLabelSetup()
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
    }

}
