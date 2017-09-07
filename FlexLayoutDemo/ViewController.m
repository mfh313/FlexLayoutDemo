//
//  ViewController.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/8/30.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "ViewController.h"
#import "MFFlexLayoutCellView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MFFlexLayoutCellView *demoView = [[MFFlexLayoutCellView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    demoView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:demoView];
    
    [demoView setName:@"大大标题VZFlexLayo大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFl大大标题VZFlexLayou大标题VZFlu大标题VZFlexLayou大标题VZFlexLayou标题VZFlexLayout" title:@"小题VZF题VZF题VZF题VZF题VZF标题VZFlexLayout"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
