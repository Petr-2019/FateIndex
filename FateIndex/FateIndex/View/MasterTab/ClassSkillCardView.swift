//
//  ClassSkillCardView.swift
//  FateIndex
//
//  Created by Peter-Guan on 2020/6/30.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import SwiftUI

struct ClassSkillCardView: View {
    let topTitle: String
    let avatar: String
    let name: String
    let desc: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            if topTitle != "" {
                Text(topTitle)
                    .font(.headline)
                    .foregroundColor(Color(hex: colorScheme == .dark ? 0x5AFAFE : 0xA3DDAA)) 
                .padding()
            }

            HStack {
                Spacer()
                Image(avatar)
                .resizable()
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 10)
                .frame(width: 65, height: 65)
                .padding()

                Spacer()
                HStack {
                    VStack {
                        Text(name)
                            .font(.headline)

                        Text(desc)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
                .frame(minWidth: 240, idealWidth: 240, maxWidth: 240)

                Spacer()
            }
        }
        .background(Color(hex: colorScheme == .dark ? 0x292C2C : 0xFFFFFF))
    }
}

struct ClassSkillCardView_Previews: PreviewProvider {
    static var previews: some View {
        ClassSkillCardView(topTitle: "在战斗中自动发动效果的技能", avatar: "气息遮断", name: "气息遮断 D", desc: "自身的星星发生率少量提升（4%）")
    }
}
