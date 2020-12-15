//
//  BookList.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#ifndef BookList_h
#define BookList_h

@interface BookList : NSObject

@property (nonatomic, strong) NSDate *publishedDate;
@property (nonatomic, strong) NSArray *books;

-(instancetype)initWithDictionary:(NSDictionary *)json;

@end

#endif /* BookList_h */
