//
//  PdMainTabBar.m
//  Famlink
//
//  Created by light_bo on 2018/1/31.
//Copyright © 2018年 Paramida. All rights reserved.
//

#import "PdMainTabBar.h"
#import "UIButton+ImageTitleSpacing.h"

@interface PdMainTabBar () {
    BOOL _hasNewMsg;
}

@property (nonatomic, strong) UIButton *msgBtn;
@property (nonatomic, strong) UIButton *aroundBtn;
@property (nonatomic, strong) UIButton *personalPageBtn;

@property (nonatomic, strong) NSArray<NSString *> *titlesArray;
@property (nonatomic, strong) NSArray<NSString *> *normalImages;
@property (nonatomic, strong) NSArray<NSString *> *highlightImages;

@property (nonatomic, assign) float imageTitleSpace;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;


@end


@implementation PdMainTabBar

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles normalImages:(NSArray<NSString *> *)normalImages highlightImages:(NSArray<NSString *> *)highlightImages {
    self = [super init];
    if (self) {
        _titlesArray = [titles copy];
        _normalImages = [normalImages copy];
        _highlightImages = [highlightImages copy];
        
        _imageTitleSpace = 5;
        
        [self configSubviews];
    }
    
    return self;
}

- (void)configSubviews {
    _aroundBtn = [self createTabBarBtn];
    [_aroundBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexAround]] forState:UIControlStateNormal];
    [_aroundBtn setTitle:_titlesArray[PdMainPageIndexAround] forState:UIControlStateNormal];
    [self addSubview:_aroundBtn];
    [_aroundBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(60));
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(5);
    }];
    [_aroundBtn addTarget:self action:@selector(aroundBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    _msgBtn = [self createTabBarBtn];
    [_msgBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexFam]] forState:UIControlStateNormal];
    [_msgBtn setTitle:_titlesArray[PdMainPageIndexFam] forState:UIControlStateNormal];
    [self addSubview:_msgBtn];
    [_msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(_aroundBtn.mas_width);
        make.right.equalTo(_aroundBtn.mas_left).offset(-20);
        make.top.equalTo(_aroundBtn.mas_top);
    }];
    [_msgBtn addTarget:self action:@selector(msgBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    _personalPageBtn = [self createTabBarBtn];
    [_personalPageBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexMe]] forState:UIControlStateNormal];
    [_personalPageBtn setTitle:_titlesArray[PdMainPageIndexMe] forState:UIControlStateNormal];
    [self addSubview:_personalPageBtn];
    [_personalPageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(_aroundBtn.mas_width);
        make.left.equalTo(_aroundBtn.mas_right).offset(20);
        make.top.equalTo(_aroundBtn.mas_top);
    }];
    [_personalPageBtn addTarget:self action:@selector(personalPageBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [_msgBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    [_aroundBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    [_personalPageBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc] init];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[
                                  (id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0].CGColor,
                                  (id)[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor];
        _gradientLayer.locations = @[@0, @1];
        [_gradientLayer setStartPoint:CGPointMake(1, 0)];
        [_gradientLayer setEndPoint:CGPointMake(1, 1)];
        [self.layer insertSublayer:_gradientLayer atIndex:0];
    }
}



- (UIButton *)createTabBarBtn {
    UIButton *btn = [UIButton new];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    
    return btn;
}

- (void)aroundBtnClicked {
    if (PdMainPageIndexAround == self.delegate.selectedIndex) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(mainTabBarAroundBtnDidClicked:)]) {
            [self.delegate mainTabBarAroundBtnDidClicked:self];
        }
        
        return;
    }
    
    [self updateAroundBtn:PdTabBarBtnStatusSelected];
    
    if (PdMainPageIndexMe == self.delegate.selectedIndex) {
        [self updatePersonalPageBtn:PdTabBarBtnStatusNormal];
    }
    
    if (PdMainPageIndexFam == self.delegate.selectedIndex) {
        [self updateMsgBtn:PdTabBarBtnStatusNormal];
    }
    
    self.delegate.selectedIndex = PdMainPageIndexAround;
}

- (void)msgBtnClicked {
    if (PdMainPageIndexFam == self.delegate.selectedIndex) {
        return;
    }
    
    [self updateMsgBtn:PdTabBarBtnStatusSelected];
    
    if (PdMainPageIndexAround == self.delegate.selectedIndex) {
        [self updateAroundBtn:PdTabBarBtnStatusNormal];
    }
    
    if (PdMainPageIndexMe == self.delegate.selectedIndex) {
        [self updatePersonalPageBtn:PdTabBarBtnStatusNormal];
    }
    
    self.delegate.selectedIndex = PdMainPageIndexFam;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainTabBarMsgBtnDidClicked:)]) {
        [self.delegate mainTabBarMsgBtnDidClicked:self];
    }
}

- (void)personalPageBtnClicked {
    if (PdMainPageIndexMe == self.delegate.selectedIndex) {
        return;
    }
    
    [self updatePersonalPageBtn:PdTabBarBtnStatusSelected];
    
    if (PdMainPageIndexAround == self.delegate.selectedIndex) {
        [self updateAroundBtn:PdTabBarBtnStatusNormal];
    }
    
    if (PdMainPageIndexFam == self.delegate.selectedIndex) {
        [self updateMsgBtn:PdTabBarBtnStatusNormal];
    }
    
    self.delegate.selectedIndex = PdMainPageIndexMe;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainTabBarPersonalPageBtnDidClicked:)]) {
        [self.delegate mainTabBarPersonalPageBtnDidClicked:self];
    }
}

