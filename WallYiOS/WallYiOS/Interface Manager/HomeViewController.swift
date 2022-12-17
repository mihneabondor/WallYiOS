//
//  HomeViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 16.12.2022.
//

import UIKit
import SwiftUI
import EasyTipView

class HomeViewController: UIViewController {
    
    var tipView: EasyTipView!
    
    //MARK: -Tab Bar-
    @IBOutlet weak var floatingView: UIView!
    @IBOutlet weak var settingsBtn: UIButton!
    
    @IBAction func settingsTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
        self.present(vc, animated: false)
    }
    //MARK: -End tab bar-

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
    
    @IBOutlet weak var statsView: UIView!
    
    //MARK: -Sections Control-
    @IBAction func showMoreNetworthTapped(_ sender: Any) {
        
    }
    
    @IBAction func showMoreStatsTapped(_ sender: Any) {
        
    }
    
    var data = Functions.SharedInstance.getData(key: "wallyios.savedOperations")
    
    @IBOutlet var NetworthLabel : UILabel!
    
    func networthLabelSetup() {
        var sum = 0;
        for item in data {
            sum += item.amount
        }
        
        // TODO: de adaugat currency ul
        NetworthLabel.text = "\(sum) RON"
    }
    
    //MARK: -Tips View-
    @IBOutlet weak var tipLogo: UIImageView!
    @IBAction func tipTapped(_ sender: Any) {
        if tipView != nil {
            tipView.dismiss()
        }
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.autoreverse]) {
            self.tipLogo.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            self.tipLogo.transform = .identity
        }
        tipView = EasyTipView(text: TipsManager.sharedInstance.getNewTip())
        tipView.show(forView: tipLogo, withinSuperview: self.view)
    }
    
    func setUpTipsView() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = .systemFont(ofSize: 17, weight: .regular)
        preferences.drawing.foregroundColor = .label
        preferences.drawing.backgroundColor = UIColor(named: "Detail")!
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.left
        preferences.drawing.cornerRadius = 16.0
        
        preferences.positioning.maxWidth = self.view.frame.width/2 + 10
        
        preferences.animating.dismissOnTap = true

        EasyTipView.globalPreferences = preferences
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTabBar()
        styleViewController()
        networthLabelSetup()
        setUpTipsView()
    }
    
    func styleViewController() {
        networthView.layer.cornerRadius = 16
        addIncomeView.layer.cornerRadius = addIncomeView.frame.height/2
        addExpenseView.layer.cornerRadius = addExpenseView.frame.height/2
        statsView.layer.cornerRadius = 16
        
        //Adding chart
        let childView = UIHostingController(rootView: StatView())
        childView.view.frame = statsView.bounds
        childView.view.layer.cornerRadius = 16
        statsView.addSubview(childView.view)
    }
    
    func styleTabBar() {
        floatingView.layer.cornerRadius = floatingView.frame.height/2
                
        floatingView.layer.shadowColor = UIColor.black.cgColor
        floatingView.layer.shadowOpacity = 0.15
        floatingView.layer.shadowOffset = .zero
        floatingView.layer.shadowRadius = floatingView.frame.height/2
        floatingView.layer.shadowPath = UIBezierPath(rect: floatingView.bounds).cgPath
        floatingView.layer.shouldRasterize = true
        floatingView.layer.rasterizationScale = UIScreen.main.scale
    }
    

}
