//
//  Archive.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/22.
//

import Foundation

struct Archive: Codable {

    /*
     내가 한 질문
     질문에서 받은 답변 (YES/NO)
     따랐나? 여부 (O/X)
     후기 (맨 밑에)
     */

    // let id: String
    let question: String
    let decision: String
    let review: String
    let isExcuted: Bool

//    let nickname: String?
//    let profileImage: String?
//    let count: Int?
//    let questions: [Question?]

//    let result: String
    //let question: String
//    let review: String
//    let activity: Bool
}

//struct Question: Codable {
//    let id: String?
//    let question: String?
//    let decision: String?
//    let review: String?
//    let isExcuted: Bool?
//}

extension Archive {
    static let dummy: [Archive] = [
        Archive(question: "30분 까지만 누워있을까?", decision: "YES", review: "솔직히 이제 일어나라 ㅋㅋ", isExcuted: true),
        Archive(question: "김밥 한 줄 먹고 잘까?", decision: "YES", review: "너였냐 1키로?", isExcuted: false),
        Archive(question: "오늘 치킨을 먹었나요?", decision: "NO", review: "후가작성 ㅜㅜ", isExcuted: true),
        Archive(question: "다음 기수 솝트 하지 말까?", decision: "NO", review: "솝트는 중독이야 ㅜㅜ", isExcuted: false),
        Archive(question: "솝커톤 신청할까?", decision: "YES", review: "후기를 작성해주세요", isExcuted: true),
        Archive(question: "오늘 기획 세미나 과제를 하고 잘까?", decision: "NO", review: "과제는 못 참지", isExcuted: true)
    ]
}
