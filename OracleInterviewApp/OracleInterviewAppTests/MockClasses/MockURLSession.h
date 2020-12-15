//
//  MockURLSession.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//
#import "RestClient.h"
#ifndef MockURLSession_h
#define MockURLSession_h

@interface MockURLSession : NSObject<URLSessionProtocol>

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSURLResponse *response;
@property (nonatomic, strong) NSError *error;

@end

#endif /* MockURLSession_h */
