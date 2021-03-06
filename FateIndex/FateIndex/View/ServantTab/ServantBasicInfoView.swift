//
//  ServantBasicInfoView.swift
//  FateIndex
//
//  Created by Peter-Guan on 2020/6/22.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import SwiftUI

struct ServantBasicInfoView: View {
    
    let servantBasicInfo: ServantBasicInfo

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if !(servantBasicInfo.cost == "0" || servantBasicInfo.id == "107") {
                Image(servantCostImage())
            }
            
            Image(servantClassImage())
                .resizable()
                .frame(width: 55, height: 55)
            
            PageView(imagePageView())
                .frame(width: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height), height: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) * 724 / 512) // 512 724
            
            Group {
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("昵称")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        Text(concatenateTexts(texts: servantBasicInfo.nickNames))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Text("画师")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.illustrator)
                    }
                    Spacer()
                }

                HStack {
                    Spacer()

                    VStack {
                        Text("声优")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.castVoice)
                    }

                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("身高")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.height)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("体重")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.weight)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("地域")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.region)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("出处")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.source)
                    }
                    
                    Spacer()
                }
            }
            
            Group {
                HStack {
                    Image(mapCardImage(card: servantBasicInfo.cards[0]))
                        .resizable()
                        .clipped()
                        .frame(width: 65, height: 65)
                    
                    Image(mapCardImage(card: servantBasicInfo.cards[1]))
                        .resizable()
                        .clipped()
                        .frame(width: 65, height: 65)
                    
                    Image(mapCardImage(card: servantBasicInfo.cards[2]))
                        .resizable()
                        .clipped()
                        .frame(width: 65, height: 65)
                    
                    Image(mapCardImage(card: servantBasicInfo.cards[3]))
                        .resizable()
                        .clipped()
                        .frame(width: 65, height: 65)
                    
                    Image(mapCardImage(card: servantBasicInfo.cards[4]))
                        .resizable()
                        .clipped()
                        .frame(width: 65, height: 65)
                }
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("属性")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.attribute)
                    }
                    
                    Spacer()
                }

                HStack {
                    Spacer()
                    
                    VStack {
                        Text("特性")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(concatenateTexts(texts: servantBasicInfo.tokusei))
                    }
                    
                    Spacer()
                }

                HStack {
                    Spacer()
                    
                    VStack {
                        Text("入手方式")
                            .font(.headline)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        Text(servantBasicInfo.access)
                    }
                    
                    Spacer()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .background(Color(hex: colorScheme == .dark ? 0x292C2C : 0xFFFFFF))
        .padding()
    }
    
    private func imagePageView() -> [Image] {
        var images = [Image]()
        var i = 1
        while i <= 10 {
            if let _ = UIImage(named: "servant-\(servantBasicInfo.id)-\(i)") {
                var image = Image("servant-\(servantBasicInfo.id)-\(i)")
                image = image.resizable()
                images.append(image)
            }
            else {
                break
            }
            i += 1
        }
        
        return images
    }
    
    private func mapCardImage(card: String) -> String {
        if card == "1" {
            return "Quick"
        }
        else if card == "2" {
            return "Arts"
        }
        else {
            return "Buster"
        }
    }
    
    private func concatenateTexts(texts: [String]) -> String {
        var text = ""
        for (index, t) in texts.enumerated() {
            if index == texts.count - 1 {
                text += "\(t)"
            }
            else {
                text += "\(t) "
            }
        }
        
        return text
    }
    
    private func servantClassImage() -> String {
        let color: String = {
            if servantBasicInfo.cost == "16" || servantBasicInfo.cost == "12" {
                return "golden"
            }
            else if servantBasicInfo.cost == "7" {
                return "silver"
            }
            else {
                return "copper"
            }
        }()
        
        // golden_alterego
        if servantBasicInfo.id == "1" {
            return "golden_shielder"
        }
        else if servantBasicInfo.servantClass == "foreigner" {
            return "golden_foreigner"
        }
        else if servantBasicInfo.id == "107" {
            return "black_\(servantBasicInfo.servantClass)"
        }
        else {
            return "\(color)_\(servantBasicInfo.servantClass)"
        }
    }
    
    private func servantCostImage() -> String {
        if servantBasicInfo.cost == "16" {
            return "five_stars"
        }
        else if servantBasicInfo.cost == "12" {
            return "four_stars"
        }
        else if servantBasicInfo.cost == "7" {
            return "three_stars"
        }
        else if servantBasicInfo.cost == "4" {
            return "two_stars"
        }
        else {
            return "one_star"
        }
    }
}

struct ServantBasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ServantBasicInfoView(servantBasicInfo: ServantStore.shared.allBasicInfos()["215"]!)
    }
}
