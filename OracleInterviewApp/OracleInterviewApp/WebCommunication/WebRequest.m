//
//  WebRequest.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import <Foundation/Foundation.h>
#import "WebRequest.h"
#import "Constants.h"
#import "SecureStorage.h"

@implementation WebRequest

NSString* const kHttpMethodIdentifier[] = {
    [GET] = @"GET",
    [POST] = @"POST",
    [PUT] = @"PUT",
    [PATCH] = @"PATCH",
    [DELETE] = @"DELETE",
};

- (instancetype)initWithURL:(NSString *)url
                 httpMethod:(HttpMethod)method
                requestBody:(NSData *)body
{
    self = [super init];
    if (self)
    {
        NSURL *_endpointURL = [NSURL URLWithString: url];
        NSMutableURLRequest *_draftRequest = [NSMutableURLRequest requestWithURL:_endpointURL];
        _draftRequest.HTTPMethod = kHttpMethodIdentifier[method];
        _draftRequest.allHTTPHeaderFields = @{ @"Content-Type" : @"application/json", @"Accept" : @"application/json" };
        _draftRequest.HTTPBody = body;
        _draftRequest.timeoutInterval = kRestAPITimeout;
        _request = _draftRequest;
    }
    return self;
}

@end
