//
//  PdToolBarPostBtn.h
//  Loopin
//
//  Created by light_bo on 2017/5/23.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdButton.h"


@interface PdToolBarPostBtn : PdButton  

/**
 将按钮添加到 toolbar 上

 @param tabBar UITabBarController（或其子类）对应的 tabbar
 @param tabBarControllerView UITabBarController.view
 */
- (void)addToTabBar:(UITabBar *)tabBar withTabBarControllerView:(UIView *)tabBarControllerView;



@end
