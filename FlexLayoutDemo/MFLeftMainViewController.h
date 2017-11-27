//
//  MFLeftMainViewController.h
//  FlexLayoutDemo
//
//  Created by EEKA on 2017/11/25.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface MFLeftMainViewController : UIViewController <ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
