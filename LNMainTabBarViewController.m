//
//  LNMainTabBarViewController.m
//  TabBarDemo
//
//  Created by LIAN on 2017/6/9.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "LNMainTabBarViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "TestThreeViewController.h"
#import "TestFourViewController.h"
#import "TestFiveViewController.h"

@interface LNMainTabBarViewController ()

@end

@implementation LNMainTabBarViewController

+(void)initialize{
    //拿到tabbar的外观
    UITabBarItem *item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, -1.5);
    
    // 普通状态
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f];
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:0.00f];
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
    
    

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    // Do any additional setup after loading the view.
    [self addChildViewControllerWithClassname:[TestOneViewController description] imagename:@"DATA" title:@"数据"];
    [self addChildViewControllerWithClassname:[TestTwoViewController description] imagename:@"INFO" title:@"资讯"];
    [self addChildViewControllerWithClassname:[TestThreeViewController description]imagename:@"PROJECT" title:@"热点"];
    [self addChildViewControllerWithClassname:[TestFourViewController description] imagename:@"TODAY" title:@"消息"];
    [self addChildViewControllerWithClassname:[TestFiveViewController description] imagename:@"YUQING" title:@"个人"];
    
}
// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imagename];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imagename stringByAppendingString:@"-SELECTED"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nav.tabBarItem.badgeValue = @"2";
    [self addChildViewController:nav];
}
//获取tabbar的图层  可以针对图层做更加详细的处理
-(void)viewDidLayoutSubviews{
    [self printViewHierarchy:self.view];
}
//view树
- (void)printViewHierarchy:(UIView *)superView
{
    static uint level = 0;
    for(uint i = 0; i < level; i++){
        printf("\t");
    }

    const char *className = NSStringFromClass([superView class]).UTF8String;
    const char *frame = NSStringFromCGRect(superView.frame).UTF8String;
    printf("%s:%s\n", className, frame);

    ++level;
    for(UIView *view in superView.subviews){
        [self printViewHierarchy:view];
    }
    --level;
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
