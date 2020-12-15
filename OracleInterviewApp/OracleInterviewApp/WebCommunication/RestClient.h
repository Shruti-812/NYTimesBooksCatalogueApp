//
//  RestClient.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 13/12/20.
//

#import "WebRequest.h"
#import "WebResponse.h"
#ifndef RestClient_h
#define RestClient_h

@protocol URLSessionDataTaskProtocol <NSObject>

-(void)resume;

@end

@protocol URLSessionProtocol <NSObject>

- (id<URLSessionDataTaskProtocol>) dataTaskWithRequest: (NSURLRequest *)request
                                    completionHandler: (void (^)(NSData *data, NSURLResponse *response, NSError *error)) completionHandler;

@end

@interface NSURLSession() <URLSessionProtocol>
{}
@end

@protocol RestClientProtocol <NSObject>

-(void)send:(WebRequest *)requestObject
            onCompletion:(void(^)(WebResponse *))completionBlock;

@end

@interface RestClient: NSObject<RestClientProtocol, NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) id<URLSessionProtocol> urlSession;
@property (nonatomic, strong) id<URLSessionDataTaskProtocol> dataTask;
-(void)send:(WebRequest *)requestObject
            onCompletion:(void(^)(WebResponse *))completionBlock;

@end

#endif /* RestClient_h */
