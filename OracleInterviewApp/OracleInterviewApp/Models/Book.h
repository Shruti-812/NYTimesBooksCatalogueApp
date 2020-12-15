//
//  Book.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 14/12/20.
//

#ifndef Book_h
#define Book_h

@interface Book: NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *contributor;
@property (nonatomic, strong) NSString *bookDescription;

-(instancetype)initWithDictionary: (NSDictionary*)dictionary;

@end
#endif /* Book_h */
