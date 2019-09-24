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
    var selectedImageView = UIImageView()
    var nameLabel = UILabel()
    var contentLable = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.createCurrentCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCurrentCell(model:BaseModel) -> Void {
        self.nameLabel.text = model.name
        self.contentLable.text = model.content
        self.selectedImageView.isHidden = !model.isSelected
    }
    
    func createCurrentCell() -> Void {
        iconImageView = UIImageView.init(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
        nameLabel = UILabel.init(frame: CGRect(x: 70, y: 10, width: 100, height: 20))
        contentLable = UILabel.init(frame: CGRect(x: 70, y: 35, width: 100, height: 10))
        selectedImageView = UIImageView.init(frame: CGRect(x: UIScreen.main.bounds.size.width - 20, y: 30, width: 10, height: 10))
        selectedImageView.image = UIImage.init(named: "iconSelected")
        iconImageView.image = UIImage.init(named: "logo")
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        contentLable.font = UIFont.systemFont(ofSize: 10)
        
        self.contentView.addSubview(selectedImageView)
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(contentLable)
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
