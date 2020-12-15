//
//  Book.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@implementation Book

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        _title = dictionary[@"title"];
        _author = dictionary[@"author"];
        _publisher = dictionary[@"publisher"];
        _bookDescription = dictionary[@"description"];
        _contributor = dictionary[@"contributor"];
    }
    return self;
}

@end
