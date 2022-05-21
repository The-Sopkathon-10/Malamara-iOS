//
//  CustomPopUpViewController.swift
//  Client-iOS
//
//  Created by 황찬미 on 2022/05/22.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    var question = ""
    var decision = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.layer.cornerRadius = 30
    }

    @IBAction func noButtonDidTap(_ sender: UIButton) {
        // 메인으로 이동
        QuestionService.shared.questionResult(userId: "6288f9cbaa918a3a19832bc4", question: question, decision: decision, isLiked: false) { response in
            
            print(response)
            switch response {
            case .success(let data):
                print(data)
            default:
                return
            }
        }
        dismiss(animated: true)
    }
    
    
    @IBAction func yesButtonDidTap(_ sender: UIButton) {
        QuestionService.shared.questionResult(userId: "6288f9cbaa918a3a19832bc4", question: question, decision: decision, isLiked: true) { response in
            
            print(response)
            switch response {
            case .success(let data):
                print(data)
            default:
                return
            }
        }
        let ar = ArchiveViewController()
        self.present(ar, animated: true)
    }
}
