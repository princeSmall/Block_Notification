//
//  BViewController.h
//  block-mark
//
//  Created by tongle on 16/7/12.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import <UIKit/UIKit.h>
//协议/代理界面传值
@protocol BViewControllerDelegate <NSObject>

-(void)passTextValue:(NSString *)tlText;

@end


@interface BViewController : UIViewController
//delegate
@property (nonatomic,assign)id <BViewControllerDelegate>delegate;

//property
@property (nonatomic,copy) void (^BViewControllerBlock)(NSString *tlText);
@end
