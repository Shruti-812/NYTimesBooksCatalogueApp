//
//  MockRestClient.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 15/12/20.
//

#import <Foundation/Foundation.h>
#import "MockRestClient.h"

@implementation MockRestClient

- (void)send:(WebRequest *)requestObject onCompletion:(void (^)(WebResponse *))completionBlock
{
    completionBlock(_dummyResponse);
}

@end
