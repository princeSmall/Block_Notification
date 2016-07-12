

//
//  BViewController.m
//  block-mark
//
//  Created by tongle on 16/7/12.
//  Copyright © 2016年 tongle. All rights reserved.
//

//在类中，定义一个Block变量，就像定义一个函数；
//Block可以定义在方法内部，也可以定义在方法外部；
//只有调用block时候，才会执行其{}体内的代码；


#import "BViewController.h"

@interface BViewController ()
- (IBAction)TLBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *TLTextField;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 定义无参数返回值得block
    void (^printBlock)() = ^(){
        printf("no number");
    };
    printBlock();
    printBlock(9);
    
    int mutiplier= 7;
    // 定义名为myBlock的代码块，返回值类型为int
    int (^myBlock)(int) = ^(int num){
        return num * mutiplier;
    };
    
    int newMutiplier = myBlock(3);
    printf("newMutiplier is %d,%d",myBlock(3),newMutiplier);

    // Do any additional setup after loading the view.
}
void (^printNumBlock)(int) = ^(int num)
{
    printf("int number is %d",num);
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)TLBtn:(id)sender {
    //delegate
    if (self.delegate &&[self.delegate respondsToSelector:@selector(passTextValue:)]) {
        [self.delegate passTextValue:self.TLTextField.text];
    }
    
    
    // property
    if (self.BViewControllerBlock) {
        self.BViewControllerBlock(self.TLTextField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
