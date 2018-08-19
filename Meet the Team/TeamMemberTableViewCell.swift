//
//  TeamMemberTableViewCell.swift
//  Meet the Team
//
//  Created by Wenzhi Zhao on 8/18/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {

    static let identifier: String = "infoCell"
    var profileImage: UIImage?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpImageView()
    }
    
    func configureCell(_ teamMember: TeamMember) {
        setImage(teamMember.profileImageUrl ?? "")
        nameLabel.text = teamMember.name
        jobLabel.text = teamMember.position
    }
    
    func setImage(_ ulrString: String) {
        guard let url = URL(string: ulrString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.profileImage = image
                self?.profileImageView.image = image
            }
            }.resume()
    }
    
    private func setUpImageView() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor(red: 14/255.0, green: 125/255.0, blue: 229/255.0, alpha: 1.0).cgColor
    }
}
