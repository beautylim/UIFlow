//
//  TagUIView.m
//  UIFlow
//
//  Created by 李敏 on 16/6/1.
//  Copyright © 2016年 adways. All rights reserved.
//

#import "TagUIView.h"
#import "TagButton.h"

@implementation TagUIView
{
    UIView *blurView;
    UIImageView *backGroundImageView;
}
- (instancetype)initWithTagArray:(NSArray *)tagArray withBackGroundImage:(UIImage *)backGroundImage{
    if (self == [super init]) {
        [self countButtonY:tagArray];
        [self initBlurView:backGroundImage];
        [self initBackGroundImage:backGroundImage];
        [UIView animateWithDuration:Animation_Seconds animations:^{
            [blurView setFrame:CGRectMake(0, 0, Screen_Width, _buttonY)];
            [backGroundImageView setFrame:CGRectMake(0, 0, Screen_Width, _buttonY)];
        } completion:^(BOOL finished) {
            [NSThread sleepForTimeInterval:0.2];
            [self initButtonWithTagArray:tagArray];
        }];
        
       
    }
    return self;
}

- (void)countButtonY:(NSArray *)tagArray{
    _buttonY = Navigation_Bar_Height + 2 * Tag_Margin;
    for (int j = 0; j < tagArray.count; j++) {
        NSArray *tagLineArray = tagArray[j];
        NSInteger i = tagLineArray.count - 1;
        NSString * tagText = [NSString stringWithFormat:@"#%@",tagLineArray[i]];
        if (tagText.length > 1) {
            CGSize tagTextSize = [Common caculateSingleTextSize:tagText withFontSize:Tag_Font_Size];
            _buttonY = _buttonY + tagTextSize.height + 2 * Tag_Title_Margin + Tag_Margin;
        }
    }
}
- (void)initBlurView:(UIImage *)backGroundImage{
    blurView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 0)];
    [blurView setAlpha:0.3];
    [blurView setBackgroundColor:[UIColor blackColor]];
    [self insertSubview:blurView atIndex:0];
}
- (void)initBackGroundImage:(UIImage *)backGroundImage{
    UIImage *clippedImage = [Common cutImage:backGroundImage withCGRect:CGRectMake(0, 0,Screen_Width, _buttonY)];
    backGroundImageView = [[UIImageView alloc]initWithImage:clippedImage];
    [backGroundImageView setFrame:CGRectMake(0, 0, Screen_Width, 0)];
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = CGRectMake(0, 0, Screen_Width, _buttonY);
    [backGroundImageView addSubview:visualEffectView];
    [self insertSubview:backGroundImageView atIndex:0];
}

- (void)initButtonWithTagArray:(NSArray *)tagArray{
    _buttonY = Navigation_Bar_Height + Tag_Margin;
    for (int j = 0; j < tagArray.count; j++) {
        NSArray *tagLineArray = tagArray[j];
        CGFloat lineWidth = [self countLineWidth:tagLineArray];
        for (int i = 1 ; i < tagLineArray.count; i++) {
            NSString * tagText = [NSString stringWithFormat:@"#%@",tagLineArray[i]];
            if (tagText.length > 1) {
                [TagButton setBackGroundImage:[UIImage imageNamed:@"Tag_Image"]];
                TagButton *tagButton = [[TagButton alloc] instanceWithTitle:tagText];
                __weak typeof(tagButton) weakTagButton = tagButton;
                [tagButton setClickTagButtonBlock:^(id sender) {
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:weakTagButton.titleText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alertView show];
                    NSLog(@"%@",weakTagButton.titleText);
                }];
                tagButton.frame = CGRectMake(lineWidth, _buttonY, tagButton.tagButtonSize.width, tagButton.tagButtonSize.height);
                lineWidth = lineWidth + tagButton.tagButtonSize.width +  Tag_Margin;
                [self addSubview:tagButton];
                if (i == tagLineArray.count - 1) {
                     _buttonY = _buttonY + tagButton.tagButtonSize.height + Tag_Margin;
                }
            }
        }
        if (j == tagArray.count - 1) {
            _buttonY = _buttonY + Tag_Margin;
        }
    }
   
}

- (CGFloat)countLineWidth:(NSArray *)tagLineArray{
    CGFloat lineLimitWidth = Screen_Width - Tag_Line_Margin * 2;
    CGFloat lineButtonTotalWidth = 0;
    for (int k = 1; k < tagLineArray.count; k++) {
        lineButtonTotalWidth = lineButtonTotalWidth + [Common caculateSingleTextSize:tagLineArray[k] withFontSize:Tag_Font_Size].width + 2 * Tag_Title_Margin;
    }
    lineButtonTotalWidth = lineButtonTotalWidth + (tagLineArray.count - 2) * Tag_Margin;
    return (lineLimitWidth - lineButtonTotalWidth) / 2 + Tag_Line_Margin;
}

@end
