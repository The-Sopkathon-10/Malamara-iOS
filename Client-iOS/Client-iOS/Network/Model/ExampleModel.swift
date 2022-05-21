//
//  ExampleModel.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/21.
//

import Foundation

/// 그냥 예시 모델 = 과제 기준 

struct SignIn: Codable {
    let name, email: String
}

struct SignUp: Codable {
    let id: Int
}
