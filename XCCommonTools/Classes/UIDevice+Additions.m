//
//  UIDevice+Additions.m
//  QuickScan
//
//  Created by  on 14-6-23.
//
//

#import "UIDevice+Additions.h"

@implementation UIDevice (Additions)



+ (BOOL)isIPad
{
    if ([self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isIPhone
{
    if ([self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        return YES;
    }
    
    return NO;
}


+ (BOOL)iPhoneXSeries
{
    CGFloat sh = CGRectGetHeight([UIScreen mainScreen].bounds);
    //return (sh == 812 || sh == 896);
    return sh >= 812;
}

+ (CGFloat)heightOfStatusBar
{
    return [self iPhoneXSeries] ? 44.0 : 20.0;
}

+ (CGFloat)heightOfStatusBarAndNavigationBar
{
    return [self iPhoneXSeries] ? 88.0 : 64.0;
}

+ (CGFloat)safeAreaOfTop
{
    return [self iPhoneXSeries] ? 24.0 : 0.0;
}

+ (CGFloat)safeAreaOfBottom
{
    return [self iPhoneXSeries] ? 34.0 : 0.0;
}







@end
