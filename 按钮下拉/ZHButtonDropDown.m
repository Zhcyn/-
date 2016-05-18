//
//  ZHButtonDropDown.m
//  按钮下拉
//
//  Created by 禚恒 on 16/5/18.
//  Copyright © 2016年 jinzhuanch. All rights reserved.
//

#import "ZHButtonDropDown.h"

@interface ZHButtonDropDown ()

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) UIButton *selctBtn;
@property (nonatomic,copy) NSArray *nameArray;
@property (nonatomic,copy) NSArray *imageArray;

@end


@implementation ZHButtonDropDown


-(id)showDropDown:(UIButton *)btn withHeight:(CGFloat)height withNameArray:(NSArray *)namArray withImgArray:(NSArray *)imgArray withAnimationDirection:(NSString *)direction{
    
    _selctBtn = btn;
    self.animationDirection = direction;
    self.myTableView = (UITableView *)[super init];
    if (self) {
        CGRect frame = btn.frame;
        self.nameArray = [NSArray arrayWithArray:namArray];
        self.imageArray = [NSArray arrayWithArray:imgArray];
        
        
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-3, -3);
            
        }else if ([direction isEqualToString:@"down"]){
            self.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-3, -3);
        }
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.layer.cornerRadius = 5;
        _myTableView.backgroundColor = [UIColor redColor];
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _myTableView.separatorColor = [UIColor grayColor];
        
        
        [UIView animateWithDuration:0.5 animations:^{
            if ([direction isEqualToString:@"up"]) {
                self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
                
            }else if ([direction isEqualToString:@"down"]){
                self.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, height);
            }
            
            _myTableView.frame = CGRectMake(0, 0, frame.size.width, height);
            
        }];
        
        
        
        
        
        
        [btn.superview addSubview:self];
        [self addSubview:_myTableView];
        

    }
    
    return self;
    
}

-(void)hideDropDown:(UIButton *)btn{
    
    CGRect frame = btn.frame;
    
    [UIView animateWithDuration:0.5 animations:^{
        if ([_animationDirection isEqualToString:@"up"]) {
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
            
        }else if ([_animationDirection isEqualToString:@"down"]){
            self.frame = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, 0);
        }
        _myTableView.frame = CGRectMake(0, 0, frame.size.width, 0);
    }];

}
#pragma mark delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if (_imageArray.count == _nameArray.count) {
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        cell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
    }else if (_imageArray.count > _nameArray.count)   {
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        if (indexPath.row < _imageArray.count) {
            cell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
        }
    }else if (_imageArray.count < _nameArray.count){
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        if (indexPath.row < _imageArray.count) {
            cell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
        }
    }
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view;
    
    return cell;
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self hideDropDown:_selctBtn];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [_selctBtn setTitle:cell.textLabel.text forState:UIControlStateNormal];
    
    for (UIView *subView in _selctBtn.subviews) {
        if ([subView isKindOfClass:[UIImageView class]]) {
            [subView removeFromSuperview];
        }
    }
    
    imgView.image = cell.imageView.image;
    imgView = [[UIImageView alloc]initWithImage:cell.imageView.image];
    imgView.frame = CGRectMake(5, 5, 25, 25);
    [_selctBtn addSubview:imgView];
    [self myDelegate];
    

}

-(void)myDelegate{
    [self.delegate ZHDoropDownDelegateMethod:self];
}

-(void)dealloc{

}








@end
