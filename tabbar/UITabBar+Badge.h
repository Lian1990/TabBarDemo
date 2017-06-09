//
//  UITabBar+Badge.h
//  TabBarDemo
//
//  Created by LIAN on 2017/6/9.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

-(void)showBadgeOfIndex:(NSInteger)index;
-(void)hiddenBadgeOfIndex:(NSInteger)index;

@end
