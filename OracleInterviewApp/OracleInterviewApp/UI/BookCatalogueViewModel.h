//
//  BookCatalogueViewModel.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 15/12/20.
//

#import "BookList.h"
#import "BooksDataService.h"
#ifndef BookCatalogueViewModel_h
#define BookCatalogueViewModel_h

@interface BookCatalogueViewModel: NSObject

-(void)getBookListFor:(NSDate*)date completeHandler:(void (^)(BookList *))onComplete;
-(instancetype)initWithService:(id<BooksDataServiceProtocol>)service;
-(NSArray *)filterBooks:(NSArray *)bookList withSearchCriteria: (NSString *)criteria;

@end

#endif /* BookCatalogueViewModel_h */
