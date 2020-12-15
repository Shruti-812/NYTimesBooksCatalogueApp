//
//  BooksDataServiceIntegrationTests.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <XCTest/XCTest.h>
#import "BooksDataService.h"

@interface BooksDataServiceIntegrationTests : XCTestCase

@property (nonatomic) BooksDataService *service;

@end

@implementation BooksDataServiceIntegrationTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

-(void) testGetBestsellerBookList_ShouldParseJsonToModel
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    
    _service = [[BooksDataService alloc] init];
    [_service getBestsellerBookList:^(BookList *bookList) {
        XCTAssertNotNil(bookList.publishedDate);
        XCTAssertNotNil(bookList.books);
        NSLog(@"%@", bookList);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testSendRequest_ShouldReturnJSON failed");
        }
    }];
}

-(void) testGetBestsellerBookListForDate_ShouldParseJsonToModel
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Response received"];
    _service = [[BooksDataService alloc] init];
    [_service getBestsellerBookListForDate: [NSDate date] completionHandler:^(BookList *bookList) {
        XCTAssertNotNil(bookList.publishedDate);
        XCTAssertNotNil(bookList.books);
        NSLog(@"%@", bookList);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30
                                 handler:^(NSError *error) {
        if (error != nil)
        {
            XCTFail("testSendRequest_ShouldReturnJSON failed");
        }
    }];
}

@end
