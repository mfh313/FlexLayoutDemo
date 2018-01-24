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
#import "MFStackDemoComponent.h"
#import "CameraScannerView.h"

@interface ViewController () <MFCoverDropViewDataSource,MFCoverDropViewDelegate>
{
    __weak IBOutlet UIButton *_touchButton;
    
    CameraScannerView *m_cameraView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    m_cameraView = [[CameraScannerView alloc] initWithFrame:self.view.bounds];
    [m_cameraView initCaptureWithPreviewScale:0];
    [self.view addSubview:m_cameraView];
}

-(void)testCameraView
{
    [m_cameraView start];
}

//https://mp.weixin.qq.com/s?__biz=MzI1MTA1MzM2Nw==&mid=2649797021&idx=1&sn=424b8d3d5de80f27d762a0009a990367&chksm=f1fcc5c5c68b4cd33e985c2c49fab8a13d8f4952ae938395477e56b3f2b467aa0a231855b9d9&scene=38#wechat_redirect

-(void)testVZFlexLayout
{
    [self addMFFlexLayoutCellView];
}

-(void)addMFFlexLayoutCellView
{
    MFFlexLayoutCellView *demoView = [[MFFlexLayoutCellView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    demoView.backgroundColor = [UIColor clearColor];
    [demoView setName:@"大大标题" title:@"小题"];
    [self.view addSubview:demoView];
}

- (IBAction)onClickButton:(id)sender {
    
    [self testCameraView];
    
//    [self.view layoutIfNeeded];
//
//    MFCoverDropView *coverView = [[MFCoverDropView alloc] initWithFrame:self.view.frame];
//    coverView.m_dataSource = self;
//    coverView.m_delegate = self;
//    [self.view addSubview:coverView];
//
//    [coverView layoutMenuView];
//    [coverView reloadHighlightToIndex:1];
}

- (CGFloat)innerMenuUpArrowOffSetX
{
    return 120;
}

-(void)didSelectDropMenuIndex:(NSInteger)index
{
    
}

- (CGPoint)innerMenuStartOrigin
{
    CGRect touchButtonFrame = [_touchButton convertRect:_touchButton.bounds toView:self.view];
    return CGPointMake(CGRectGetMidX(touchButtonFrame), CGRectGetMaxY(touchButtonFrame) + 5);
}

- (NSInteger)numberOfMenu
{
    return 6;
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
