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
    
    [demoView setName:@"大大标题" title:@"小题"];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self addScrollView:demoView];
}

-(void)addScrollView:(UIView *)yView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(yView.frame) + 30, 300, 200)];
    view.backgroundColor = [UIColor redColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 100, CGRectGetHeight(view.frame))];
    scrollView.contentInset = UIEdgeInsetsZero;
    scrollView.backgroundColor = [UIColor blueColor];
    [view addSubview:scrollView];
    
    UIView *itemView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, CGRectGetHeight(view.frame))];
    itemView1.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:itemView1];
    
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
