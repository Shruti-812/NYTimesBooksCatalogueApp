//
//  ViewController.m
//  OracleInterviewApp
//
//  Created by Shruti Mishra on 07/12/20.
//

#import "ViewController.h"
#import "BookCatalogueViewModel.h"
#import "BookList.h"
#import "BookDetailTableViewCell.h"
#import "Book.h"
#import "BooksDataService.h"

@interface ViewController ()

@property (nonatomic, strong) BookCatalogueViewModel *viewModel;

@end

@implementation ViewController

BookList *data;
NSArray *booksArray;
NSString* const kCellID = @"bookDetailCellId";
UIDatePicker *datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureUI];
    self.viewModel = [[BookCatalogueViewModel alloc] initWithService: [[BooksDataService alloc] init]];
    [self.activityIndicator startAnimating];
    [self.viewModel getBookList:^(BookList *booksData) {
        data = booksData;
        booksArray = booksData.books;
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.activityIndicator stopAnimating];
            [self.tableView reloadData];
        });
    }];
}

-(void)configureUI
{
    UIButton *rightButton = [UIButton buttonWithType: UIButtonTypeInfoLight];
    [rightButton addTarget: self
                    action: @selector(addDatePicker)
          forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView: rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

-(void)addDatePicker
{
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker setPreferredDatePickerStyle:UIDatePickerStyleWheels];
    [datePicker setDate:[NSDate date]];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (booksArray != nil)
    {
        return booksArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    if (cell != nil)
    {
        Book *book = [booksArray objectAtIndex: indexPath.row];
        [cell updateCellWithData:book];
        return cell;
    }
    else
    {
        return [[UITableViewCell alloc] init];
    }
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText
{
    if (searchText.length > 0)
    {
        booksArray = [self.viewModel filterBooks: booksArray
                              withSearchCriteria:searchText];
    }
    else
    {
        booksArray = data.books;
    }
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    booksArray = data.books;
    [self.tableView reloadData];
}

@end
