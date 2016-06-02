//
//  TagUIView.h
//  UIFlow
//
//  Created by 李敏 on 16/6/1.
//  Copyright © 2016年 adways. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagUIView : UIView
@property (nonatomic, assign)  CGFloat buttonY;
- (instancetype)initWithTagArray:(NSArray *)tagArray withBackGroundImage:(UIImage *)backGroundImage;
@end
