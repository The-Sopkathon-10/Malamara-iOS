//
//  QuestionService.swift
//  Client-iOS
//
//  Created by 황찬미 on 2022/05/22.
//

import Foundation
import Alamofire

class QuestionService : BaseService {
    static let shared = QuestionService()
    private override init() { }

    /// [POST] 로그인
    func questionResult(userId: String, question: String, decision: String, isLiked: Bool, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(QuestionRouter.questionResult(userId: userId, question: question, decision: decision, isLiked: isLiked))
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                
                print(statusCode)
                
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, QuestionResponse.self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
//    /// [POST] 회원가입
//    func requestSignUp(email: String, name: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
//        AFmanager.request(AuthRouter.signUp(email: email, name: name, pw: pw))
//            .validate(statusCode: 200...500)
//            .responseData { response in
//                switch response.result {
//                case .success:
//                    guard let statusCode = response.response?.statusCode else { return }
//                    guard let data = response.data else { return}
//                    let networkResult = self.judgeStatus(by: statusCode, data, SignUp.self)
//
//                    completion(networkResult)
//
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//    }
}
