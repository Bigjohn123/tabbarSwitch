//
//  PdFirstPostView.m
//  Famlink
//
//  Created by Paramida-Di on 2018/6/9.
//  Copyright © 2018年 Paramida. All rights reserved.
//

#import "PdFirstPostView.h"

@implementation PdFirstPostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    int kLineHeight = 86;
    int kLineWidth = 26;
    UILabel *noteLabel = [[UILabel alloc] init];
    noteLabel.text = @"famlink_blank_around";
    noteLabel.layer.cornerRadius = 10.0f;
    noteLabel.textAlignment = NSTextAlignmentCenter;
    noteLabel.backgroundColor = [UIColor lightGrayColor];
    noteLabel.textColor = [UIColor whiteColor];
    noteLabel.clipsToBounds = YES;
    [self addSubview:noteLabel];
    [noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(47.5);
        make.right.equalTo(self.mas_right).offset(-47.5);
        make.height.equalTo(@50);
        make.top.equalTo(self.mas_top);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"around_line"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(25);
        make.top.equalTo(noteLabel.mas_bottom);
        make.height.equalTo(@(kLineHeight));
        make.width.equalTo(@(kLineWidth));
    }];
    
}

@end
