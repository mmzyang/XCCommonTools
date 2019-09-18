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



+(CGFloat)widthWithStr:(NSString*)str height:(CGFloat)height fontSize:(CGFloat)fontSize minWidth:(CGFloat)minWidth
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSDictionary *titelAttributes = @{NSFontAttributeName:font};
    CGSize Size = CGSizeMake(0, height);
    CGSize size = [str boundingRectWithSize:Size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:titelAttributes context:nil].size;
    CGFloat width = size.width;
    if (width < minWidth) {
        width = minWidth;
    }
    return width;
}
+ (CGFloat)calculateRowHeight:(NSString *)string fontSize:(NSInteger)fontSize{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};//指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(ScreenWidth - 32, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}
+(CGFloat)heightWithStr:(NSString*)str width:(CGFloat)width fontSize:(CGFloat)fontSize minHeight:(CGFloat)minHeight{
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSDictionary *titelAttributes = @{NSFontAttributeName:font};
    CGSize Size = CGSizeMake(width, CGFLOAT_MAX);
    CGSize size = [str boundingRectWithSize:Size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine  attributes:titelAttributes context:nil].size;
    //
    CGFloat height = size.height;
    if (height < minHeight) {
        height = minHeight;
    }
    return height;
}
+(NSMutableAttributedString *)setStringColorLine:(NSString *)str  inRange:(NSString *)rangstr   withColor:(UIColor *)color{
    NSRange range=[str  rangeOfString:rangstr];
    NSMutableAttributedString *attriString=[[NSMutableAttributedString alloc]initWithString:str];
    
    [attriString setAttributes:@{NSForegroundColorAttributeName:color}
                         range:range];
    
    [attriString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
     
                        range:range];
    
    return attriString;
}


+(NSMutableAttributedString *)setStringFontColor:(NSString *)str  inRange:(NSString *)rangstr  fontsize:(UIFont *)font  withColor:(UIColor *)color{
    NSRange range=[str  rangeOfString:rangstr];
    NSMutableAttributedString *attriString=[[NSMutableAttributedString alloc]initWithString:str];
    [attriString setAttributes:@{NSForegroundColorAttributeName:color}
     
                         range:range];
    
    [attriString addAttribute:NSFontAttributeName
                        value:font
                        range:range];
    return attriString;
}


+ (NSDate*)DateFromString:(NSString*)dateString
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSDate* date;
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    date = [formatter dateFromString:dateString];
    
    return date;
}

+ (NSString*)stringFromNow
{
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSString* dateString;
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateString = [formatter stringFromDate:date];
    
    return dateString;
}

+ (BOOL)checkInputIsNumber:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)isValidateEmail:(NSString *)emailString{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isEmail = [emailTest evaluateWithObject:emailString];
    return isEmail;
}
+ (BOOL)isValidatePhone:(NSString *)phoneString
{
    if ([self isEmptyOrWhitespace:phoneString]) {
        return NO;
    }
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[0123456789]|18[0-9]|14[0123456789])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL isMatch = [pred evaluateWithObject:phoneString];
    return isMatch;
}
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    
    identityCard = [identityCard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([identityCard length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:identityCard]) {
        return NO;
    }
    return YES;
}
+ (BOOL)validatePostalcode:(NSString *)postalcode {
    NSString *postalcodeRegex = @"^[1-9]\\d{5}(?!\\d)$";
    NSPredicate *postalcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postalcodeRegex];
    return [postalcodeTest evaluateWithObject:postalcode];
}
/**
 *  防止SQL注入
 *
 *  @param string 传入字符串
 *
 *  @return 正则表达式屏蔽掉SQL注入可能的字符串
 */
