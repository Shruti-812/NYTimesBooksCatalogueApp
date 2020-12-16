//
//  BookDetailTableViewCell.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 16/12/20.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#ifndef BookDetailTableViewCell_h
#define BookDetailTableViewCell_h

@interface BookDetailTableViewCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *author;
@property (nonatomic, retain) IBOutlet UILabel *bookDescription;
@property (nonatomic, retain) IBOutlet UILabel *publisher;
@property (nonatomic, retain) IBOutlet UILabel *contributor;

-(void)updateCellWithData:(Book *)bookData;

@end

#endif /* BookDetailTableViewCell_h */
