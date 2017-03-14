# ZZBindDemo_2
绑定视图和模型，用于通过简单统一的代码让视图的值填充到模型中

#### 使用方法####

把`ZZBindBaseModel`和`NSObject+ZZModelDriven`两个类拖入工程：

```objective-c
#import "ViewController.h"
#import "NSObject+ZZModelDriven.h"
#import "StudentModel.h"

@interface ViewController () <ZZModelDrivenDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *scoreField;
@property (weak, nonatomic) IBOutlet UITextField *keyboardNameField;

@property (nonatomic) StudentModel *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.student = [[StudentModel alloc] init];
    
    
    // usernameField.text -> self.student.username
    self.autoBind(self.usernameField, @"text", @"username");
    
    // passwordField.text -> self.student.password
    self.autoBind(self.passwordField, @"text", @"password");
    
    // scoreField.text -> self.student.score
    self.autoBind(self.scoreField, @"text", @"score");
    
    // keyboardNameField.text -> self.student.computer.keyboard.name
    self.autoBind(self.keyboardNameField, @"text", @"computer.keyboard.name");
}

- (IBAction)submit:(id)sender {
    [self zz_bind];
    [self.student printInfo];
}

- (void)zz_willBind {
    NSLog(@"WillBind");
}

- (void)zz_afterBind {
    NSLog(@"After Bind");
}

- (id)zz_getModel {
    return self.student;
}

@end
```

注意事项：

控制器当接受协议`ZZModelDrivenDelegate`并实现里面的方法`getModel`, 这个方法里返回的对象即是要填充的对象

--------

但是这种方式还是有些“笨拙”，如果使用RAC来处理，就会优雅很多，参见当前目录下的**RAC_BindDemo**