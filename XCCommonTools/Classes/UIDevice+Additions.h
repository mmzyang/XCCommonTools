//
//  UIDevice+Additions.h
//  QuickScan
//
//  Created by  on 14-6-23.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (Additions)

/// 判断是否 iPad
+ (BOOL)isIPad;

/// 判断是否 iPhone
+ (BOOL)isIPhone;


/// 判断是否 iPhone X 系列手机。iPhone X, XS, XS Max, XR 都返回 YES，其他返回 NO
+ (BOOL)iPhoneXSeries;

/// 状态栏高度
+ (CGFloat)heightOfStatusBar;

/// 状态栏和导航栏总高度
+ (CGFloat)heightOfStatusBarAndNavigationBar;

/// 顶部安全区域高度
+ (CGFloat)safeAreaOfTop;

/// 底部安全区域高度
+ (CGFloat)safeAreaOfBottom;





@end
