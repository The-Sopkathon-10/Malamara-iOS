//
//  ArchiveViewController.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/22.
//

import Foundation
import UIKit

import SnapKit

class ArchiveViewController: UIViewController {

    private var archiveList: [Archive] = Archive.dummy

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profileimg")
        iv.layer.cornerRadius = iv.frame.height / 2
        iv.clipsToBounds = true
        return iv
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "결정어려워님,"
        label.font = UIFont(name: "NotoSansCJKKR-Medium", size: 20)
        label.textColor = .black
        return label
    }()

    private let userWorryLabel: UILabel = {
        let label = UILabel()
        label.text = "N개의 고민이 말아졌어요"
        label.font = UIFont(name: "NotoSansCJKKR-Regular", size: 20)
        label.textColor = .black
        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        button.press {
            self.dismiss(animated: true)
        }
        return button
    }()

    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_setting"), for: .normal)
        return button
    }()

    private lazy var archiveListCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(width: 343.adjusted, height: 150.adjustedH)
        flowLayout.itemSize = CGSize(width: 343.adjusted, height: 150.adjustedH)
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(cell: ArchiveCollectionViewCell.self)
        collectionView.layer.backgroundColor = UIColor(red: 0.946, green: 0.946, blue: 0.946, alpha: 1).cgColor
        return collectionView
    }()


    override func viewWillAppear(_ animated: Bool) {
        // getUserArchive()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setGesture()
        render()
    }


    private func configUI() {
        view.backgroundColor = .white
        archiveListCollectionView.dataSource = self
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }

    private func render() {
        view.addSubViews([profileImageView, userNameLabel, userWorryLabel, backButton, archiveListCollectionView, settingButton])

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(64)
        }
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true

        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }

        userWorryLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(18)
        }

        archiveListCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(206)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(44)
        }

        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(44)
        }
    }

    private func applyUsername(to userName: String) {
        userNameLabel.text = "\(userName)님 Instargram에 \n 오신 것을 환영합니다"
    }

    private func updateProfile(data: User) {
        if let url = URL(string: data.imageUrl ?? "") {
            profileImageView.kf.setImage(with: url)
        }
        // categoryTitleLabel.text = data.title
    }

//    private func getUserArchive() {
//        ArchiveService.shared.requestGetUser(id: "6288f9cbaa918a3a19832bc4") {
//            result in
//                switch result {
//                case .success(let data):
//                    if let data = data as? [Archive] {
//                        print("되는지?")
//                    }
//                case .requestErr(_):
//                    print("rquestErr")
//                case .pathErr:
//                    print("pathErr")
//                case .serverErr:
//                    print("serverErr")
//                case .networkFail:
//                    print("networkFail")
//                }
//        }
//    }


    private func setGesture() {
        let tapPressRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))

        self.archiveListCollectionView.addGestureRecognizer(tapPressRecognizer)
    }

    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        guard let memo = UIStoryboard(name: "ReviewPopUp", bundle: nil).instantiateViewController(withIdentifier: "ReviewPopUpViewController") as? ReviewPopUpViewController else { return }
        self.present(memo, animated: true)
    }
}

extension ArchiveViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return archiveList.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ArchiveCollectionViewCell
        cell.update(data: archiveList[indexPath.row])
        return cell

    }
}

extension ArchiveViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let memo = UIStoryboard(name: "ReviewPopUp", bundle: nil).instantiateViewController(withIdentifier: "ReviewPopUpViewController") as? ReviewPopUpViewController else { return }
        self.present(memo, animated: true)
    }
}
