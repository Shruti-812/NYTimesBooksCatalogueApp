//
//  BooksDataServiceUnitTests.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 15/12/20.
//

#import <XCTest/XCTest.h>
#import "BooksDataService.h"
#import "MockRestClient.h"

@interface BooksDataServiceUnitTests : XCTestCase

@property (nonatomic) BooksDataService *service;

@end

@implementation BooksDataServiceUnitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

-(void)testInit_ShouldInitialiseWebService
{
    _service = [[BooksDataService alloc] init];
    XCTAssertNotNil(_service.webService);
}

-(void)testGetBestsellerBookList_Success
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    MockRestClient *mockWebService = [[MockRestClient alloc] init];
    WebResponse *response = [[WebResponse alloc] init];
    response.isSuccess = true;
    response.json = [[NSDictionary alloc] initWithObjectsAndKeys:[[NSDictionary alloc] initWithObjects:[NSArray arrayWithObject:@"2020-12-15"] forKeys:[NSArray arrayWithObject:@"published_date"]], @"results", nil];
    mockWebService.dummyResponse = response;
    _service.webService = mockWebService;
    
    [_service getBestsellerBookList:^(BookList *books) {
        XCTAssertNotNil(books.publishedDate);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testGetBestsellerBookList_Success failed");
        }
    }];
}

-(void)testGetBestsellerBookList_Failure
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    MockRestClient *mockWebService = [[MockRestClient alloc] init];
    WebResponse *response = [[WebResponse alloc] init];
    response.isSuccess = false;
    mockWebService.dummyResponse = response;
    _service.webService = mockWebService;
    
    [_service getBestsellerBookList:^(BookList *books) {
        XCTAssertNil(books);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testGetBestsellerBookList_Failure failed");
        }
    }];
}

-(void)testGetBestsellerBookListForDate_Success
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    MockRestClient *mockWebService = [[MockRestClient alloc] init];
    WebResponse *response = [[WebResponse alloc] init];
    response.isSuccess = true;
    response.json = [[NSDictionary alloc] initWithObjectsAndKeys:[[NSDictionary alloc] initWithObjects:[NSArray arrayWithObject:@"2020-12-15"] forKeys:[NSArray arrayWithObject:@"published_date"]], @"results", nil];
    mockWebService.dummyResponse = response;
    _service.webService = mockWebService;
    
    [_service getBestsellerBookListForDate:[NSDate date] completionHandler:^(BookList *books) {
        XCTAssertNotNil(books.publishedDate);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testGetBestsellerBookListForDate_Success failed");
        }
    }];
}

-(void)testGetBestsellerBookListForDate_Failure
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    MockRestClient *mockWebService = [[MockRestClient alloc] init];
    WebResponse *response = [[WebResponse alloc] init];
    response.isSuccess = false;
    mockWebService.dummyResponse = response;
    _service.webService = mockWebService;
    
    [_service getBestsellerBookListForDate:[NSDate date] completionHandler:^(BookList *books) {
        XCTAssertNil(books.publishedDate);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testGetBestsellerBookListForDate_Failure failed");
        }
    }];
}

-(void)testGetBestsellerBookListForDate_InvalidDateInput_ShouldReturnNil
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    MockRestClient *mockWebService = [[MockRestClient alloc] init];
    WebResponse *response = [[WebResponse alloc] init];
    response.isSuccess = false;
    mockWebService.dummyResponse = response;
    _service.webService = mockWebService;
    
    [_service getBestsellerBookListForDate:nil completionHandler:^(BookList *books) {
        XCTAssertNil(books);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testGetBestsellerBookListForDate_InvalidDateInput_ShouldReturnNil failed");
        }
    }];
}

@end
