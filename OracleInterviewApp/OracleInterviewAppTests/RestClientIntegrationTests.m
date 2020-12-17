//
//  RestClientIntegrationTests.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <XCTest/XCTest.h>
#import "RestClient.h"
#import "Constants.h"
#import "SecureStorage.h"

@interface RestClientIntegrationTests : XCTestCase

@property (nonatomic) RestClient *restClient;

@end

@implementation RestClientIntegrationTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

-(void) testOverviewAPI_ShouldReturnJSON
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    _restClient = [[RestClient alloc] init];
    NSString *url = [NSString stringWithFormat: @"https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=%@", SecureStorage.getAPIKey];
    WebRequest *request = [[WebRequest alloc] initWithURL: url
                                              httpMethod: GET
                                              requestBody: nil];
    [_restClient send:request onCompletion:^(WebResponse *response) {
            
        XCTAssertTrue(response.isSuccess);
        XCTAssertNotNil(response.json);
        NSLog(@"%@", response.json);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testOverviewAPI_ShouldReturnJSON failed");
        }
    }];
}

@end
