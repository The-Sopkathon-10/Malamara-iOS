//
//  HomeViewController.swift
//  Client-iOS
//
//  Created by subinyoon on 2022/05/22.
//

import UIKit
import Lottie

final class HomeViewController: UIViewController {

    
    public var randomNum: Int?
    
    @IBOutlet weak var archiveButton: UIButton!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var playButton: UIButton! {
        didSet {
            playButton.isEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottieView()
        setDelegate()
        setUI()
    }
    
    @IBAction func questionEditingChanged(_ sender: Any) {
        guard let count = questionTextField.text?.count else { return }
        checkMaxLength(textField: questionTextField, maxLength: 12)
        labelCount.text = "\(count)/12"
        if questionTextField.hasText != true {
            playButton.isEnabled = false
        }
        playButton.isEnabled = true
    }
    
    @IBAction func playButtonDidTap(_ sender: Any) {
        
        randomNum = Int.random(in: 0..<2)
//        print(randomNum)

        if(randomNum == 0){
            yesLottieView.isHidden = false
            noLottieView.isHidden = true
            yesLottieView.play()
            // Yes로 서버 통신 보내고 팝업 창 띄우기
        } else {
            noLottieView.isHidden = false
            yesLottieView.isHidden = true
            noLottieView.play()
            // No로 서버 통신 보내고 팝업 창 띄우기
        }

    }
    
    @IBAction func archiveButtonDidTap(_ sender: Any) {
        let arvc = ArchiveViewController()
        arvc.modalPresentationStyle = .fullScreen
        self.present(arvc, animated: true)
    }
    
    private func setUI() {
        playButton.makeShadow(color: UIColor(red: 0.704, green: 0.704, blue: 0.704, alpha: 0.3), opacity: 1, offset: CGSize(width: 1, height: 3), radius: 5)
        hideKeyboardWhenTappedAround()
    }

    private func setDelegate() {
        questionTextField.delegate = self
    }
    
    private func setLottieView () {
        view.addSubview(yesLottieView)
        view.addSubView(noLottieView)
    }
    
    private lazy var yesLottieView: AnimationView = {
        let animationView = AnimationView(name: "yes_2")
        animationView.frame = CGRect(x: 0, y: 0, width: 375, height: 375)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true

        return animationView
    }()
    
    private lazy var noLottieView: AnimationView = {
        let animationView = AnimationView(name: "no")
        animationView.frame = CGRect(x: 0, y: 0, width: 375, height: 375)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true

        return animationView
    }()
    
}

extension HomeViewController: UITextFieldDelegate {
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text?.count ?? 0 > maxLength) {
            textField.deleteBackward()
        }
    }
}
