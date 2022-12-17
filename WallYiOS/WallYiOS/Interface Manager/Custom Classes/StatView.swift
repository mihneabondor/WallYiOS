//
//  StatView.swift
//  WallYiOS
//
//  Created by David Retegan on 16.12.2022.
//

import SwiftUI
import Charts

struct StatView: View {
    @State public var data : [Operation]!
    var color : Color!
    var body: some View {
        Chart {
            ForEach(data) {data in
                BarMark(
                    x: .value("date", data.weekDay),
                    y: .value("amount", abs(data.amount))
                ).foregroundStyle(color) //OldPurple
            }
        }.padding()
        .background(Color("Detail"))
        .cornerRadius(16)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}
