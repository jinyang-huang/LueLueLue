//
//  NSObject+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/21.
//  Copyright © 2017年 api. All rights reserved.
//

#import "NSObject+HAdd.h"
#import <objc/runtime.h>

@implementation NSObject (HAdd)

#pragma makr - Model转Dictionary
-(NSDictionary *)toDictionary
{
    NSMutableDictionary *mutableDictionary=[[NSMutableDictionary alloc] init];
    NSArray *propertyArray=[self propertyArray];
    if ([self isKindOfClass:[UIImage class]]||
        [self isKindOfClass:[NSData class]]) {
        return nil;
    }
    else if([self isKindOfClass:[NSDictionary class]]){
        return (NSDictionary*)self;
    }
    for (NSInteger i=0; i<propertyArray.count; i++)
    {
        NSString *key=propertyArray[i];
        id value=[self valueForKey:key];
        if ([value isKindOfClass:[NSNumber class]]) {
            value = [NSString stringWithFormat:@"%@",value];
        }
        if ([value isKindOfClass:[NSString class]]){
            if ([value isEqualToString:@"(null)"]) {
                value = @"";
            }
            if (![value length]||!value){
                
            }else{
                [mutableDictionary setObject:value forKey:key];
            }
        }
        else if([value isKindOfClass:[NSArray class]]){
            if (![value count])
            {
                
            } else if ([[value firstObject] isKindOfClass:[NSString class]]) {
                [mutableDictionary setObject:value forKey:key];
            }
            else
            {
                NSMutableArray *mutableArray=[[NSMutableArray alloc] init];
                NSArray *array=value;
                for (NSInteger i=0; i<array.count; i++)
                {
                    id object=array[i];
                    NSDictionary *dic =[object toDictionary];
                    if (dic) {
                        [mutableArray addObject:dic];
                    }
                    else{
                    }
                }
                [mutableDictionary setObject:mutableArray forKey:key];
            }
        }
        else
        {
            if (!value)
            {
            }
            else
            {
                NSDictionary  *dic=[value toDictionary];
                if (dic) {
                    [mutableDictionary setObject:dic forKey:key];
                }
                else{
                }
            }
        }
    }
    return mutableDictionary;
}
#pragma mark - 获取成员变量名
-(NSArray *)propertyArray
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary*)self allKeys];
    } else {
        NSMutableArray *propertyArray=[[NSMutableArray alloc] init];
        unsigned int propsCount;
        objc_property_t *props = class_copyPropertyList([self class], &propsCount);
        for(int i = 0;i < propsCount; i++){
            objc_property_t  prop = props[i];
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
            [propertyArray addObject:propName];
        }
        free(props);
        return propertyArray;
    }
    
}

+(BOOL)isNumber:(NSString *)numberStirng{
    NSArray *arrayStr=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"."];
    
    if (numberStirng.length>20){
        return NO;
    }
    for (NSInteger i=0; i<numberStirng.length; i++){
        NSString *str=[numberStirng substringWithRange:NSMakeRange(i, 1)];
        for (NSInteger j=0; j<arrayStr.count; j++){
            if ([str isEqualToString:arrayStr[j]]){
                break;
            }
            else if (j==arrayStr.count-1&&![str isEqualToString:[arrayStr lastObject]]){
                return NO;
            }
        }
    }
    return YES;
}

@end
