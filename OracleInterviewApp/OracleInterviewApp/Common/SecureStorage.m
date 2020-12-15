//
//  SecureStorage.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <Foundation/Foundation.h>
#import "SecureStorage.h"

@implementation SecureStorage

+ (NSString *)getAPIKey
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"Info" ofType: @"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
    id obj = [dict objectForKey: @"API_KEY"];
    return obj;
}

@end
