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

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //获取摄像设备
        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        //创建输入流
        _captureInput = [AVCaptureDeviceInput deviceInputWithDevice:_captureDevice error:nil];
        
        //创建输出流
        _captureOutput = [AVCaptureMetadataOutput new];
        [_captureOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        AVCaptureConnection *connection =[_captureOutput connectionWithMediaType:AVMediaTypeMetadata];
        connection.videoOrientation = AVCaptureVideoOrientationLandscapeRight;//[self videoOrientationFromCurrentDeviceOrientation];
        
        //初始化链接对象
        _captureSession = [[AVCaptureSession alloc] init];
        //高质量采集率
        [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
        
        
        [_captureSession addInput:_captureInput];
        [_captureSession addOutput:_captureOutput];
    
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        _captureOutput.metadataObjectTypes = @[AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code];
        
        _prevLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
        _prevLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;
        _prevLayer.connection.videoOrientation = AVCaptureVideoOrientationLandscapeRight;//[self videoOrientationFromCurrentDeviceOrientation];
        
    }
    
    return self;
}

- (AVCaptureVideoOrientation)videoOrientationFromCurrentDeviceOrientation {
    UIDevice *device = [UIDevice currentDevice];
    
    NSLog(@"device.orientation=%@",@(device.orientation));
    
    switch (device.orientation) {
        case UIDeviceOrientationPortrait: {
            return AVCaptureVideoOrientationPortrait;
        }
        case UIDeviceOrientationLandscapeLeft: {
            return AVCaptureVideoOrientationLandscapeLeft;
        }
        case UIDeviceOrientationLandscapeRight: {
            return AVCaptureVideoOrientationLandscapeRight;
        }
        case UIDeviceOrientationFaceUp: {
            return AVCaptureVideoOrientationPortraitUpsideDown;
        }
        default:
            return AVCaptureVideoOrientationPortrait;
    }
}

//UIDeviceOrientationUnknown,
//UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
//UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
//UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
//UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
//UIDeviceOrientationFaceUp,              // Device oriented flat, face up
//UIDeviceOrientationFaceDown

- (void)initCaptureWithPreviewScale:(CGFloat)scale
{
    //设置相机可视范围--全屏
    _prevLayer.frame = self.bounds;
    [self.layer insertSublayer:_prevLayer atIndex:0];
    
    //开始捕获
    [_captureSession startRunning];
    
    //设置扫描作用域范围(中间透明的扫描框)
////    CGRect intertRect = [_prevLayer metadataOutputRectOfInterestForRect:CGRectInset(_prevLayer.frame, 100, 100)];
//    CGRect intertRect = [_prevLayer metadataOutputRectOfInterestForRect:_prevLayer.bounds];
//    _captureOutput.rectOfInterest = intertRect;
}

- (void)start
{
    if (_captureSession != nil) {
        // AVCaptureSession开始工作
        [_captureSession startRunning];
//        //开始动画
//        [self performSelectorOnMainThread:@selector(timerFired) withObject:nil waitUntilDone:NO];
    }
}

- (void)stop
{
    
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count > 0) {
//        [_captureSession stopRunning];
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        NSString *content = metadataObject.stringValue;
        NSLog(@"content = %@",content);
        NSLog(@"[metadataObject type]=%@",[metadataObject type]);
        if ([[metadataObject type] isEqualToString:AVMetadataObjectTypeQRCode] && content != nil) {
            
        }
    }
}

@end
