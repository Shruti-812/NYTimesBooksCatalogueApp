//
//  WebResponse.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import <Foundation/Foundation.h>
#import "WebResponse.h"
#import "Constants.h"

@implementation WebResponse

- (instancetype)initWithHttpStatusCode:(NSInteger *)statusCode
                responseBody:(NSData *)body
                error: (NSError *)error
{
    self = [super init];
    if (self)
    {
        _apiError = error;
        if (_apiError == nil)
        {
            _isSuccess = (*statusCode >= 200 && *statusCode < 300);
                
            if (body != nil)
            {
                NSError *parsingError = nil;
                _json = [NSJSONSerialization JSONObjectWithData: body
                                            options: NSJSONReadingAllowFragments
                                            error: &parsingError];
                _isSuccess = (parsingError == nil) && (_json != nil);
                _apiError = parsingError;
            }
        }
        else
        {
            _isSuccess = false;
        }
    }
    return self;
}

@end
