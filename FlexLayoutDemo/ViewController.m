//
//  ViewController.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/8/30.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "ViewController.h"
#import "MFFlexLayoutCellView.h"
#import "MFCoverDropView.h"

@interface ViewController () <MFCoverDropViewDataSource,MFCoverDropViewDelegate>
{
    __weak IBOutlet UIButton *_touchButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MFFlexLayoutCellView *demoView = [[MFFlexLayoutCellView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    demoView.backgroundColor = [UIColor clearColor];
    [demoView setName:@"大大标题" title:@"小题"];
    [self.view addSubview:demoView];
    
    [self.view layoutIfNeeded];
}

- (IBAction)onClickButton:(id)sender {
    MFCoverDropView *coverView = [[MFCoverDropView alloc] initWithFrame:self.view.frame];
    coverView.m_dataSource = self;
    coverView.m_delegate = self;
    [self.view addSubview:coverView];
    
    [coverView layoutMenuView];
    [coverView reloadHighlightToIndex:1];
}

//- (CGFloat)innerMenuUpArrowOffSetX
//{
//    return 220;
//}

-(void)didSelectDropMenuIndex:(NSInteger)index
{
    
}

- (CGPoint)innerMenuStartOrigin
{
    CGRect touchButtonFrame = [_touchButton convertRect:_touchButton.bounds toView:self.view];
    return CGPointMake(CGRectGetMidX(touchButtonFrame), CGRectGetMaxY(touchButtonFrame));
}

- (NSInteger)numberOfMenu
{
    return 3;
}

- (NSString *)titleForIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"测试item=%@",@(index)];;
}

- (CGFloat)innerMenuItemHeight
{
    return 40.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
