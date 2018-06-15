//
//  NSString+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUSD(ld) [NSString integerMoneyType:(ld)]


@interface NSString (HAdd)
- (CGSize )sizeWithFont:(id )font maxSize:(CGSize)maxSize;

-(NSString *)RpNumberFormatter;

- (NSURL *)toUrl;

- (NSString *)USDollarStr;
- (NSNumber *)toNumber;
+ (NSString *)integerTransToUSD:(NSInteger)usdInteger;
+ (NSString *)integerMoney:(float)usdFloat;
- (NSString *)dot_moneyType;
- (NSString *)moneyType;
- (NSString *)slashTimeTrans;

+(NSString *)integerMoneyType:(NSInteger)inte;
@end
