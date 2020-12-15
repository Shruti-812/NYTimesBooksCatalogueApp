//
//  MockURLSession.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <Foundation/Foundation.h>
#import "MockURLSession.h"
#import "MockURLSessionDataTask.h"

@implementation MockURLSession

- (id<URLSessionDataTaskProtocol>)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler
{
    completionHandler(_data, _response, _error);    
    return [[MockURLSessionDataTask alloc] init];    
}

@end
