//
//  ReviewPopUpViewController.swift
//  Client-iOS
//
//  Created by 황찬미 on 2022/05/22.
//

import UIKit

class ReviewPopUpViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 30
    }
    
    @IBAction func completeButton(_ sender: UIButton) {
        let arvc = ArchiveViewController()
        self.present(arvc, animated: true)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
    }
    
    
}
