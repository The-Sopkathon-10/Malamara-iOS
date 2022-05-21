//
//  CustomPopUpViewController.swift
//  Client-iOS
//
//  Created by 황찬미 on 2022/05/22.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func noButtonDidTap(_ sender: UIButton) {
        // 메인으로 이동
//        guard let mainVC = UIStoryboard(name: "이름").instantiateViewController(withIdentifier: "이름") as? 이름 else { return }
        dismiss(animated: true)
        
    }
    
    
    @IBAction func yesButtonDidTap(_ sender: UIButton) {
        // text 서버로 연결 ...?
    }
}
