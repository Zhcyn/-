//
//  ViewController.m
//  按钮下拉
//
//  Created by 禚恒 on 16/5/18.
//  Copyright © 2016年 jinzhuanch. All rights reserved.
//

#import "ViewController.h"

#import "ZHButtonDropDown.h"


@interface ViewController ()<ZHDropDownDelegate>

@property (nonatomic,retain)ZHButtonDropDown *dropDownView;

@property (nonatomic,retain)UIButton *btnSelect;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configUI];
    
}

-(void)configUI{
    

    
    
    _btnSelect = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 250, 40)];
    [_btnSelect setTitle:@"选择吧,亲!" forState:UIControlStateNormal];
    [_btnSelect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnSelect addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _btnSelect.layer.borderWidth = 1;
    _btnSelect.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:_btnSelect];
    
    
    
}



-(void)btnClick:(UIButton *)btn{
//这里面直接用了以前的数据  见谅
    NSArray * nameArray = [[NSArray alloc] init];
    nameArray = [NSArray arrayWithObjects:@"Hello World !0", @"Hello World !1", @"Hello World !2", @"Hello World !3", @"Hello World !4", @"Hello World !5", @"Hello World !6", @"Hello World !7", @"Hello World !8", @"Hello World !9",nil];
    NSArray * imgArray = [[NSArray alloc] init];
    imgArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], [UIImage imageNamed:@"apple.png"], [UIImage imageNamed:@"apple2.png"], nil];

    if (_dropDownView == nil) {
        CGFloat f = 200;
        _dropDownView = [[ZHButtonDropDown alloc]showDropDown:btn withHeight:f withNameArray:nameArray withImgArray:imgArray withAnimationDirection:@"down"];
        _dropDownView.delegate = self;
        
    }else{
        [_dropDownView hideDropDown:btn];
    
        [self relea];
    }

}

-(void)ZHDoropDownDelegateMethod:(ZHButtonDropDown *)sender{
    
    
    NSLog(@"%@",_btnSelect.titleLabel.text);
    [self relea];
}

-(void)relea{
    _dropDownView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
