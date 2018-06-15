//
//  NSDate+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/25.
//  Copyright © 2017年 api. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HAdd)


+(NSString *)todayEEE_DDMMYYYY;
+(NSString *)tomorrowEEE_DDMMYYYY;
+(NSDate *)tomorrowDay;

-(NSString *)formatterWithEEEEE_D_MMMMM_YYYY;
+ (NSString *)dateWeekWithDate:(NSDate *)paramDate;
+ (NSString *)monthStr:(NSString *)index;
+ (NSString *)monthMMMStr:(NSString *)index;

//Tue,19 Aug
- (NSString *)EEE_DD_MMM;

//Tue,19 Aug 2018
- (NSString *)EEE_DD_MMM_yyyy;
// Tue
+ (NSString *)dateEEEWeekWithDate:(NSDate *)paramDate;

+ (NSDate *)normalYYYY_MM_ddDateToDate:(NSString *)str;

+ (NSString *)headerDate;
- (NSString *)normalYYYY_MM_ddDate;
- (NSString *)normalHH_MMDate;
- (NSString *)dd_MMM_YYYY;
- (NSString *)dd_MMMMMMMM_YYYY;
-(NSDate *)tomorrowDay;
- (NSString *)MMmonthDate;
- (NSString *)HHhourDate;

- (NSString *)ddmmYYYYWithSlash;
- (NSString *)yyyyMMddTHHmmss;

- (NSDate *)self_dateAfter:(NSInteger)days;

- (NSDate *)dateAfter:(NSInteger)days;
+ (NSInteger)daysToSundayWith:(NSDate *)date;
- (NSString *)formatterWithEEEEE_dd_MM_yyyyBySlash;
+ (NSDate *)giveDate:(NSDate *)date addMonth:(NSInteger)monthNum;
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;
+ (NSDate *)dateFrom_yyyyMMddTHHmmss:(NSString *)string;
// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth;

// 当前几号
+(NSInteger)currentDay;///<当前几号
//获取下x个月月底那一天的日期
-(NSDate *)getLastDateAfter:(NSInteger)monthNum;
@end
