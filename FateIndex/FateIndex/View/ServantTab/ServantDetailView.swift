//
//  ServantDetailView.swift
//  FateIndex
//
//  Created by Peter-Guan on 2020/6/19.
//  Copyright © 2020 FoxHound-Peter-Guan. All rights reserved.
//

import SwiftUI

struct ServantDetailView: View {
    @State private var selectedSegment = 0
    
    private let segments = ["基础信息", "能力", "技能", "资料"]
    
    let servantId: String
    
    var body: some View {
        VStack {
            ScrollView {
                Picker("Numbers", selection: $selectedSegment.onChange(segmentChange)) {
                    ForEach(0..<segments.count) { index in
                        Text(self.segments[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if selectedSegment == 0 {
                    basicInfoView()
                }
                else if selectedSegment == 3 {
                    SectionContentView(story: servantStory())
                }
                else {
                    ContentView()
                }
            }
            
        }
        .navigationBarTitle(basicInfoTitle())
    }
    
    private func segmentChange(_ tag: Int) {
        let selectionFeedback = UISelectionFeedbackGenerator()
        selectionFeedback.selectionChanged()
    }
    
    private func basicInfoView() -> AnyView {
        let basicInfo = ServantStore.shared.basicInfo(servantId: servantId)
        return AnyView(ServantBasicInfoView(servantBasicInfo: basicInfo))
    }
    
    private func basicInfoTitle() -> String {
        let basicInfo = ServantStore.shared.basicInfo(servantId: servantId)
        return basicInfo.name
    }

    private func servantStory() -> ServantStory {
        return ServantStore.shared.servantStories[servantId] ?? ServantStory(id: "", detail: "", story1: "", story2: "", story3: "", story4: "", story5: "", story6: "")
    }
}

struct ServantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServantDetailView(servantId: "1")
    }
}
