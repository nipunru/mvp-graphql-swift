//
//  Extensions.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-01.
//

import UIKit

/*
 Since this is a small project,
 Created this file to maintaing all extensions.
 The best way is to create seperate file per each.
 */

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    static func squreImage(_ size: Int, _ defaultImage: String) -> UIImageView {
        let view = UIImageView(frame: .init(x: 0, y: 0, width: size, height: size))
        view.image = UIImage(named: defaultImage)
        return view
    }
    
    static func roundedImage(_ size: Int, _ defaultImage: String) -> UIImageView {
        let view = UIImageView(frame: .init(x: 0, y: 0, width: size, height: size))
        view.image = UIImage(named: defaultImage)
        view.makeRounded()
        view.contentMode = .scaleAspectFit
        return view
    }
}

extension UIView {
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

extension UILabel {
    static func titleMain(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Sans W6", size: 28)
        label.text = text
        return label
    }
    
    static func titleSub(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Sans W6", size: 20)
        label.text = text
        return label
    }
    
    static func textBold(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Sans W6", size: 14)
        label.text = text
        return label
    }
    
    static func textNormal(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Sans W3", size: 14)
        label.text = text
        return label
    }
    
    static func textBoldUnderline(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Sans W6", size: 14)
        if text != nil {
            let underlineAttriString = NSAttributedString(string: text!,
                                                          attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
            label.attributedText = underlineAttriString
        }
        return label
    }
}

extension UICollectionView {
    static func horizontalCollectionView(frame: CGRect, sectionInset: UIEdgeInsets, itemSize: CGSize) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInset
        layout.itemSize = itemSize
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }
    
    static func verticalCollectionView(frame: CGRect, sectionInset: UIEdgeInsets, itemSize: CGSize) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInset
        layout.itemSize = itemSize
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }

}
