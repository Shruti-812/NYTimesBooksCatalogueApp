//
//  WebResponse.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 13/12/20.
//

#ifndef WebResponse_h
#define WebResponse_h

@interface WebResponse: NSObject

@property (nonatomic, assign) bool isSuccess;
@property (nonatomic, strong) NSDictionary* json;
@property (nonatomic, strong) NSError *apiError;
- (instancetype)initWithHttpStatusCode: (NSInteger *)statusCode
                responseBody: (NSData *)body
                error: (NSError *)apiError;
@end

#endif /* WebResponse_h */
