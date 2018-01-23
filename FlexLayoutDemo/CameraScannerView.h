//
//  CameraScannerView.h
//  FlexLayoutDemo
//
//  Created by EEKA on 2018/1/23.
//  Copyright © 2018年 mafanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraScannerView : UIView <AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *_captureSession; //输入输出的中间桥梁
    AVCaptureVideoPreviewLayer *_prevLayer;  //扫描窗口
    NSRecursiveLock *_cameraLock;
    
    AVCaptureDeviceInput *_captureInput;   //创建输入流
    AVCaptureMetadataOutput *_captureOutput;  //创建输出流
    AVCaptureDevice *_captureDevice; //获取摄像设备
    
}

@end
