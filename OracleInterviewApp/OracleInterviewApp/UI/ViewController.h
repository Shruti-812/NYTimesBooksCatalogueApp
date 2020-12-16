//
//  ViewController.h
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

