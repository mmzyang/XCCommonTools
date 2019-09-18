//
//  NSString+Extension.m
//  ConsignmentSaleProject
//
//  Created by 刘洪良 on 16/6/16.
//  Copyright © 2016年 szkingdom. All rights reserved.
//

#import "NSString+Extension.h"


@implementation NSString (Extension)

+ (BOOL)isEmptyOrWhitespace:(NSString*)string
{
    if((id)string==[NSNull null] || string==nil || string==NULL)
        return YES;
    
    if(!string)
        return YES;
    
    if(string.length<=0)
        return YES;
    
    if([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length<=0)
        return YES;
    
    return NO;
}

@end
