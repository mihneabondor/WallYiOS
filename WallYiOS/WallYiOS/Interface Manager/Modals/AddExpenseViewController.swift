//
//  AddExpenseViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 16.12.2022.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var recurringBtn: UIButton!
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }
    @IBAction func addTapped(_ sender: Any) {
        //Add stuff
        let text = -Int(amountField.text ?? "0")!
        data.append(.init(amount: text, weekDay: Date().dayOfWeek()))
        Functions.SharedInstance.saveData(key: "wallyios.savedOperations", array: data)
        NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
        NotificationCenter.default.post(name: .refreshNetworthView, object: nil)
        
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }
    @IBAction func dismissTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        styleModalView()
        addMenu()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.dismissBtn.alpha = 0.4
        } completion: { _ in
            self.amountField.becomeFirstResponder()
        }
    }
    
    func addMenu() {
        var recurringMenuItems: [UIAction] {
            return [
                UIAction(title: "Never", image: nil, handler: { (_) in
                    self.recurringBtn.setTitle("Never", for: .normal)
                }),
                UIAction(title: "Every Year", image: nil, handler: { (_) in
                    self.recurringBtn.setTitle("Every Year", for: .normal)
                }),
                UIAction(title: "Every Month", image: nil, handler: { (_) in
                    self.recurringBtn.setTitle("Every Month", for: .normal)
                }),
                UIAction(title: "Every Week", image: nil, handler: { (_) in
                    self.recurringBtn.setTitle("Every Week", for: .normal)
                }),
                UIAction(title: "Every Day", image: nil, handler: { (_) in
                    self.recurringBtn.setTitle("Every Day", for: .normal)
                })
            ]
        }
        var recurringMenu: UIMenu {
            return UIMenu(title: "Recurring", image: nil, identifier: nil, options: [], children: recurringMenuItems)
        }
        recurringBtn.menu = recurringMenu
        recurringBtn.showsMenuAsPrimaryAction = true
    }
    
    func styleModalView() {
        cardView.layer.cornerRadius = 24.0
        addBtn.layer.cornerRadius = 16.0
    }

}
