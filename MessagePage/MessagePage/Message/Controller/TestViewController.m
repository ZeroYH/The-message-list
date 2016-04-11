//
//  TestViewController.m
//  MessagePage
//
//  Created by 于仁汇 on 16/4/10.
//  Copyright © 2016年 YRH. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property (nonatomic, strong) UITextField *textField ;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(backAction:)];
    
    // Do any additional setup after loading the view.
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 30)];
    self.textField = textField;
    textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField];
    
    
}

- (void)backAction:(UIBarButtonItem *)sender {
    // 输入文字 则将cell置顶，否则不做处理
    if (!self.textField.text.length == 0) {
        if (_delegate != nil && [_delegate respondsToSelector:@selector(placedAtTheTop:)] ) {
            [_delegate placedAtTheTop:self.cellIndexPath];
        }
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
