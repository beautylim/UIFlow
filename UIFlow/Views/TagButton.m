//
//  TagButton.m
//  UIFlow
//
//  Created by 李敏 on 16/5/31.
//  Copyright © 2016年 adways. All rights reserved.
//

#import "TagButton.h"
#import "Common.h"

static UIImage *backgroundImage = nil;
@implementation TagButton
+ (void)setBackGroundImage:(UIImage *)targetImage{
    backgroundImage = targetImage;
}

- (instancetype)instanceWithTitle:(NSString *)titleString{
    if (self == [super init]) {
        
        _titleText = titleString;

        CGSize tagTitleSize = [Common caculateSingleTextSize:titleString withFontSize:Tag_Font_Size];
        CGFloat buttonWidth = tagTitleSize.width + Tag_Title_Margin * 2;
        CGFloat buttonHeight = tagTitleSize.height + Tag_Title_Margin * 2;
        _tagButtonSize = CGSizeMake(buttonWidth, buttonHeight);
        
        [self initBackGroundImageWithWidth:buttonWidth withHeight:buttonHeight];
        
        [self initTitleLabelWithTagTitleSize:tagTitleSize];
        
        [self initClickAction];
    }
    return self;
}

- (void)clickButton:(id)sender{
    if (self.clickTagButtonBlock) {
        [self clickTagButtonBlock](sender);
    }
}
- (void)initBackGroundImageWithWidth:(CGFloat)buttonWidth withHeight:(CGFloat)buttonHeight{
    UIImageView  *backGroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    [backGroundImageView setFrame:CGRectMake(0, 0, buttonWidth, buttonHeight)];
    [backGroundImageView setImage:backgroundImage];
    [self addSubview:backGroundImageView];
}

- (void)initTitleLabelWithTagTitleSize:(CGSize)tagTitleSize{
    UILabel *titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(Tag_Title_Margin, Tag_Title_Margin, tagTitleSize.width,tagTitleSize.height)];
    titleLabel.font = [UIFont systemFontOfSize:Tag_Font_Size];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = _titleText;
    [self addSubview:titleLabel];
}

- (void)initClickAction{
    UITapGestureRecognizer *clickAction = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickButton:)];
    [self addGestureRecognizer:clickAction];
    [self setUserInteractionEnabled:YES];
}
@end
