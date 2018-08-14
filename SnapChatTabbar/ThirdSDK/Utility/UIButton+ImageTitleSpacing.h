//
//  UIButton+ImageTitleSpacing.h
//  SystemPreferenceDemo
//
//  Created by moyekong on 12/28/15.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PdButtonEdgeInsetsStyle) {
    PdButtonEdgeInsetsStyleTop, // image在上，label在下
    PdButtonEdgeInsetsStyleLeft, // image在左，label在右
    PdButtonEdgeInsetsStyleBottom, // image在下，label在上
    PdButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (ImageTitleSpacing)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(PdButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
