//
//  GivenServantView.swift
//  FateIndex
//
//  Created by Peter-Guan on 2020/6/5.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import SwiftUI

struct GivenServantView: View {

    var campaignServant: CampaignServant

    var body: some View {
        Button(
            action: {
                print("hello")
        },
            label: {
                VStack {
                    Spacer()

                    Text(campaignServant.campaignName)
                        .foregroundColor(Color.white)
                        .padding(12)
                }
                .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 282, idealHeight: 282, maxHeight: 282, alignment: .topLeading)
                .background(
                    ZStack(alignment: .topLeading) {

                        Image(campaignServant.campaignImg)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 282, idealHeight: 282, maxHeight: 282, alignment: .topLeading)

                        LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
                            .opacity(0.8)
                            .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 282, idealHeight: 282, maxHeight: 282, alignment: .topLeading)
                })
                    .padding(0)
                    .cornerRadius(20)
        })
        .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 282, idealHeight: 282, maxHeight: 282, alignment: .topLeading)
    }
}

struct GivenServantView_Previews: PreviewProvider {
    static var previews: some View {
        GivenServantView(campaignServant: CampaignServant(id: "", campaignName: "", campaignImg: ""))
    }
}