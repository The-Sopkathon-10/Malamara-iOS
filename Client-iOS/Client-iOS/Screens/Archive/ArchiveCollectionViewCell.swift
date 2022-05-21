//
//  ArchiveCollectionViewCell.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/22.
//

import Foundation
import UIKit

import SnapKit
import Kingfisher

class ArchiveCollectionViewCell: UICollectionViewCell {
    /*
     내가 한 질문
     질문에서 받은 답변 (YES/NO)
     따랐나? 여부 (O/X)
     후기 (맨 밑에)
     */


    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "NO"
        label.textColor = UIColor(red: 1, green: 0.346, blue: 0.106, alpha: 1)
        label.font = UIFont(name: "Inter-SemiBold", size: 40)
        return label
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 치킨을 먹을까요?"
        label.textColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 20)
        return label
    }()

    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "후기를 남겨주세요."
        label.textColor = UIColor(red: 0.421, green: 0.421, blue: 0.421, alpha: 1)

        label.font = UIFont(name: "NotoSansCJKKR-Regular", size: 14)
        return label
    }()

    private let activityLabel: UILabel = {
        let label = UILabel()
        label.text = "실행함"
        label.textColor = UIColor(red: 0.721, green: 0.721, blue: 0.721, alpha: 1)
        label.font = UIFont(name: "NotoSansCJKKR-Regular", size: 12)
        return label
    }()

    

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render() {
        self.addSubViews([cellBackgroundView, resultLabel, questionLabel, reviewLabel, activityLabel])

        cellBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        resultLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(21)
        }

        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(51)
            $0.leading.equalToSuperview().inset(23)
        }

        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(25)

        }

        activityLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview().inset(23)
        }

    }

    private func configUI() {
        self.backgroundColor = .clear
        cellBackgroundView.makeShadow(color: UIColor(red: 0.706, green: 0.706, blue: 0.706, alpha: 0.3), opacity: 1, offset: CGSize(width: 1, height: 3), radius: 5)
    }

    func update(data: Archive) {
        if data.result == "YES" {
            resultLabel.text = data.result
            resultLabel.textColor = UIColor(red: 0.675, green: 0.82, blue: 0.047, alpha: 1)
        } else {
            resultLabel.text = data.result
            resultLabel.textColor = UIColor(red: 1, green: 0.346, blue: 0.106, alpha: 1)
        }

        questionLabel.text = data.question
        reviewLabel.text = data.review

        if data.activity {
            activityLabel.text = "실행함"
        } else {
            activityLabel.text = "실행안함"
        }
    }
//
//    private func configUI() {
//        self.backgroundColor = .twitter_black
//        layer.cornerRadius = 16
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.twitter_gray50.cgColor
//        clipsToBounds = true
//    }
}
