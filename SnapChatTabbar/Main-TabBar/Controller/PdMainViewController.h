//
//  MainViewController.h
//  Famlink
//
//  Created by Paramida-Di on 2017/12/28.
//  Copyright © 2017年 Paramida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdMainTabBar.h"
#import "PdFirstPostView.h"

@interface PdMainViewController : UITabBarController

@property (nonatomic, strong) PdMainTabBar *customMainTabBar;

@property (nonatomic, assign) BOOL isFirstNoteShouldHidden;

/**
 app tabbarcontroller 的几个主页面
 */
@property (nonatomic, strong) NSMutableArray<UIViewController *> *mainRootViewControllers;

@end
