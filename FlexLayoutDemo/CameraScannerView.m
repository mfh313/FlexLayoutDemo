//
//  CameraScannerView.m
//  FlexLayoutDemo
//
//  Created by EEKA on 2018/1/23.
//  Copyright © 2018年 mafanghua. All rights reserved.
//

#import "CameraScannerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation CameraScannerView

-(instancetype)init
{
    self = [super init];
    if (self) {
        //获取摄像设备
        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        //创建输入流
        _captureInput = [AVCaptureDeviceInput deviceInputWithDevice:_captureDevice error:nil];
        
        //创建输出流
        _captureOutput = [AVCaptureMetadataOutput new];
        [_captureOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        //初始化链接对象
        _captureSession = [[AVCaptureSession alloc] init];
        //高质量采集率
        [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
        
        [_captureSession addInput:_captureInput];
        [_captureSession addOutput:_captureOutput];
        
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        _captureOutput.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
        
    }
    
    return self;
}



@end
