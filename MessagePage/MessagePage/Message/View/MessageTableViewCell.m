//
//  MessageTableViewCell.m
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "Masonry.h"
#import "TagView.h"


#define kMinSpacing 10
#define kMaxSpacing 20
#define kHeight self.frame.size.height

@interface MessageTableViewCell ()

@property (nonatomic, strong) UIImageView *headImg;         // 头像
@property (nonatomic, strong) TagView *badgeView;           // 徽章
@property (nonatomic, strong) UILabel *nameLB;              // 名字
@property (nonatomic, strong) UILabel *messageLB;           // 显示最新的一条信息
@property (nonatomic, strong) UILabel *dateLB;              // 时间
@property (nonatomic, strong) UIImageView *doNotDisturbImg; // 勿扰图标

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    // 头像
    self.headImg = [UIImageView new];
    [self.contentView addSubview:_headImg];
    // 徽章
    self.badgeView = [TagView new];
    [self.contentView addSubview:_badgeView];
    // 名字
    self.nameLB = [UILabel new];
    [self.contentView addSubview:_nameLB];
    // 最新的一条信息
    self.messageLB = [UILabel new];
    _messageLB.textColor = [UIColor grayColor];
    _messageLB.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_messageLB];
    // 时间
    self.dateLB = [UILabel new];
    _dateLB.textColor = [UIColor grayColor];
    _dateLB.font = [UIFont systemFontOfSize:15];
    _dateLB.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_dateLB];
    // 勿扰图标
    self.doNotDisturbImg = [UIImageView new];
    [self.contentView addSubview:_doNotDisturbImg];

    // 布局
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(kMinSpacing);
        make.bottom.equalTo(self.contentView).with.offset(-kMinSpacing);
        make.left.equalTo(self.contentView).with.offset(kMaxSpacing);
        make.width.equalTo(_headImg.mas_height);
    }];
    [_badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.equalTo(self.contentView).with.offset(kMinSpacing - 10);
        make.left.equalTo(_headImg.mas_right).with.offset(-10);
    }];
    
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_centerY).with.offset(-2);
        make.left.equalTo(_headImg.mas_right).with.offset(kMaxSpacing);
        make.right.equalTo(_dateLB.mas_left).with.offset(-kMaxSpacing);
    }];
    [_messageLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).with.offset(2);
        make.left.equalTo(_headImg.mas_right).with.offset(kMaxSpacing);
        make.right.equalTo(self.contentView).with.offset(- (_headImg.frame.size.width));
    }];
    [_dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-kMaxSpacing);
        make.top.equalTo(_nameLB.mas_top);
    }];
    [_doNotDisturbImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-kMaxSpacing);
        make.top.equalTo(_messageLB.mas_top);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
}

#pragma mark - setter
- (void)setModel:(MessageModel *)model {
    _model = model;
    _headImg.image = model.headImg;
    _badgeView.badgeValue = model.badge;
    _nameLB.text = model.name;
    _messageLB.text = model.oneMessage;
    _dateLB.text = model.dateTime;
    if ([model.type isEqualToString:@"1"]) {
        _doNotDisturbImg.image = [UIImage imageNamed:@"Unknown.png"];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
