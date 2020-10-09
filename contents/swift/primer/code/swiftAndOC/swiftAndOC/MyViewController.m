//
//  MyViewController.m
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

#import "MyViewController.h"
#import "swiftAndOC-Swift.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"OC页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"OC 里的页面";
    [self.view addSubview:label];
    
    Person *p = [[Person alloc] initWithName:@"zhangsan" age:20];
    NSLog(@"%@", p.name);
}

- (void)test1 {
    NSLog(@"%@", @"test1");
}

- (void)test2 {
    NSLog(@"%@", @"test2");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
