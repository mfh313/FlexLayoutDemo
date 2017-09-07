//
//  MFFlexLayoutCellView.m
//  EekaMShop
//
//  Created by EEKA on 2017/8/26.
//  Copyright © 2017年 eeka. All rights reserved.
//

#import "MFFlexLayoutCellView.h"
#import <VZFlexLayout/VZFlexLayout.h>

using namespace VZ;

@implementation MFFlexLayoutCellView

-(void)setName:(NSString *)name title:(NSString *)title
{
    self.backgroundColor = [UIColor lightGrayColor];
    
    NodeLayout layout;
//    layout = [self stackNodeLayoutForName:name title:title];
//    layout = [self testTextNodeForName:name];
    layout = [self testImageNode];
    UIView *contentView = viewForRootNode(layout, self.frame.size);
    [self addSubview:contentView];
}

-(NodeLayout)stackNodeLayoutForName:(NSString *)name title:(NSString *)title
{
    VZFStackNode *stackNode = [VZFStackNode newWithStackAttributes:{
        .wrap = VZFlexNoWrap,
        .lines = 1,
        .direction = VZFlexHorizontal,
        .justifyContent = VZFlexSpaceAround,
        .alignItems = VZFlexStart,
        .alignContent = VZFlexInherit,
    }
                                                         NodeSpecs:
    {
        .backgroundColor = [UIColor blackColor],
        .marginLeft = flexLength(5, FlexLengthTypeDefault),
        .marginTop = flexLength(5, FlexLengthTypeDefault),
        .marginRight = flexLength(5, FlexLengthTypeDefault),
        .marginBottom = flexLength(5, FlexLengthTypeDefault)
    }
                                                          Children:
    {
        {
            [VZFTextNode newWithTextAttributes:
                                     {
                                         .text = name,
                                         .lines = 0,
                                         ._font = [UIFont systemFontOfSize:20.0f],
                                         .color = [UIColor redColor],
                                         .alignment = NSTextAlignmentCenter
                                     }
                                                             NodeSpecs:
                                     {
                                         .backgroundColor = [UIColor whiteColor],
                                         .marginLeft = flexLength(10, FlexLengthTypeDefault),
                                         .marginTop = flexLength(10, FlexLengthTypeDefault),
                                         .marginRight = flexLength(10, FlexLengthTypeDefault),
                                     }
                                     ]
        },
        {
            [VZFTextNode newWithTextAttributes:
             {
                 .text = title,
                 .lines = 0,
                 ._font = [UIFont systemFontOfSize:20.0f],
                 .color = [UIColor blackColor],
                 .alignment = NSTextAlignmentCenter
             }
                                     NodeSpecs:
             {
                 .backgroundColor = [UIColor whiteColor],
                 .marginLeft = flexLength(10, FlexLengthTypeDefault),
                 .marginTop = flexLength(10, FlexLengthTypeDefault),
                 .marginRight = flexLength(10, FlexLengthTypeDefault),
             }
             ]
        },
        {
            [VZFTextNode newWithTextAttributes:
             {
                 .text = title,
                 .lines = 0,
                 ._font = [UIFont systemFontOfSize:20.0f],
                 .color = [UIColor yellowColor],
                 .alignment = NSTextAlignmentCenter
             }
                                     NodeSpecs:
             {
                 .backgroundColor = [UIColor lightTextColor],
                 .marginLeft = flexLength(10, FlexLengthTypeDefault),
                 .marginTop = flexLength(10, FlexLengthTypeDefault),
                 .marginRight = flexLength(10, FlexLengthTypeDefault),
             }
             ]
        },
        {
            [VZFTextNode newWithTextAttributes:
             {
                 .text = title,
                 .lines = 0,
                 ._font = [UIFont systemFontOfSize:20.0f],
                 .color = [UIColor yellowColor],
                 .alignment = NSTextAlignmentCenter
             }
                                     NodeSpecs:
             {
                 .backgroundColor = [UIColor lightTextColor],
                 .marginLeft = flexLength(10, FlexLengthTypeDefault),
                 .marginTop = flexLength(10, FlexLengthTypeDefault),
                 .marginRight = flexLength(10, FlexLengthTypeDefault),
             }
             ]
        }
    }];
    
    return [stackNode computeLayoutThatFits:self.frame.size];
}

//文本
-(NodeLayout)testTextNodeForName:(NSString *)name
{
    VZFTextNode *nameNode = [VZFTextNode newWithTextAttributes:
                             {
                                 .text = name,
                                 .lines = 0,
                                 ._font = [UIFont systemFontOfSize:20.0f],
                                 .color = [UIColor redColor],
                                 .alignment = NSTextAlignmentLeft
                             }
                                                     NodeSpecs:
                             {
                                 .flexShrink = 0,
                                 .backgroundColor = [UIColor blueColor],
                                 .marginLeft = flexLength(10, FlexLengthTypeDefault),
                                 .marginTop = flexLength(10, FlexLengthTypeDefault),
                                 .marginRight = flexLength(10, FlexLengthTypeDefault),
                                 .marginBottom = flexLength(10, FlexLengthTypeDefault)
                             }
                             ];
    return [nameNode computeLayoutThatFits:self.frame.size];
}

//图片
-(NodeLayout)testImageNode
{
    VZFImageNode *imageNode = [VZFImageNode newWithImageAttributes:{
        .image = [UIImage imageNamed:@"avtar"],
        .contentMode = UIViewContentModeScaleAspectFit
    }
                                                         NodeSpecs:{
                                                             .width = 80.0,
                                                             .height = 80.0f,
                                                             .backgroundColor = [UIColor blackColor],
                                                             .marginLeft = flexLength(10, FlexLengthTypeDefault),
                                                             .marginTop = flexLength(10, FlexLengthTypeDefault),
                                                             .marginRight = flexLength(10, FlexLengthTypeDefault),
                                                             .marginBottom = flexLength(10, FlexLengthTypeDefault)
                                                         }];
    
    return [imageNode computeLayoutThatFits:self.frame.size];
}

//按钮
-(NodeLayout)testButtonNode
{
    VZFImageNode *imageNode = [VZFImageNode newWithImageAttributes:{
        .image = [UIImage imageNamed:@"avtar"],
        .contentMode = UIViewContentModeScaleAspectFit
    }
                                                         NodeSpecs:{
                                                             .width = 80.0,
                                                             .height = 80.0f,
                                                             .backgroundColor = [UIColor blackColor],
                                                             .marginLeft = flexLength(10, FlexLengthTypeDefault),
                                                             .marginTop = flexLength(10, FlexLengthTypeDefault),
                                                             .marginRight = flexLength(10, FlexLengthTypeDefault),
                                                             .marginBottom = flexLength(10, FlexLengthTypeDefault)
                                                         }];
    
    return [imageNode computeLayoutThatFits:self.frame.size];
}

@end
