//
//  ViewController.m
//  UIFlow
//
//  Created by 李敏 on 16/5/31.
//  Copyright © 2016年 adways. All rights reserved.
//

#import "ViewController.h"
#import "TagUIView.h"

@interface ViewController ()
@property (nonatomic, copy)NSMutableArray *tagTotalArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // _tagTotalArray = [NSMutableArray arrayWithObjects:@"#插画达人",nil];
    _tagTotalArray = [NSMutableArray arrayWithObjects:@"#今生必去",@"#旅行攻略",@"#目的地",@"#城堡",@"#岛屿",@"#教堂",@"#夜景",@"#森林",@"#赏花",@"#温泉",@"#小镇",@"#小店", nil];
    NSArray *tagGroupedArray =[Common groupTagArray:_tagTotalArray];
    TagUIView *tagView = [[TagUIView alloc]initWithTagArray:tagGroupedArray withBackGroundImage:[UIImage imageNamed:@"Background_Image"]];
    [tagView setFrame:CGRectMake(0, 0, Screen_Width, tagView.buttonY)];
    [self.view addSubview:tagView];
    
    
   
    self.navigationController.navigationBar.hidden = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
