//
//  TestViewController.h
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TestViewControllerDelegate <NSObject>

- (void)placedAtTheTop:(NSIndexPath *)indexPath;

@end

@interface TestViewController : UIViewController

@property (nonatomic, strong) NSIndexPath *cellIndexPath; // 记录点击的cell所在的位置
@property (nonatomic, weak) id<TestViewControllerDelegate> delegate;

@end
