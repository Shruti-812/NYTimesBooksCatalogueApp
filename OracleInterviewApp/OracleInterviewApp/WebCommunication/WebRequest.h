//
//  WebRequest.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 13/12/20.
//

#ifndef WebRequest_h
#define WebRequest_h

@interface WebRequest: NSObject

typedef NS_ENUM(NSInteger, HttpMethod)
{
    GET = 0,
    POST = 1,
    PUT = 2,
    PATCH = 3,
    DELETE = 4
};

@property (nonatomic, strong) NSURLRequest *request;

- (instancetype)initWithURL:(NSString *)url
                 httpMethod:(HttpMethod)method
                 requestBody:(NSData *)body;

@end

#endif /* WebRequest_h */
