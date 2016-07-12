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
- (IBAction)TLBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *TLLable;
@property (weak, nonatomic) IBOutlet UILabel *TLLable2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TLBtn:(id)sender {
    
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
