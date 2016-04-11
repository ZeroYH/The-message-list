//
//  MessageTableViewCell.h
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface MessageTableViewCell : UITableViewCell

@property (nonatomic, strong) MessageModel *model; // cell的model

@end
