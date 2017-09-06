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
    VZFlexNode *node = [VZFlexNode new];
    node.direction = FlexHorizontal;
    node.alignContent = FlexCenter;
    
    VZFTextNode *textNode = [VZFTextNode newWithTextAttributes:
                             {
                                 .text = name,
                                 ._font = [UIFont systemFontOfSize:14.0f],
                                 .color = [UIColor redColor]
                             }
                                                     NodeSpecs:
                             {
                                 .width = 100.0,
                                 .height = 10.0
                             }
                             ];
    
    VZFNodeViewManager *viewManger = [[VZFNodeViewManager alloc] initWithView:self shouldAutoReset:YES];
    UIView *subView = [viewManger viewForNode:textNode frame:self.frame];
    subView.frame = self.bounds;
    [self addSubview:subView];
}

-(VZFlexNode *)flexNodeName:(NSString *)name title:(NSString *)title
{
    VZFlexNode *node = [VZFlexNode new];
    node.direction = FlexHorizontal;
    node.width = flexLength(CGRectGetWidth(self.bounds), FlexLengthTypeDefault);
    node.height = flexLength(CGRectGetHeight(self.bounds), FlexLengthTypeDefault);
    
    return node;
}

@end
