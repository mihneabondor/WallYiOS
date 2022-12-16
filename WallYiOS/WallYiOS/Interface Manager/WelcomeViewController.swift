//
//  ViewController.swift
//  WallYiOS
//
//  Created by Mihnea on 12/15/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var addIncomeView: UIView!
    @IBOutlet weak var addExpenseView: UIView!
    
    @IBOutlet weak var addIncomeBtn: UIButton!
    @IBAction func addIncomeTapped(_ sender: Any) {
        
    }

    @IBOutlet weak var addExpenseBtn: UIButton!
    @IBAction func addExpenseTapped(_ sender: Any) {
        
    }

    
    @IBOutlet weak var continueBtn: UIButton!
    @IBAction func continueTapped(_ sender: Any) {
        let operations : [Operation] = [
            .init(amount: 0, weekDay: "Mon"),
            .init(amount: 0, weekDay: "Tue"),
            .init(amount: 0, weekDay: "Wed"),
            .init(amount: 0, weekDay: "Thu"),
            .init(amount: 0, weekDay: "Fri"),
            .init(amount: 0, weekDay: "Sat"),
            .init(amount: 0, weekDay: "Sun")
        ]
        Functions.SharedInstance.saveData(key: "wallyios.savedOperations", array: operations)
        
        UserDefaults.standard.set(true, forKey: "wallyios.setupdone")
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        self.present(homeVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        styleViewController()
    }
    
    func styleViewController() {
        continueBtn.layer.cornerRadius = 15.0
        addIncomeView.layer.cornerRadius = addIncomeView.frame.height/2
        addExpenseView.layer.cornerRadius = addExpenseView.frame.height/2
    }


}

