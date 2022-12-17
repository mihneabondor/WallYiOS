//
//  TipsManager.swift
//  WallYiOS
//
//  Created by David Retegan on 17.12.2022.
//

import Foundation

class TipsManager {
    
    private var tips = [
        "Spend less money you dirty pig, what are you an animal?",
        "Go! Go buy as many things as you want! Go now spend it all filthy pig! Go!",
        "What? You need advice? Good joke, go buy your 9$ Starbucks and do your nails."
    ]
    
    static let sharedInstance = TipsManager()
    
    private init() {}
    
    func getNewTip() -> String {
        let tip = tips.randomElement()!
        return tip
    }
    
}
