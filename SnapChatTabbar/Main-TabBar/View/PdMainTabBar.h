//
//  PdMainTabBar.h
//  Famlink
//
//  Created by light_bo on 2018/1/31.
//Copyright © 2018年 Paramida. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, PdMainPageIndex) {
    PdMainPageIndexFam = 0,
    PdMainPageIndexAround,
    PdMainPageIndexMe
};

typedef NS_ENUM(NSInteger, PdTabBarBtnStatus) {
    PdTabBarBtnStatusNormal,
    PdTabBarBtnStatusSelected,
    PdTabBarBtnStatusHasNewMsg
};


typedef NS_ENUM(NSInteger, PdGradientColorType) {
    PdGradientColorTypeWhite,
    PdGradientColorTypeBlack
};

@class PdMainTabBar;

@protocol PdMainTabBarDelegate <NSObject>

@optional
- (void)mainTabBarMsgBtnDidClicked:(PdMainTabBar *)mainTabBar;
- (void)mainTabBarAroundBtnDidClicked:(PdMainTabBar *)mainTabBar;
- (void)mainTabBarPersonalPageBtnDidClicked:(PdMainTabBar *)mainTabBar;

@end


@interface PdMainTabBar : UIView

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles normalImages:(NSArray<NSString *> *)normalImages highlightImages:(NSArray<NSString *> *)highlightImages;
- (void)updateSelectIndex:(NSInteger)selectedIndex withImage:(UIImage *)image;
- (void)configSelectIndex:(NSInteger)selectIndex;
- (void)configFamPageNewMsgStatus:(BOOL)hasNewMsg;


@property (nonatomic, weak) UITabBarController<PdMainTabBarDelegate> *delegate;

@end
