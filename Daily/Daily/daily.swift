//
//  daily.swift
//  Daily
//
//  Created by 詹子昊 on 2022/10/15.
//

import Foundation
import SwiftUI

class assignTasks: ObservableObject{
    @Published private var model: dailyAssignmenet<String> = assignTasks.createTasks()
    
    private static func createTasks() -> dailyAssignmenet<String>{
        let userInput = ["I will play the studio game", "Watch the movie with my girl firend"]
        return dailyAssignmenet<String>(numberOfDailyAssignments: userInput.count){ index in
            return userInput[index]
        }
    }
}


