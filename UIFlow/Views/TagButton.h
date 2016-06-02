//
//  TagButton.h
//  UIFlow
//
//  Created by 李敏 on 16/5/31.
//  Copyright © 2016年 adways. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagButton : UIView

@property (nonatomic, copy)NSString *titleText;
@property (nonatomic, assign)CGSize tagButtonSize;
@property (nonatomic, strong) void(^clickTagButtonBlock)(id sender);

+ (void)setBackGroundImage:(UIImage *)targetImage;

- (instancetype)instanceWithTitle:(NSString *)titleString;


@end
