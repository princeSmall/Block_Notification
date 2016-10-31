//
//  ViewController.m
//  block-mark
//
//  Created by tongle on 16/7/12.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()<BViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *TLLable;
@property (weak, nonatomic) IBOutlet UILabel *TLLable2;
@property (strong, nonatomic) IBOutlet UILabel *TLLable3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(pushToAViewController)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)tongzhi:(NSNotification *)text{
    self.TLLable3.text = text.userInfo[@"text"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushToAViewController{
    
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    BViewController * BView = [story instantiateViewControllerWithIdentifier:@"BViewController"];
    //使用delegate代理，实现两个页面之间传值
    BView.delegate=self;
    
    //使用Block作为property，实现两个页面之间传值
    BView.BViewControllerBlock = ^(NSString *tlText){
        self.TLLable.text = tlText;
    };
    [self.navigationController pushViewController:BView animated:YES];

}
//delegate实现的方法
-(void)passTextValue:(NSString *)tlText
{
    self.TLLable2.text = tlText;
}

@end
