# Block_mark

##实例中使用的是两个viewController之间的跳转及传值。 首先确定哪个控制器传值给哪个控制器，实例中是B控制器值传回A控制器

1、代理的简单使用

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

    
    void (^printNumBlock)(int) = ^(int num)
    {
    printf("int number is %d",num);
    };


2、protocol代理传值
    
    B控制器：
    
    @protocol BViewControllerDelegate <NSObject>

    -(void)passTextValue:(NSString *)tlText;
    
    @end
    
    @property (nonatomic,assign)id <BViewControllerDelegate>delegate;
    
    在点击事件中添加响应方法：
    
    if (self.delegate &&[self.delegate respondsToSelector:@selector(passTextValue:)]) {
        [self.delegate passTextValue:self.TLTextField.text];
    }
    
    A控制器：
    
    实现B控制器方法、在生成B控制器对象时遵循B控制器delegate
    
    -(void)passTextValue:(NSString *)tlText
    {
    self.TLLable2.text = tlText;
    }
    
     BView.delegate=self;


    

3、protocol属性传值

    B控制器：
    
    声明block属性
    
    @property (nonatomic,copy) void (^BViewControllerBlock)(NSString *tlText);
    
    在方法体中给block赋值
    
    if (self.BViewControllerBlock) {
    
        self.BViewControllerBlock(self.TLTextField.text);
        
    }
    
    A控制器：
    
    在生成B控制器对象的方法体h中接收值
    
    BView.BViewControllerBlock = ^(NSString *tlText){
    
        self.TLLable.text = tlText;
        
    };

4、notification传值
    
    B控制器：
    
    将值通过key值传递
    
     NSDictionary * dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.TLTextField.text,@"text", nil];
    
    创建通知：
    
    NSNotification * notification = [NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dictionary];
    
    通过通知中心发送通知
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    A控制器：
    
    注册通知，在viewDidLoad中监听值的变化
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
    
    方法接收返回值
    
    -(void)tongzhi:(NSNotification *)text{ 
    
    self.TLLable3.text = text.userInfo[@"text"];
    
    }
   

