//
//  MFFlexLayoutCellView.m
//  EekaMShop
//
//  Created by EEKA on 2017/8/26.
//  Copyright © 2017年 eeka. All rights reserved.
//

#import "MFFlexLayoutCellView.h"
#import <VZFlexLayout/VZFlexLayout.h>
#import <VZFlexLayout/VZFlexNode.h>

using namespace VZ;

@implementation MFFlexLayoutCellView

-(void)setName:(NSString *)name title:(NSString *)title
{
    NodeLayout layout = [self nodeLayoutForName:name title:title];
    
    UIView *contentView = viewForRootNode(layout, self.frame.size);
    [self addSubview:contentView];
}

-(NodeLayout)nodeLayoutForName:(NSString *)name title:(NSString *)title
{
    VZFTextNode *nameNode = [VZFTextNode newWithTextAttributes:
                             {
                                 .text = name,
                                 ._font = [UIFont systemFontOfSize:20.0f],
                                 .color = [UIColor redColor],
                                 .alignment = NSTextAlignmentCenter
                             }
                                                     NodeSpecs:
                             {
                                 .width = 100.0,
                                 .height = 21.0f,
                                 .backgroundColor = [UIColor blueColor]
                             }
                             ];
    return [nameNode computeLayoutThatFits:self.frame.size];
    
//    VZFButtonNode *buttonNode = [VZFButtonNode newWithButtonAttributes:{
//        
//    }
//                                                             NodeSpecs:{
//    }];

//    VZFImageNode *imageNode = [VZFImageNode newWithImageAttributes:{
//        .image = [UIImage imageNamed:@"avtar"],
//        .contentMode = UIViewContentModeScaleAspectFit
//    }
//                                                         NodeSpecs:{
//                                                             .width = 80.0,
//                                                             .height = 80.0f,
//                                                             .backgroundColor = [UIColor blackColor]
//                                                         }];
//    
//    return [imageNode computeLayoutThatFits:self.frame.size];
}

@end
