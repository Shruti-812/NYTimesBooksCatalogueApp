//
//  RestClient.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import <Foundation/Foundation.h>
#import "WebRequest.h"
#import "WebResponse.h"
#import "RestClient.h"

@implementation RestClient

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _urlSession = [NSURLSession sessionWithConfiguration: configuration];
    }
    return self;
}

- (void)send:(WebRequest *)requestObject
                onCompletion:(void (^)(WebResponse *))completionBlock
{
    _dataTask = [_urlSession dataTaskWithRequest: [requestObject request]
                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSInteger statusCode = httpResponse.statusCode;
        WebResponse *responseObject = [[WebResponse alloc] initWithHttpStatusCode: &statusCode
                                                                     responseBody: data
                                                                            error:error];
        completionBlock(responseObject);
    }];
    [_dataTask resume];
}

@end

