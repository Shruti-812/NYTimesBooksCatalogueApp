//
//  BookList.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <Foundation/Foundation.h>
#import "BookList.h"
#import "Book.h"

@implementation BookList

-(instancetype)initWithDictionary:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _publishedDate = [json valueForKey: @"published_date"];
        NSMutableArray *draftBooks = [[NSMutableArray alloc] init];
        NSArray *dataList = json[@"lists"];
        for (NSDictionary *item in dataList)
        {
            NSArray *bookList = item[@"books"];
            for (NSDictionary *bookDict in bookList)
            {
                Book *book = [[Book alloc] initWithDictionary: bookDict];
                [draftBooks addObject: book];
            }
        }
        _books = draftBooks;
    }
    return self;
}

@end
