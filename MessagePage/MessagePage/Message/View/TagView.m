//
//  TagView.m
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import "TagView.h"
#import "Masonry.h"


@interface TagView ()

@end

@implementation TagView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self sizeToFit];
    }
    
    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    // 判断badgeValue内有没有内容
    if (badgeValue.length == 0) {
        self.hidden = YES;
    }else if ([badgeValue isEqualToString:@"0"]) {
        return;
    } else {
        self.hidden = NO;
    }
    
    CGSize size = [badgeValue sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    if (size.width > self.frame.size.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
