//
//  MockBookDataService.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 17/12/20.
//

#import "BooksDataService.h"
#import "BookList.h"
#ifndef MockBookDataService_h
#define MockBookDataService_h

@interface MockBookDataService : NSObject <BooksDataServiceProtocol>

@property (nonatomic, strong) BookList *booksData;

@end

#endif /* MockBookDataService_h */
