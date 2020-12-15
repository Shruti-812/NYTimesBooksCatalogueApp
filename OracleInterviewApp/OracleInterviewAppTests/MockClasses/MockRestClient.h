//
//  MockRestClient.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 15/12/20.
//

#import "RestClient.h"
#ifndef MockRestClient_h
#define MockRestClient_h

@interface MockRestClient : NSObject<RestClientProtocol>

@property (nonatomic, strong) WebResponse *dummyResponse;

@end

#endif /* MockRestClient_h */
