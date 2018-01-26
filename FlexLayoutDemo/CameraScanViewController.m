//
//  CameraScanViewController.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2018/1/25.
//  Copyright © 2018年 mafanghua. All rights reserved.
//

#import "CameraScanViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraScanViewController ()
{
    UIView *_overlayLeftView;
    UIView *_overlayRightView;
    UIView *_overlayTopView;
    UIView *_overlayBottomView;
    
    UIImageView *_scanLineImgView;
    
    UIView *_topLineView;
    UIView *_bottomLineView;
    UIView *_leftLineView;
    UIView *_rightLineView;
    
    UIImageView *_leftTopCropImageView;
    UIImageView *_rightTopCropImageView;
    UIImageView *_leftBottomCropImageView;
    UIImageView *_rightBottomCropImageView;
}

@end

@implementation CameraScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if (granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        } else {
            NSLog(@"无权限访问相机");
        }
    }];
}

-(void)initView
{
    
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
