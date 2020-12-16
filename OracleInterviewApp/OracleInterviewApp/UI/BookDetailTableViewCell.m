//
//  BookDetailTableViewCell.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 16/12/20.
//

#import <Foundation/Foundation.h>
#import "BookDetailTableViewCell.h"
#import "Book.h"

@implementation BookDetailTableViewCell

- (void)updateCellWithData:(Book *)bookData
{
    [self.author setText:bookData.author];
    [self.title setText:bookData.title];
    [self.publisher setText:bookData.publisher];
    [self.bookDescription setText:bookData.bookDescription];
    [self.contributor setText:bookData.contributor];
}

@end
