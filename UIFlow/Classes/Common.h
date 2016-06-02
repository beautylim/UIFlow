//
//  Common.h
//  UIFlow
//
//  Created by 李敏 on 16/6/1.
//  Copyright © 2016年 adways. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Common : NSObject
/**
 *  计算单行文字的宽高
 *
 *  @param content  文字
 *  @param fontSize 字体大小
 *
 *  @return <#return value description#>
 */
+ (CGSize)caculateSingleTextSize:(NSString *)content withFontSize:(CGFloat)fontSize;

+ (NSArray *)groupTagArray:(NSMutableArray *)tagArray;

+ (UIImage *)filterUIImage:(UIImage *)contentImage;

+ (UIImage *)cutImage:(UIImage *)contentImage withCGRect:(CGRect)targetRect;
@end
