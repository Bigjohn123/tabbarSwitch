//
//  PdToolBarPostBtn.m
//  Loopin
//
//  Created by light_bo on 2017/5/23.
//  Copyright © 2017年 Paramida-Di. All rights reserved.
//

#import "PdToolBarPostBtn.h"
#import "Header.h"

@interface PdToolBarPostBtn ()

@property (nonatomic, strong) UIImage *normalImage;

@end




@implementation PdToolBarPostBtn



- (void)addToTabBar:(UITabBar *)tabBar withTabBarControllerView:(UIView *)tabBarControllerView {
    _normalImage = [UIImage imageNamed:@"loopin_camera_normal"];
    
    [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"loopin_camera_press"] forState:UIControlStateHighlighted];

    self.frame = CGRectMake((tabBarControllerView.frame.size.width-_normalImage.size.width)/2, (Pd_Tab_Bar_Height-_normalImage.size.height)/2, _normalImage.size.width, _normalImage.size.height);
    [tabBar addSubview:self];
}





@end
