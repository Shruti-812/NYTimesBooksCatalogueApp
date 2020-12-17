//
//  MockBookDataService.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 17/12/20.
//

#import <Foundation/Foundation.h>
#import "MockBookDataService.h"

@implementation MockBookDataService

- (void)getBestsellerBookList:(void (^)(BookList *))onComplete
{
    onComplete(_booksData);
}

- (void)getBestsellerBookListForDate:(NSDate *)date completionHandler:(void (^)(BookList *))onComplete
{
    onComplete(_booksData);
}

@end
