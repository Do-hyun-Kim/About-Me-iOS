//
//  HomeAfterCollectionViewCell.swift
//  About-Me-iOS
//
//  Created by Kim dohyun on 2021/04/19.
//

import UIKit

class HomeAfterCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var homeAfterTagButton: UIButton!
    @IBOutlet weak var homeAfterContainerView: UIView!
    @IBOutlet weak var homeAfterTitleLabel: UILabel!
    @IBOutlet weak var homeAfterSubjectLabel: UILabel!
    @IBOutlet weak var homeAfterEditButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setLayoutInit()
    }
    private func setLayoutInit() {
        self.homeAfterContainerView.layer.borderColor = UIColor.clear.cgColor
        self.homeAfterContainerView.layer.cornerRadius = 20
        self.homeAfterContainerView.layer.masksToBounds = true
        self.homeAfterContainerView.backgroundColor = UIColor.white
        self.homeAfterTitleLabel.numberOfLines = 0
        self.homeAfterTitleLabel.textAlignment = .left
        self.homeAfterTitleLabel.font = UIFont(name: "GmarketSansMedium", size: 20)
        self.homeAfterTitleLabel.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
        self.homeAfterSubjectLabel.numberOfLines = 0
        self.homeAfterSubjectLabel.textAlignment = .left
        self.homeAfterSubjectLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        self.homeAfterSubjectLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        self.homeAfterSubjectLabel.lineBreakMode = .byTruncatingTail
        self.homeAfterTagButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        self.homeAfterTagButton.titleLabel?.textAlignment = .center
        self.homeAfterTagButton.setTitleColor(.white, for: .normal)
        self.homeAfterTagButton.layer.masksToBounds = true
        self.homeAfterTagButton.layer.cornerRadius = 3
        self.homeAfterTagButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        self.homeAfterTagButton.isEnabled = false
    }
}
