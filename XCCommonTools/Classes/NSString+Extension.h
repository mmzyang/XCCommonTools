//
//  NSString+Extension.h
//  ConsignmentSaleProject
//
//  Created by 刘洪良 on 16/6/16.
//  Copyright © 2016年 szkingdom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  判断字符串是否为空
 *
 *  @param string NSString
 *
 *  @return NSString
 */
+ (BOOL)isEmptyOrWhitespace:(NSString*)string;

@end
