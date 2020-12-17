//
//  BooksDataService.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#import <Foundation/Foundation.h>
#import "BooksDataService.h"
#import "RestClient.h"
#import "WebRequest.h"
#import "Constants.h"
#import "WebResponse.h"
#import "Book.h"
#import "SecureStorage.h"
#import "BookList.h"

@implementation BooksDataService

NSString *bookListAPIPath = @"svc/books/v3/lists/overview.json?api-key=%@";
NSString *datewiseBookListAPIPath = @"svc/books/v3/lists/overview.json?published_date=%@&api-key=%@";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _webService = [[RestClient alloc] init];
    }
    return self;
}

-(NSString *)getBookListAPIPath
{
    return [NSString stringWithFormat: bookListAPIPath, SecureStorage.getAPIKey];
}

-(NSString *)getDateWiseBookListAPIPathFor:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd"];
    NSString *stringDate = [formatter stringFromDate: date];
    return [NSString stringWithFormat: datewiseBookListAPIPath, stringDate, SecureStorage.getAPIKey];
}

- (void)getBestsellerBookList:(void (^)(BookList *))onComplete
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseURL, [self getBookListAPIPath]];
    [self getBookListFrom: url completionHandler:^(BookList *books) {
            onComplete(books);
    }];
}

-(void)getBestsellerBookListForDate:(NSDate *)date
                  completionHandler:(void (^)(BookList *))onComplete
{
    if (date == nil)
    {
        return onComplete(nil);
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseURL, [self getDateWiseBookListAPIPathFor: date]];
    [self getBookListFrom: url completionHandler:^(BookList *books) {
            onComplete(books);
    }];
}

-(void)getBookListFrom:(NSString *)url
                     completionHandler:(void (^)(BookList *))onComplete
{
    if (url == nil)
    {
        return onComplete(nil);
    }
    
    WebRequest *request = [[WebRequest alloc] initWithURL: url
                                               httpMethod: GET
                                              requestBody: nil];
    [_webService send: request
         onCompletion:^(WebResponse *response) {
        
        BookList *booklist;
        if (response.isSuccess)
        {
            NSDictionary *results = [response.json valueForKey: @"results"];
            if (results.count > 0)
            {
                booklist = [[BookList alloc] initWithDictionary: results];
            }
            NSLog(@"%@", booklist);
        }
        onComplete(booklist);
    }];
}

@end
