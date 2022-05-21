//
//  Archive.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/22.
//

import Foundation

struct Archive {

    /*
     내가 한 질문
     질문에서 받은 답변 (YES/NO)
     따랐나? 여부 (O/X)
     후기 (맨 밑에)
     */

    let result: String
    let question: String
    let review: String
    let activity: Bool
}

extension Archive {
    static let dummy: [Archive] = [
        Archive(result: "NO", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: true),
        Archive(result: "YES", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: false),
        Archive(result: "NO", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: true),
        Archive(result: "YES", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: false),
        Archive(result: "NO", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: false),
        Archive(result: "NO", question: "오늘 치킨을 먹었나요?", review: "후기작성야야야", activity: true)
    ]
}
