//
//  BooksDataService.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#import "RestClient.h"
#import "BookList.h"
#ifndef BooksDataService_h
#define BooksDataService_h

@interface BooksDataService : NSObject

-(void)getBestsellerBookList:(void(^)(BookList*))onComplete;
-(void)getBestsellerBookListForDate:(NSDate *)date completionHandler: (void(^)(BookList *))onComplete;
@property (nonatomic, strong) id<RestClientProtocol> webService;

@end

#endif /* BooksDataService_h */
