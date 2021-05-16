//
//  MyViewController.h
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController

// 在 Objective-C 中重新命名在 Swift 中的名称
- (void)test1 NS_SWIFT_NAME(myTest());
// 在 Swift 中不可见,不能使用
- (void)test2 NS_SWIFT_UNAVAILABLE("请使用myTest");

@end

NS_ASSUME_NONNULL_END
