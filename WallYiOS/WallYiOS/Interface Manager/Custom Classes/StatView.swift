//
//  StatView.swift
//  WallYiOS
//
//  Created by David Retegan on 16.12.2022.
//

import SwiftUI
import Charts

struct StatView: View {
    @State public var data : [Operation] = Functions.SharedInstance.getData(key: "wallyios.savedOperations")
    
    var body: some View {
        Chart {
            ForEach(data) {data in
                BarMark(
                    x: .value("date", data.weekDay),
                    y: .value("amount", data.amount)
                )
            }
        }.padding()
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}
