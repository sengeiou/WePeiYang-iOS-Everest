//
//  FunctionListTableViewCell.swift
//  WePeiYang
//
//  Created by Allen X on 8/12/16.
//  Copyright © 2016 Qin Yubo. All rights reserved.
//

import UIKit
//import SnapKit

class FunctionListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    convenience init(iconName: String, desc: String) {
        self.init()

        var image = UIImage(named: iconName)!
        let imageSize = CGSize(width: 30, height: 30)
        image = UIImage.resizedImage(image: image, scaledToSize: imageSize)
        UIGraphicsBeginImageContext(imageSize)
        let imageRect = CGRect(origin: .zero, size: imageSize)
        image.draw(in: imageRect)
        imageView?.contentMode = .scaleAspectFit
        imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        textLabel?.text = desc
        return
        let iconView = UIImageView(imageName: iconName, desiredSize: CGSize(width: 30, height: 30))
    
        guard let foo = iconView else {
            return
        }
        
        
        contentView.addSubview(foo)
        
        iconView?.snp.makeConstraints {
            make in
            make.left.equalTo(contentView)
            make.centerY.equalTo(contentView)
        }
        
        let descLabel = UILabel(text: desc)
        contentView.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            make in
            make.left.equalTo(iconView!.snp.right).offset(5)
            make.centerY.equalTo(contentView)
        }
        
    }

}
