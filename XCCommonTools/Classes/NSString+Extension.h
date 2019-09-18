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

/**
 *  根据条件计算字符串的宽度
 *
 *  @param str       需要计算的字符串
 *  @param width     确定的宽度
 *  @param fontSize  字体大小
 *  @param minHeight 最小宽度
 *
 *  @return
 */
+(CGFloat)widthWithStr:(NSString*)str height:(CGFloat)height fontSize:(CGFloat)fontSize minWidth:(CGFloat)minWidth;
/**
 *  根据条件计算字符串的高度
 *
 *  @param str       需要计算的字符串
 *  @param width     确定的高度
 *  @param fontSize  字体大小
 *  @param minHeight 最小高度
 *
 *  @return
 */
+(CGFloat)heightWithStr:(NSString*)str width:(CGFloat)width fontSize:(CGFloat)fontSize minHeight:(CGFloat)minHeight;
/**
 *  设置下划线
 *
 *  @param str        字符串
 *  @param rangstr  不同颜色字符串
 *  @param color 设置的颜色
 *
 *  @return
 */
+(NSMutableAttributedString *)setStringColorLine:(NSString *)str  inRange:(NSString *)rangstr   withColor:(UIColor *)color;

/**
 *  根据条件设置某几个字符的颜色不同
 *
 *  @param str       需要计算的字符串
 *  @param rangstr     显示不同颜色的字符串
 *  @param font  字体大小
 *  @param color 显示的颜色
 *
 *  @return
 */

+(NSMutableAttributedString *)setStringFontColor:(NSString *)str  inRange:(NSString *)rangstr  fontsize:(UIFont *)font  withColor:(UIColor *)color;


/**
 *  将日期字符串格式转换为日期格式
 *
 *  @param dateString NSString
 *
 *  @return NSDate
 */

+ (NSDate*)DateFromString:(NSString*)dateString;

/**
 *  将当前日期转换为字符串格式
 *
 *  @return  NSString
 */
+ (NSString*)stringFromNow;

/**
 *  判断输入的是不是数字
 *
 *  @param string
 *
 *  @return
 */
+ (BOOL)checkInputIsNumber:(NSString *)string;

/**
 *  判断输入的是不是邮件格式
 *
 *  @param emailString
 *
 *  @return
 */
+ (BOOL)isValidateEmail:(NSString *)emailString;

/**
 *  判断输入的是不是电话号码
 *
 *  @param phoneString
 *
 *  @return 
 */
+ (BOOL)isValidatePhone:(NSString *)phoneString;
/**
 *  身份证验证
 *
 *  @param identityCard identityCard description
 *
 *  @return return value description
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
/**
 *  中国邮政编码验证
 *
 *  @param postalcode 邮政编码
 *
 *  @return BOOL value
 */
+ (BOOL)validatePostalcode:(NSString *)postalcode;
/**
 *  获取色值
 *
 *  @param hexColor
 *
 *  @return return UIColor
 */
+ (UIColor *)getColor:(NSString*)hexColor;
/**
 *  防止SQL注入
 *
 *  @param string 传入字符串
 *
 *  @return 正则表达式屏蔽掉SQL注入可能的字符串
 */
+ (NSString *)defenseSQL:(NSString *)string;
///把一个字符串添加分割线
+(NSString *)stringTofengeString:(NSString *)digitString;
/**
 *  获取设备UUID
 */
+ (NSString *)getUUIDString;
/**
 *  设置金额文字格式化(例如:2,000.00)
 */
+ (NSString *)strmethodComma:(NSString *)string;
+ (NSString *)stringToMoneyString:(NSString *)string;
///
+ (NSString *)stringTogrowthrateMeath:(NSString *)growthrate;
+ (NSString *)stringTogrowthrateMeath1:(NSString *)growthrate;
//根据身份证获取生日
+ (NSString *)getBirthdaydatewithCertifino:(NSString *)certifino;
+ (NSString *)getBirthdaydatewithCertifinoToHouTai:(NSString *)certifino;
//校验是否完整填写了用户信息
+ (BOOL)cheakUserInfo:(NSDictionary *)dict;
@end
