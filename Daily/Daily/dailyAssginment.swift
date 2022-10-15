//
//  dailyAssginment.swift
//  Daily
//
//  Created by 詹子昊 on 2022/10/15.
//

import Foundation

struct dailyAssignmenet<LabelContent>{
    var wall: Array<Label>
    
    func choose(_ label: Label){
        print("label clicked: \(label)")
    }
    
    init(numberOfDailyAssignments: Int, labelContentFactory:(Int) -> LabelContent){
        wall = Array<Label>()
        for index in 0..<numberOfDailyAssignments{
            let content = labelContentFactory(index)
            wall.append(Label(content: content, id: index+1))
        }
    }
    
    struct Label: Identifiable{
        var content: LabelContent
        var isCheck: Bool = false
        var id: Int
    }
}
