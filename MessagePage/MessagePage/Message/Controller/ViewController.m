//
//  ViewController.m
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import "ViewController.h"
#import "MessageTableViewCell.h"
#import "MessageModel.h"

#import "TestViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, TestViewControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *array;
@end

static NSString *indetifier = @"cell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 5; i ++) {
        MessageModel *model = [MessageModel new];
        model.headImg = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i % 2]];
        model.badge = [NSString stringWithFormat:@"%d", i % 2];
        model.name = @"弥勒";
        model.oneMessage = @"Hello World !";
        model.dateTime = @"12:22";
        model.type = [NSString stringWithFormat:@"%d", i % 2];
        [self.array addObject:model];
    }
    
    [self setUpViews];
}

- (void)setUpViews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:indetifier];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier forIndexPath:indexPath];
    MessageModel *model = self.array[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 模拟 点击联系人进入聊天页面 发送文字后，联系人所在cell置顶
    TestViewController *testVC = [[TestViewController alloc] init];
    // 代理
    testVC.delegate = self;
    // 传值
    testVC.cellIndexPath = indexPath;
    
    [self.navigationController pushViewController:testVC animated:YES];
}

#pragma mark - TestViewControllerDelegate
- (void)placedAtTheTop:(NSIndexPath *)indexPath {
    // 将cell置顶
    NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:topIndexPath];

}

#pragma mark - lazy
- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
