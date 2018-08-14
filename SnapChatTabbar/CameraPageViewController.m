//
//  CameraPageViewController.m
//  SnapChatTabbar
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 dd. All rights reserved.
//

#import "CameraPageViewController.h"

@interface CameraPageViewController ()

@end

@implementation CameraPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"camera";
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, [UIScreen mainScreen].bounds.size.height/2-100/2, 200, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
