//
//  Teacher.h
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSObject

// Objective-C 的 API 和 Swift 的风格相差比较大,Swift 调用 Objective-C 的 API 时可能由于数据类型等不一致导致无法达到预期(比如,Objective-C 里的方法采用了 C 语言风格的多参数类型;或者 Objective-C 方法返回 NSNotFound,在 Swift 中期望返回 nil).这时候就要 NS_REFINED_FOR_SWIFT 了.
- (NSInteger)indexOfString:(NSString *)aString NS_REFINED_FOR_SWIFT;

@end

NS_ASSUME_NONNULL_END
