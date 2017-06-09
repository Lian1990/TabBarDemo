//
//  TestFourViewController.m
//  tabbarDemo
//
//  Created by LIAN on 2017/6/8.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "TestFourViewController.h"
#import "UITabBar+Badge.h"

@interface TestFourViewController ()
{
    BOOL _isDown;
}

@end

@implementation TestFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _isDown = YES;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 100);
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnClick:(id)sender{
    if (_isDown) {
        [self.tabBarController.tabBar showBadgeOfIndex:4];
    }else{
        [self.tabBarController.tabBar hiddenBadgeOfIndex:4];
    }
    _isDown = !_isDown;
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
