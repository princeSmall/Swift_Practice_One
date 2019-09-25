//
//  BaseTableViewCell.swift
//  OneDay
//
//  Created by le tong on 2019/9/24.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var iconImageView = UIImageView()
    var selectedButton = UIButton()
    var nameLabel = UILabel()
    var contentLable = UILabel()
    
    typealias selectedBlock = (Bool)->(Void)
    var functionBlock: selectedBlock!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.createCurrentCell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCurrentCell(model:BaseModel) -> Void {
        nameLabel.text = model.name
        contentLable.text = model.content
        selectedButton.isSelected = model.isSelected
        
    }
    @objc func selectedButtonAction() -> Void {
        self.selectedButton.isSelected = !self.selectedButton.isSelected
        self.functionBlock(selectedButton.isSelected)
    }
    
    
    func createCurrentCell() -> Void {
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
        nameLabel = UILabel.init(frame: CGRect(x: 70, y: 10, width: 100, height: 20))
        contentLable = UILabel.init(frame: CGRect(x: 70, y: 35, width: 100, height: 10))
        selectedButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.size.width - 20, y: 20, width: 20, height: 20))
        selectedButton.setImage(UIImage.init(named: "iconSelected"), for: UIControl.State.normal)
        selectedButton.setImage(UIImage.init(named: "iconUnSelected"), for: UIControl.State.selected)
        selectedButton.addTarget(self, action: #selector(selectedButtonAction), for: UIControl.Event.touchUpInside)
        iconImageView.image = UIImage.init(named: "logo")
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        contentLable.font = UIFont.systemFont(ofSize: 10)
        
        contentView.addSubview(selectedButton)
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(contentLable)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