+ (NSString *)defenseSQL:(NSString *)string {
    NSString * regExpStr = @"(?:')|(?:_)|(?:--)|\\*|=|\\s|%|(/\\*(?:.|[\\n\\r])*?\\*/)|(\\b(SELECT|UPDATE|AND|OR|DELETE|INSERT|TRANCATE|CHAR|INTO|SUBSTR|ASCII|DECLARE|EXEC|COUNT|MASTER|INTO|DROP|EXECUTE)\\b)";
    NSString * replacement = @"";
    // 创建 NSRegularExpression 对象,匹配 正则表达式
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:regExpStr
                                                                       options:NSRegularExpressionCaseInsensitive|NSRegularExpressionAnchorsMatchLines|NSRegularExpressionDotMatchesLineSeparators
                                                                         error:nil];
    NSString *resultStr = string;
    // 替换匹配的字符串为 searchStr
    resultStr = [regExp stringByReplacingMatchesInString:string
                                                 options:NSMatchingReportCompletion
                                                   range:NSMakeRange(0,string.length)
                                            withTemplate:replacement];
    return resultStr;
}

+(UIColor *)getColor:(NSString*)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
}
///把一个字符串添加分割线
+(NSString *)stringTofengeString:(NSString *)digitString
{
    double string = digitString.doubleValue;
    digitString = [NSString stringWithFormat:@"%.2f",string];

    if (digitString.length <= 5) {

        return digitString;

    } else {
        NSString *xiaoshuString = [digitString substringFromIndex:digitString.length-3];
        NSString *fengeString = [digitString substringToIndex:digitString.length-3];

        NSMutableString *processString = [NSMutableString stringWithString:fengeString];

        NSInteger location = processString.length - 3;

        NSMutableArray *processArray = [NSMutableArray array];

        while (location >= 0) {

            NSString *temp = [processString substringWithRange:NSMakeRange(location, 3)];

            [processArray addObject:temp];

            if (location < 3 && location > 0)

            {

                NSString *t = [processString substringWithRange:NSMakeRange(0, location)];

                [processArray addObject:t];

            }

            location -= 3;

        }

        NSMutableArray *resultsArray = [NSMutableArray array];

        int k = 0;

        for (NSString *str in processArray)

        {

            k++;

            NSMutableString *tmp = [NSMutableString stringWithString:str];

            if (str.length > 2 && k < processArray.count )

            {

                [tmp insertString:@"," atIndex:0];

                [resultsArray addObject:tmp];

            } else {

                [resultsArray addObject:tmp];

            }

        }

        NSMutableString *resultString = [NSMutableString string];

        for (NSInteger i = resultsArray.count - 1 ; i >= 0; i--)

        {

            NSString *tmp = [resultsArray objectAtIndex:i];

            [resultString appendString:tmp];

        }

        [resultString appendString:xiaoshuString];
        return resultString;

    }}

//获取设备UUID
+ (NSString *)getUUIDString
{
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
}

//设置金额文字格式化
+ (NSString *)strmethodComma:(NSString *)string
{
    if ([[string substringToIndex:1] isEqualToString:@"."]) {
        string = [NSString stringWithFormat:@"0%@",string];
    }
   
    NSString *sign = nil;
    if ([string hasPrefix:@"-"] || [string hasPrefix:@"+"]) {
        sign = [string substringToIndex:1];
        string = [string substringFromIndex:1];
    }
    NSString *pointLast = [NSString string];
    NSString *pointFront = [NSString string];
    if ([string containsString:@"."]) {
        
        pointLast = [string substringFromIndex:string.length - 3];
        pointFront = [string substringToIndex:string.length - 3];
    } else {
        pointFront = [string substringToIndex:string.length];

    }
    
    NSInteger commaNum = (pointFront.length - 1) / 3;
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < commaNum + 1; i++) {
        NSInteger index = pointFront.length - (i + 1) * 3;
        NSInteger leng = 3;
        if(index < 0){
            leng = 3 + index;
            index = 0;
        }
        NSRange range = {index, leng};
        NSString *stq = [pointFront substringWithRange:range];
        [arr addObject:stq];
    }
    NSMutableArray *arr2 = [NSMutableArray array];
    for (NSInteger i = arr.count - 1; i >= 0; i--) {
        
        [arr2 addObject:arr[i]];
    }
    NSString *commaString = [NSString string];
    if ([string containsString:@"."]) {
        
        commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
    } else {
        commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:@".00"];

    }
    if (sign) {
        commaString = [sign stringByAppendingString:commaString];
    }
    return commaString;
    
}


