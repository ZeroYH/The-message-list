//
//  MessageModel.h
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MessageModel : NSObject

@property (nonatomic, strong) UIImage *headImg;   // 头像
@property (nonatomic, copy) NSString *badge;      // 徽章
@property (nonatomic, copy) NSString *name;       // 名字
@property (nonatomic, copy) NSString *oneMessage; // 最新一条新消息
@property (nonatomic, copy) NSString *dateTime;   // 时间
@property (nonatomic, copy) NSString *type;       // 是否是勿扰

@end
