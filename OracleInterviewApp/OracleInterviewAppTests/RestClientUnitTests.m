//
//  RestClientUnitTests.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <XCTest/XCTest.h>
#import "RestClient.h"
#import "MockURLSession.h"
#import "MockURLSessionDataTask.h"
#import "Book.h"
#import "Constants.h"

@interface RestClientUnitTests : XCTestCase

@property (nonatomic) RestClient *restClient;

@end

@implementation RestClientUnitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

-(WebRequest *)getMockWebRequest
{
    WebRequest *request = [[WebRequest alloc] initWithURL: @"https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=apiKey"
                                              httpMethod: GET
                                              requestBody: nil];
    return request;
}

-(void) testInit_ShouldInitialiseSession
{
    _restClient = [[RestClient alloc] init];
    XCTAssertNotNil(_restClient);
    XCTAssertNotNil(_restClient.urlSession);
}

-(void) testSendRequest_BadJSON
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    _restClient = [[RestClient alloc] init];
    MockURLSession *session = [[MockURLSession alloc] init];
    NSDictionary *dummyDict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObject:@"dummy"] forKeys:[NSArray arrayWithObject:@"dummy"]];
    session.data = [NSKeyedArchiver archivedDataWithRootObject:dummyDict requiringSecureCoding:false error:nil];
    session.response = [[NSHTTPURLResponse alloc] initWithURL:[[NSURL alloc] initWithString:@"https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=%@"] statusCode:200 HTTPVersion:nil headerFields:@{}];
    _restClient.urlSession = session;
    [_restClient send: [self getMockWebRequest] onCompletion:^(WebResponse *response) {
        XCTAssertNil(response.json);
        XCTAssertNotNil(response.apiError);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testSendRequest_BadJSON succeeded");
        }
    }];
}

-(void) testSendRequest_ShouldReturnStackError
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    _restClient = [[RestClient alloc] init];
    MockURLSession *session = [[MockURLSession alloc] init];
    session.error = [NSError errorWithDomain:kAppErrorDomain code:-101 userInfo:nil];
    session.response = [[NSHTTPURLResponse alloc] initWithURL:[[NSURL alloc] initWithString:@""] statusCode:401 HTTPVersion:nil headerFields:@{}];
    _restClient.urlSession = session;
    [_restClient send: [self getMockWebRequest] onCompletion:^(WebResponse *response) {
        XCTAssertNil(response.json);
        XCTAssertNotNil(response.apiError);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testSendRequest_ShouldReturnStackError succeeded");
        }
    }];
}

@end