+ (NSString *)stringToMoneyString:(NSString *)string {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    double money = [string doubleValue];
    NSNumber * moneyNumber = [NSNumber numberWithDouble:money];
    NSString *newAmount = [formatter stringFromNumber:moneyNumber];
    NSString *strFor = [[NSString alloc]init];
    if ([newAmount containsString:@"."]) {
        NSRange range = [newAmount rangeOfString:@"."];//匹配得到的下标
        if (newAmount.length - range.location == 2) {
            strFor = [newAmount stringByAppendingString:@"0"];
        }
        if (newAmount.length - range.location == 3) {
            strFor = newAmount;
        }
    }else{
        strFor = [newAmount stringByAppendingString:@".00"];

    }
    return strFor;
}

+ (NSString *)stringTogrowthrateMeath:(NSString *)growthrate{
    double floatString = [growthrate doubleValue];
//    floatString = floatString * 100;
    NSString *alludStr = [NSString stringWithFormat:@"%.2f%%", floatString];
    return alludStr;
}
+ (NSString *)stringTogrowthrateMeath1:(NSString *)growthrate{
    double floatString = [growthrate doubleValue];
//    floatString = floatString * 100;
    NSString *alludStr = [NSString stringWithFormat:@"%.2f%%", floatString];
    return alludStr;
}
+ (NSString *)stringTogrowthrateMeath2:(NSString *)growthrate{
    double floatString = [growthrate doubleValue];
        floatString = floatString * 100;
    NSString *alludStr = [NSString stringWithFormat:@"%.2f%%", floatString];
    return alludStr;
}

+ (NSString *)getBirthdaydatewithCertifino:(NSString *)certifino {
    NSString * year = nil;
    NSString * month = nil;
    NSString * day = nil;
    if (certifino.length == 18) {
        year = [certifino substringWithRange:NSMakeRange(6, 4)];
        month = [certifino substringWithRange:NSMakeRange(10, 2)];
        day = [certifino substringWithRange:NSMakeRange(12, 2)];
        NSString * result = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
        return result;
    }else {
        year = [certifino substringWithRange:NSMakeRange(6, 2)];
        month = [certifino substringWithRange:NSMakeRange(8, 2)];
        day = [certifino substringWithRange:NSMakeRange(10, 2)];
        NSString * result = [NSString stringWithFormat:@"19%@-%@-%@",year,month,day];
        return result;
    }
    return @"";
}
+ (NSString *)getBirthdaydatewithCertifinoToHouTai:(NSString *)certifino {
    NSString * year = nil;
    NSString * month = nil;
    NSString * day = nil;
    if (certifino.length == 18) {
        year = [certifino substringWithRange:NSMakeRange(6, 4)];
        month = [certifino substringWithRange:NSMakeRange(10, 2)];
        day = [certifino substringWithRange:NSMakeRange(12, 2)];
        NSString * result = [NSString stringWithFormat:@"%@%@%@",year,month,day];
        return result;
    }else {
        year = [certifino substringWithRange:NSMakeRange(6, 2)];
        month = [certifino substringWithRange:NSMakeRange(8, 2)];
        day = [certifino substringWithRange:NSMakeRange(10, 2)];
        NSString * result = [NSString stringWithFormat:@"19%@%@%@",year,month,day];
        return result;
    }
    return @"";
}
+ (BOOL)cheakUserInfo:(NSDictionary *)dict{
    NSString *deliverway = [dict[@"deliverway"] stringByReplacingOccurrencesOfString:@"*" withString:@""];
    if ([[dict[@"postCode"] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""] ||
        [[dict[@"email"] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""] ||
        [[dict[@"address"] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]  ||
        [dict[@"address"] isEqualToString:@"*"] ||
        [dict[@"postCode"] isEqualToString:@"*"] ||
        [dict[@"email"] isEqualToString:@"*"]||
        [[dict[@"delivertype"] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]  ||
        [dict[@"delivertype"] isEqualToString:@"*"]||
        [[dict[@"vailddate"] stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]  ||
        [dict[@"vailddate"] isEqualToString:@"*"]||
        (![dict[@"delivertype"] isEqualToString:@""]&&[dict[@"deliverway"] isEqualToString:@"1"]&&[deliverway isEqualToString:@""])
        ) {
        return NO;
    }else{
        return YES;
    }
}
@end
