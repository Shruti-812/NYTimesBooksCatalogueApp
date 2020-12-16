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

-(void)getBookList:(void (^)(BookList *))onComplete;
-(instancetype)initWithService:(id<BooksDataServiceProtocol>)service;

@end

#endif /* BookCatalogueViewModel_h */
