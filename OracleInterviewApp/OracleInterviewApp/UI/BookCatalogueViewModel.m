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

- (void)getBookListFor:(NSDate *)date
       completeHandler:(void (^)(BookList *))onComplete
{
    if (date == nil)
    {
        return onComplete(nil);
    }
    
    [_service getBestsellerBookListForDate:date
                            completionHandler:^(BookList *books) {
        onComplete(books);
    }];
}

- (NSArray*)filterBooks:(NSArray *)bookList withSearchCriteria:(NSString *)criteria
{
    if (criteria == nil)
    {
        return bookList;
    }
    
    return [bookList filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        
        Book *book = (Book*)evaluatedObject;        
        return [book.title hasPrefix:criteria];
    }]];
}

@end