- (void)updateMsgBtn:(PdTabBarBtnStatus)tabBarBtnStatus {
    if (PdTabBarBtnStatusNormal == tabBarBtnStatus) {
        [_msgBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexFam]] forState:UIControlStateNormal];
        [_msgBtn setTitle:_titlesArray[PdMainPageIndexFam] forState:UIControlStateNormal];
        [_msgBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    } else if(PdTabBarBtnStatusSelected == tabBarBtnStatus) {
//        [_msgBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        [_msgBtn setImage:[UIImage imageNamed:_highlightImages[PdMainPageIndexFam]] forState:UIControlStateNormal];
        [_msgBtn setTitle:nil forState:UIControlStateNormal];
    } else if (PdTabBarBtnStatusHasNewMsg == tabBarBtnStatus) {
        [_msgBtn setImage:[UIImage imageNamed:@"fam_fam_mes_normal"] forState:UIControlStateNormal];
        [_msgBtn setTitle:_titlesArray[PdMainPageIndexFam] forState:UIControlStateNormal];
        [_msgBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    }
}

- (void)updateAroundBtn:(PdTabBarBtnStatus)tabBarBtnStatus {
    if (PdTabBarBtnStatusNormal == tabBarBtnStatus) {
        [_aroundBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexAround]] forState:UIControlStateNormal];
        [_aroundBtn setTitle:_titlesArray[PdMainPageIndexAround] forState:UIControlStateNormal];
        [_aroundBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    } else {
//        [_aroundBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        [_aroundBtn setImage:[UIImage imageNamed:_highlightImages[PdMainPageIndexAround]] forState:UIControlStateNormal];
        [_aroundBtn setTitle:nil forState:UIControlStateNormal];
    }
}

- (void)updatePersonalPageBtn:(PdTabBarBtnStatus)tabBarBtnStatus {
    if (PdTabBarBtnStatusNormal == tabBarBtnStatus) {
        [_personalPageBtn setImage:[UIImage imageNamed:_normalImages[PdMainPageIndexMe]] forState:UIControlStateNormal];
        [_personalPageBtn setTitle:_titlesArray[PdMainPageIndexMe] forState:UIControlStateNormal];
        [_personalPageBtn layoutButtonWithEdgeInsetsStyle:PdButtonEdgeInsetsStyleTop imageTitleSpace:_imageTitleSpace];
    } else {
//        [_personalPageBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        [_personalPageBtn setImage:[UIImage imageNamed:_highlightImages[PdMainPageIndexMe]] forState:UIControlStateNormal];
        [_personalPageBtn setTitle:nil forState:UIControlStateNormal];
    }
}

- (void)configSelectIndex:(NSInteger)selectIndex {
    switch (selectIndex) {
        case PdMainPageIndexFam: {
            _hasNewMsg = NO;
            [self updateMsgBtn:PdTabBarBtnStatusSelected];
            [self updateAroundBtn:PdTabBarBtnStatusNormal];
            [self updatePersonalPageBtn:PdTabBarBtnStatusNormal];
        }
            break;
            
        case PdMainPageIndexAround: {
            [self updateMsgBtn:_hasNewMsg? PdTabBarBtnStatusHasNewMsg: PdTabBarBtnStatusNormal];
            [self updateAroundBtn:PdTabBarBtnStatusSelected];
            [self updatePersonalPageBtn:PdTabBarBtnStatusNormal];
        }
            break;
            
        case PdMainPageIndexMe: {
            [self updateMsgBtn:_hasNewMsg? PdTabBarBtnStatusHasNewMsg: PdTabBarBtnStatusNormal];
            [self updateAroundBtn:PdTabBarBtnStatusNormal];
            [self updatePersonalPageBtn:PdTabBarBtnStatusSelected];
        }
            break;
            
        default:
            break;
    }
}

- (void)updateSelectIndex:(NSInteger)selectedIndex withImage:(UIImage *)image {
    if ((selectedIndex > PdMainPageIndexMe) || (!image)) {
        return;
    }
    
    switch (selectedIndex) {
        case PdMainPageIndexFam: {
            [_msgBtn setImage:image forState:UIControlStateNormal];
        }
            break;
            
        case PdMainPageIndexAround: {
            [_aroundBtn setImage:image forState:UIControlStateNormal];
        }
            break;
            
        case PdMainPageIndexMe: {
            [_personalPageBtn setImage:image forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

- (void)configFamPageNewMsgStatus:(BOOL)hasNewMsg {
    _hasNewMsg = hasNewMsg;
    if (hasNewMsg) {
        [self updateMsgBtn:PdTabBarBtnStatusHasNewMsg];
    } else {
        [self updateMsgBtn:PdMainPageIndexFam == self.delegate.selectedIndex? PdTabBarBtnStatusSelected: PdTabBarBtnStatusNormal];
    }
}

@end
