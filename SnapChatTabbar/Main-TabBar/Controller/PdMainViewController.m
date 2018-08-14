//
//  MainViewController.m
//  Famlink
//
//  Created by Paramida-Di on 2017/12/28.
//  Copyright © 2017年 Paramida. All rights reserved.
//

#import "PdMainViewController.h"
#import "Masonry.h"
#import "PdToolBarPostBtn.h"
#import "FirstPageViewController.h"
#import "SecondPageViewController.h"
#import "ThirdPageViewController.h"
#import "CameraPageViewController.h"
//#import "PdGPUCameraViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface PdMainViewController ()
<
    PdMainTabBarDelegate
> {
    BOOL _isCameraFront;

}


@end


@implementation PdMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configCustomTabBar];
    
    [self initViewControllers];
//    [[NIMSDK sharedSDK].chatManager addDelegate:self];
}

- (void)dealloc {
//    [[NIMSDK sharedSDK].chatManager removeDelegate:self];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    
    [_customMainTabBar mas_updateConstraints:^(MASConstraintMaker *make) {
        if (self.view.safeAreaInsets.bottom > 0) {
            make.height.equalTo(@(60 + self.view.safeAreaInsets.bottom));
        } else {
            make.height.equalTo(@80);
        }
    }];
}

- (void)configCustomTabBar {
    self.tabBar.hidden = YES;
    _isFirstNoteShouldHidden = YES;
//    LANGUAGE(@"famlink_fam"), LANGUAGE(@"ico_around"), LANGUAGE(@"ico_me")
    _customMainTabBar = [[PdMainTabBar alloc] initWithTitles:@[@"", @"", @""] normalImages:@[@"fam_fam_normal", @"fam_around_normal", @"fam_me_normal"] highlightImages:@[@"fam_fam_press", @"fam_around_press", @"fam_me_press"]];
    _customMainTabBar.delegate = self;
    _customMainTabBar.delegate.selectedIndex = PdMainPageIndexFam;
    [self.view addSubview:_customMainTabBar];
    [_customMainTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@80);
    }];
}


- (void)initViewControllers {
    FirstPageViewController *firstVC = [[FirstPageViewController alloc] init];
    SecondPageViewController  *secondVC = [[SecondPageViewController alloc] init];
    ThirdPageViewController  *thirdVC = [[ThirdPageViewController alloc] init];
    CameraPageViewController *cameraVC = [[CameraPageViewController alloc] init];
    NSArray *viewControllers = @[firstVC, secondVC, thirdVC];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:viewControllers.count];
    _mainRootViewControllers = [NSMutableArray arrayWithCapacity:viewControllers.count];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *baseVC = viewControllers[i];
        
        [_mainRootViewControllers addObject:baseVC];
        
        [arrayM addObject:baseVC];
    }

    self.viewControllers = arrayM;
    
    //默认进入 around 页面
    self.selectedIndex = PdMainPageIndexAround;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [_customMainTabBar configSelectIndex:selectedIndex];
    
    [super setSelectedIndex:selectedIndex];
}


#pragma mark - 发帖
- (void)mainTabBarAroundBtnDidClicked:(PdMainTabBar *)mainTabBar {
    CameraPageViewController *cameraPageVC = [[CameraPageViewController alloc] init];
    [self presentViewController:cameraPageVC animated:YES completion:nil];
}


#pragma mark - NIMChatManagerDelegate






@end
