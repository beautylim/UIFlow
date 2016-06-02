//
//  Common.m
//  UIFlow
//
//  Created by 李敏 on 16/6/1.
//  Copyright © 2016年 adways. All rights reserved.
//



#define Tag_Line_Group @","
@implementation Common

+ (CGSize)caculateSingleTextSize:(NSString *)content withFontSize:(CGFloat)fontSize{
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    CGSize textSize = [content sizeWithAttributes:@{NSFontAttributeName:textFont}];
    return textSize;
}

+ (NSArray *)groupTagArray:(NSMutableArray *)tagArray{
    
    //count limitWidth
    CGFloat lineWidth = Screen_Width - Tag_Line_Margin * 2;
    
    //group array
    CGFloat totalWidth = 0.0;
    NSMutableString *tagLineString = [NSMutableString string];
    for (int i = 0; i < tagArray.count; i++) {
        [tagLineString appendString:tagArray[i]];
        totalWidth = totalWidth + [self caculateSingleTextSize:tagArray[i] withFontSize:Tag_Font_Size].width + Tag_Title_Margin * 2 + Tag_Margin;
        if (totalWidth - Tag_Margin >= lineWidth) {
            NSString * tempString = [tagLineString stringByReplacingOccurrencesOfString:tagArray[i] withString:Tag_Line_Group];
            tagLineString = [NSMutableString stringWithFormat:@"%@",tempString];
            totalWidth = 0.0;
            i--;
        }
    }
    
    NSArray *tagGroupArray = [tagLineString componentsSeparatedByString:Tag_Line_Group];
    NSMutableArray *tagTotalArray = [NSMutableArray array];
    for (NSString *content in tagGroupArray) {
        NSArray *tagLineArray = [content componentsSeparatedByString:Tag_Group_Symbol];
        [tagTotalArray addObject:tagLineArray];
    }
    return tagTotalArray;
}

+ (UIImage *)filterUIImage:(UIImage *)contentImage{
    return nil;
}

+ (UIImage *)cutImage:(UIImage *)contentImage withCGRect:(CGRect)targetRect{

    CGImageRef cgImage = CGImageCreateWithImageInRect([contentImage CGImage], targetRect);
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}
@end
