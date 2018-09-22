//
//  UIView+Extension.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

public extension UIView {
    public func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints
        if translatesAutoresizingMaskIntoConstraints {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        } else {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        }
    }
    
    public func screenShot(width w:CGFloat? = nil) -> UIImage? {
        let width:CGFloat = w ?? self.frame.width
        let imageBounds = CGRect(x: 0, y: 0, width: width, height: bounds.size.height * (width / bounds.size.width))
        
        UIGraphicsBeginImageContextWithOptions(imageBounds.size, true, 0)
        
        drawHierarchy(in: imageBounds, afterScreenUpdates: true)
        
        var image: UIImage?
        let contextImage = UIGraphicsGetImageFromCurrentImageContext()
        
        if let contextImage = contextImage, let cgImage = contextImage.cgImage {
            image = UIImage(
                cgImage: cgImage,
                scale: UIScreen.main.scale,
                orientation: contextImage.imageOrientation
            )
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
