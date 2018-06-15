//
//  NSString+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import "NSString+HAdd.h"

@implementation NSString (HAdd)

- (CGSize)sizeWithFont:(id )font maxSize:(CGSize)maxSize
{
    UIFont *f;
    if ([font isKindOfClass:[UIFont class]]) {
        f = font;
    }
    else{
        CGFloat fontNum = [font floatValue];
        f = [UIFont systemFontOfSize:fontNum];
    }
    NSDictionary *attrs = @{NSFontAttributeName : f};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


-(NSString *)RpNumberFormatter{
    BOOL isNegative = NO;
    NSString *text = self;
    if ([[self substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"-"]) {
        text= [text substringFromIndex:1];
        isNegative = YES;
    }
    if(!text || [text floatValue] == 0){
        return @"0";
    }
    if (text.floatValue < 1000) {
        return  [NSString stringWithFormat:@"%ld",text.integerValue];
    };
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setUsesGroupingSeparator:YES];
    [numberFormatter setGroupingSize:3];
    [numberFormatter setGroupingSeparator:@"."];
    
    NSString *result =[numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    if (isNegative) {
        return [NSString stringWithFormat:@"-Rp%@",result];
    }
    else{
        return [NSString stringWithFormat:@"Rp%@",result];
    }
}

- (NSNumber *)toNumber{
    return [NSNumber numberWithInteger:[self integerValue]];
}

- (NSURL *)toUrl{
    return [NSURL URLWithString:self];
}

- (NSString *)USDollarStr{
    return [NSString stringWithFormat:@"$%@",self];
}

+ (NSString *)integerTransToUSD:(NSInteger)usdInteger{
    NSString *str = [NSString stringWithFormat:@"%ld",usdInteger];
    return [NSString stringWithFormat:@"$%@.00",str];
}

+ (NSString *)integerMoney:(float)usdFloat{
    NSString *str = [NSString stringWithFormat:@"%.2f",usdFloat];
    return [NSString stringWithFormat:@"%@",str];
}

- (NSString *)slashTimeTrans{
    NSDateFormatter *f1 = [[NSDateFormatter alloc] init];
    f1.dateFormat = @"yyyy/MM/dd";
    NSDate *date = [f1 dateFromString:self];
    
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    f2.dateFormat = @"dd/MM/yyyy";
    NSString *dealedDate = [f2 stringFromDate:date];
    
    return dealedDate;
}

- (NSString *)moneyType{
    int count = 0;
    
    NSString *formatterStr = self;
    NSArray *pointArr = [self componentsSeparatedByString:@"."];
    if (pointArr.count == 2) {
        formatterStr= pointArr[0];
    }
    
    long long int a = formatterStr.longLongValue;
    
    while (a != 0){
        
        count++;
        
        a /= 10;
        
    }
    
    NSMutableString *string = [NSMutableString stringWithString:formatterStr];
    
    NSMutableString *newstring = [NSMutableString string];
    
    while (count > 3) {
        
        count -= 3;
        
        NSRange rang = NSMakeRange(string.length - 3, 3);
        
        NSString *str = [string substringWithRange:rang];
        
        [newstring insertString:str atIndex:0];
        
        [newstring insertString:@"," atIndex:0];
        
        [string deleteCharactersInRange:rang];
        
    }
    
    [newstring insertString:string atIndex:0];
    if (pointArr.count == 2) {
        newstring = [[NSString stringWithFormat:@"%@.%@",newstring,pointArr[1]] mutableCopy];
    }
    return newstring;
}

- (NSString *)dot_moneyType{
    int count = 0;
    
    NSString *formatterStr = self;
    NSArray *pointArr = [self componentsSeparatedByString:@"."];
    if (pointArr.count == 2) {
        formatterStr= pointArr[0];
    }
    
    long long int a = formatterStr.longLongValue;
    
    while (a != 0){
        
        count++;
        
        a /= 10;
        
    }
    
    NSMutableString *string = [NSMutableString stringWithString:formatterStr];
    
    NSMutableString *newstring = [NSMutableString string];
    
    while (count > 3) {
        
        count -= 3;
        
        NSRange rang = NSMakeRange(string.length - 3, 3);
        
        NSString *str = [string substringWithRange:rang];
        
        [newstring insertString:str atIndex:0];
        
        [newstring insertString:@"," atIndex:0];
        
        [string deleteCharactersInRange:rang];
        
    }
    
    [newstring insertString:string atIndex:0];
    if (pointArr.count == 2) {
        newstring = [[NSString stringWithFormat:@"%@.%@",newstring,pointArr[1]] mutableCopy];
    }
//    newstring = [NSString stringWithFormat:@"%@.00",newstring];
    return newstring;
}

+(NSString *)integerMoneyType:(NSInteger)inte{
    
    return [[NSString stringWithFormat:@"%ld.00",inte] moneyType];
}

@end
