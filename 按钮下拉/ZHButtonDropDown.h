//
//  ZHButtonDropDown.h
//  按钮下拉
//
//  Created by 禚恒 on 16/5/18.
//  Copyright © 2016年 jinzhuanch. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理方法
@class ZHButtonDropDown;
@protocol ZHDropDownDelegate <NSObject>

-(void)ZHDoropDownDelegateMethod:(ZHButtonDropDown *) sender;

@end


@interface ZHButtonDropDown : UIView<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *imgView;
}

@property (nonatomic,weak) id<ZHDropDownDelegate> delegate;
@property (nonatomic,copy) NSString *animationDirection;


-(id)showDropDown:(UIButton *)btn
       withHeight:(CGFloat)height
    withNameArray:(NSArray *)namArray
     withImgArray:(NSArray *)imgArray
withAnimationDirection:(NSString *)direction;
//隐藏
-(void)hideDropDown:(UIButton *)btn;

@end
