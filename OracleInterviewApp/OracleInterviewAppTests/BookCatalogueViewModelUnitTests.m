//
//  BookCatalogueViewModelUnitTests.m
//  OracleInterviewAppTests
//
//  Created by Shruti Mishra on 17/12/20.
//

#import <XCTest/XCTest.h>
#import "MockBookDataService.h"
#import "BookCatalogueViewModel.h"
#import "Book.h"

@interface BookCatalogueViewModelUnitTests : XCTestCase

@property (nonatomic) BookCatalogueViewModel *viewModel;

@end

@implementation BookCatalogueViewModelUnitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

-(void)testInitWithService
{
    MockBookDataService *service = [[MockBookDataService alloc] init];
    
    _viewModel = [[BookCatalogueViewModel alloc] initWithService: service];
    XCTAssertNotNil(_viewModel);
}

-(void)testGetBookListForDate_InvalidDate_ShouldReturnNilData
{
    MockBookDataService *service = [[MockBookDataService alloc] init];
    
    _viewModel = [[BookCatalogueViewModel alloc] initWithService: service];
    
    [_viewModel getBookListFor: nil
               completeHandler:^(BookList *books) {
        XCTAssertNil(books);
    }];
}

-(void)testGetBookListForDate_ValidDate_ShouldReturnNonNilData
{
    MockBookDataService *service = [[MockBookDataService alloc] init];
    service.booksData = [[BookList alloc] init];
    service.booksData.publishedDate = [NSDate date];
    NSMutableArray *books = [[NSMutableArray alloc] init];
    Book *book = [[Book alloc] init];
    book.author = @"JK Rowling";
    book.title = @"Harry potter";
    [books addObject:book];
    service.booksData.books = books;
    
    _viewModel = [[BookCatalogueViewModel alloc] initWithService: service];
    
    
    [_viewModel getBookListFor:[NSDate date] completeHandler:^(BookList *books) {
        XCTAssertNotNil(books);
    }];
}

-(void)testFilterBooksWithSearchCritieria_InvalidSearchCriteria_ShouldReturnWholeList
{
    MockBookDataService *service = [[MockBookDataService alloc] init];
    _viewModel = [[BookCatalogueViewModel alloc] initWithService: service];
    
    NSMutableArray *books = [[NSMutableArray alloc] init];
    Book *book = [[Book alloc] init];
    book.author = @"JK Rowling";
    book.title = @"Harry potter";
    [books addObject:book];
    
    NSArray *filteredBooks = [_viewModel filterBooks:books withSearchCriteria:nil];
    XCTAssertNotNil(filteredBooks);
    XCTAssertEqual(filteredBooks.count, 1);
}

-(void)testFilterBooksWithSearchCritieria_ValidSearchCriteria_ShouldReturnFilteredList
{
    MockBookDataService *service = [[MockBookDataService alloc] init];
    _viewModel = [[BookCatalogueViewModel alloc] initWithService: service];
    
    NSMutableArray *books = [[NSMutableArray alloc] init];
    Book *book = [[Book alloc] init];
    book.author = @"JK Rowling";
    book.title = @"Harry potter";
    [books addObject:book];
    
    NSArray *filteredBooks = [_viewModel filterBooks:books withSearchCriteria:@"H"];
    XCTAssertNotNil(filteredBooks);
    XCTAssertEqual(filteredBooks.count, 1);
}

@end
