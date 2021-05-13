//
//  HomeAfterViewController.swift
//  About-Me-iOS
//
//  Created by Kim dohyun on 2021/04/19.
//

import UIKit
import Floaty

class HomeAfterViewController: UIViewController {
    @IBOutlet weak var homeAfterCollectionView: UICollectionView!
    @IBOutlet weak var homeAfterFloaingButton: Floaty!
    @IBOutlet weak var homeAfterBackgroundImageView: UIImageView!
    @IBOutlet var homeAfterEditBottomSheetView: EditBottomSheet!
    public var titleText: String = ""
    public var backgroundColor: String = ""
    public var screenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayoutInit()
    }
    
    
    private func setLayoutInit() {
        let cellWidth = floor(view.frame.width * 0.85)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellWidth, height: 420)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: date)
        self.navigationItem.title = dateString
        self.homeAfterCollectionView.delegate = self
        self.homeAfterCollectionView.dataSource = self
        self.homeAfterCollectionView.backgroundColor = .clear
        self.homeAfterCollectionView.collectionViewLayout = layout
        let nib = UINib(nibName: "HomeAfterCollectionViewCell", bundle: nil)
        self.homeAfterCollectionView.register(nib, forCellWithReuseIdentifier: "HomeAfterCell")
        self.homeAfterFloaingButton.buttonColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
        self.homeAfterFloaingButton.plusColor = UIColor.white
        self.homeAfterFloaingButton.addItem("오늘의 질문", icon: UIImage(named: "Write.png"))
        self.homeAfterFloaingButton.addItem("자문 자답", icon: UIImage(named: "SelfQuestion.png")) { item in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let advisoryAnswerView = storyboard.instantiateViewController(withIdentifier: "AdvisoryAnswerVC") as? AdvisoryAnswerViewController
            guard let advisoryAnswerVC = advisoryAnswerView else { return }
            self.navigationController?.pushViewController(advisoryAnswerVC, animated: true)
        }
        self.homeAfterFloaingButton.addItem("내 피드", icon: UIImage(named: "Feed.png"))
        if self.backgroundColor == "red" {
            self.homeAfterBackgroundImageView.image = UIImage(named: "imgBackgroundRed.png")
        } else if self.backgroundColor == "yellow" {
            self.homeAfterBackgroundImageView.image = UIImage(named: "imgBackgroundYellow.png")
        } else if self.backgroundColor == "green" {
            self.homeAfterBackgroundImageView.image = UIImage(named: "imgBackgroundGreen.png")
        } else if self.backgroundColor == "pink" {
            self.homeAfterBackgroundImageView.image = UIImage(named: "imgBackgroundPink.png")
        } else if self.backgroundColor == "purple" {
            self.homeAfterBackgroundImageView.image = UIImage(named: "imgBackgroundViolet.png")
        }
    }
    
    
    private func editBottomSheetLayoutInit() {
        self.homeAfterEditBottomSheetView.frame = CGRect(x: 0, y: self.screenSize.height, width: self.screenSize.width, height: 224)
        self.homeAfterEditBottomSheetView.gestureView.layer.cornerRadius = 10
        self.homeAfterEditBottomSheetView.gestureView.layer.masksToBounds = true
        self.homeAfterEditBottomSheetView.layer.cornerRadius = 10
        self.homeAfterEditBottomSheetView.layer.masksToBounds = true
        self.homeAfterEditBottomSheetView.editButton.addTarget(self, action: #selector(self.homeAfterEditButtonDidTap(_:)), for: .touchUpInside)
        self.homeAfterEditBottomSheetView.deleteButton.addTarget(self, action: #selector(self.homeAfterDeleteButtonDidTap(_:)), for: .touchUpInside)
    }
    
    
    @objc
    private func showEditBottomSheetDidTap(_ sender: UIButton) {
        let window = UIApplication.shared.windows.first
        let screenSize = UIScreen.main.bounds.size
        window?.addSubview(self.homeAfterEditBottomSheetView)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.homeAfterEditBottomSheetView.frame = CGRect(x: 0, y: screenSize.height - 224, width: screenSize.width, height: 224 + self.view.safeAreaInsets.bottom)
        })
    }
    
    
    private func deleteHomeCardList() {
        print(UserDefaults.standard.integer(forKey: "homeBeforeSeq"))
        HomeServerApi.deleteHomeCardList(seq: UserDefaults.standard.integer(forKey: "homeBeforeSeq")) { result in
            if case let .success(data) = result, let list = data {
                print(list)
                self.navigationController?.popViewController(animated: true)
            } else if case let .failure(error) = result {
                let alert = UIAlertController(title: "Delete Error Message", message: error, preferredStyle: .alert)
                let alertButton = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(alertButton)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // TODO: - APIRequest
    
    private func editHomeCardList() {

    }
    
    
    @objc
    private func homeAfterEditButtonDidTap(_ sender: UIButton) {
        
    }
    
    
    @objc
    private func homeAfterDeleteButtonDidTap(_ sender: UIButton) {
        self.deleteHomeCardList()
    }
    
}


extension HomeAfterViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeAfterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeAfterCell", for: indexPath) as? HomeAfterCollectionViewCell
        self.editBottomSheetLayoutInit()
        if self.backgroundColor == "red" {
            homeAfterCell?.homeAfterTagButton.backgroundColor = UIColor(red: 255/255, green: 98/255, blue: 98/255, alpha: 1.0)
            homeAfterCell?.homeAfterTagButton.setTitle("열정충만", for: .normal)
        } else if self.backgroundColor == "yellow" {
            homeAfterCell?.homeAfterTagButton.backgroundColor = UIColor(red: 242/255, green: 194/255, blue: 23/255, alpha: 1.0)
            homeAfterCell?.homeAfterTagButton.setTitle("소소한일상", for: .normal)
        } else if self.backgroundColor == "green" {
            homeAfterCell?.homeAfterTagButton.backgroundColor = UIColor(red: 31/255, green: 176/255, blue: 115/255, alpha: 1.0)
            homeAfterCell?.homeAfterTagButton.setTitle("기억상자", for: .normal)
        } else if self.backgroundColor == "pink" {
            homeAfterCell?.homeAfterTagButton.backgroundColor = UIColor(red: 231/255, green: 79/255, blue: 152/255, alpha: 1.0)
            homeAfterCell?.homeAfterTagButton.setTitle("관계의미학", for: .normal)
        } else {
            homeAfterCell?.homeAfterTagButton.backgroundColor = UIColor(red: 159/255, green: 88/255, blue: 251/255, alpha: 1.0)
            homeAfterCell?.homeAfterTagButton.setTitle("상상플러스", for: .normal)
        }
        homeAfterCell?.homeAfterTitleLabel.text = "\(self.titleText)"
        homeAfterCell?.homeAfterSubjectLabel.text = "\(UserDefaults.standard.string(forKey: "myQuestionText")!)"
        homeAfterCell?.homeAfterEditButton.addTarget(self, action: #selector(self.showEditBottomSheetDidTap(_:)), for: .touchUpInside)
        return homeAfterCell!
    }
    
}


class EditBottomSheet: UIView {
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var gestureView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
