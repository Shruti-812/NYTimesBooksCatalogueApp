//
//  BookCatalogueViewModel.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 15/12/20.
//

#import <Foundation/Foundation.h>
#import "BookCatalogueViewModel.h"
#import "BooksDataService.h"
#import "Book.h"

@implementation BookCatalogueViewModel

BooksDataService *_service;

- (instancetype)initWithService:(id<BooksDataServiceProtocol>)service
{
    self = [super init];
    if (self)
    {
        _service = service;
    }
    return self;
}

- (void)getBookList:(void (^)(BookList *))onComplete
{
    [_service getBestsellerBookList:^(BookList *books) {
        onComplete(books);
    }];
}

- (NSArray*)filterBooks:(NSArray *)bookList withSearchCriteria:(NSString *)criteria
{
    return [bookList filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        
        Book *book = (Book*)evaluatedObject;
        return [book.title hasPrefix:criteria];
    }]];
}

@end
