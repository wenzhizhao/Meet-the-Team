//
//  DetailInfoViewController.swift
//  Meet the Team
//
//  Created by Wenzhi Zhao on 8/18/18.
//  Copyright © 2018 Wenzhi Zhao. All rights reserved.
//

import UIKit

class DetailInfoViewController: UIViewController {
    static let identifier: String = "DetailVC"
    private var profileImage: UIImage?
    private var teamMember : TeamMember?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    @IBOutlet weak var preferencesLabel: UILabel!
    @IBOutlet weak var clearContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawHeaderView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        clearContainerView.isUserInteractionEnabled = false
        if let image = profileImage, let member = teamMember {
            populateUI(with: member, and: image)
        }
    }

    func configure(with teamMember: TeamMember, and image: UIImage?) {
        profileImage = image
        self.teamMember = teamMember
    }

    private func drawHeaderView() {
        let headerTriangle = TriangleView(frame: CGRect(x: -2, y: self.clearContainerView.frame.size.height - 100 - 5, width: self.view.frame.size.width + 4 , height: 100 + 5))
        headerTriangle.backgroundColor = UIColor.clear
        clearContainerView.addSubview(headerTriangle)
    }
    
    private func populateUI(with teamMember: TeamMember, and image: UIImage) {
        if let image = profileImage {
            profileImageView.image = image
        }
        title = getFirstName(from: (teamMember.name ?? ""))
        nameLabel.text = teamMember.name
        positionLabel.text = teamMember.position
        personalityLabel.text = teamMember.personality
        interestsLabel.text = teamMember.interests
        preferencesLabel.text = teamMember.datingPreferences
    }
    
    private func getFirstName(from fullName: String) -> String {
        return fullName.components(separatedBy: " ").first ?? fullName
    }

}

class TriangleView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX + 2, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.minX + 2, y: rect.minY + 5))
        context.addLine(to: CGPoint(x: rect.maxX - 2, y: rect.maxY))
        context.closePath()
        context.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.fillPath()
        
        let contextLine = UIGraphicsGetCurrentContext()
        contextLine?.setLineWidth(5.0)
        contextLine?.setStrokeColor(UIColor(red: 44/255.0, green: 138/255.0, blue: 231/255.0, alpha: 1.0).cgColor)
        contextLine?.move (to: CGPoint(x: rect.minX, y: rect.minY + 2))
        contextLine?.addLine (to: CGPoint(x: rect.maxX, y: rect.maxY))
        contextLine?.strokePath()
    }
}
