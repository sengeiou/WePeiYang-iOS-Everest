//
//  WPYTabBarController.swift
//  WePeiYang
//
//  Created by Allen X on 4/8/17.
//  Copyright © 2017 twtstudio. All rights reserved.
//

import UIKit

class WPYTabBarController: UITabBarController {
    
    private let tabBarVCDelegate = WPYTabBarControllerDelegate()
    
    convenience init(viewControllers: [UIViewController]?) {
        self.init()
        
        guard viewControllers != nil else {
            //TODO: log
            //log.error
            return
        }
        setViewControllers(viewControllers, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false

        delegate = tabBarVCDelegate

        selectedIndex = 0
        tabBar.backgroundColor = Metadata.Color.GlobalTabBarBackgroundColor
        tabBar.tintColor = Metadata.Color.WPYAccentColor
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = Metadata.Color.grayIconColor
        } else {
            // Fallback on earlier versions
            // Repaint the tabBar item icon image's color and use original color instead of the tintColor
            
        }
        
        UIApplication.shared.applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()
    }

//    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
//        super.motionBegan(motion, with: event)
////        print("开始摇动")
//    }
//
//    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
//        super.motionCancelled(motion, with: event)
////        print("取消摇动")
//    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        if let event = event, event.subtype == .motionShake {
//            let isOnline = (CacheManager.loadGroupCache(withKey: "isOnline") as? Bool) ?? false
//            if isOnline {
//
//            } else {
//
//            }
            WLANHelper.login(success: {
                SwiftMessages.hideAll()
                SwiftMessages.showSuccessMessage(body: "已连接到校园网")
//                CacheManager.saveGroupCache(with: true, key: "isOnline")
            }, failure: { msg in
                SwiftMessages.hideAll()
                SwiftMessages.showErrorMessage(body: msg)
            })
//            print("摇动结束")
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //TODO: View Controller Transitioning Animation
        
        //print("fuck")
        
    }

}


extension WPYTabBarController: ThemeChanging {
    func changeInto(theme: WPYTheme) {
        
    }
}


class WPYTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let fromIndex = tabBarController.viewControllers!.index(of: fromVC)!
        let toIndex = tabBarController.viewControllers!.index(of: toVC)!
        
        let tabChangeDirection: TransitionDirection = toIndex < fromIndex ? .left : .right
    
        let animator = TabVCTransitioningAnimator(direction: tabChangeDirection)
        return animator
    }
}
