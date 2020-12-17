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
NSDate *selectedDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewModel = [[BookCatalogueViewModel alloc] initWithService: [[BooksDataService alloc] init]];
    selectedDate = [NSDate date];
    [self loadData];
}

-(void)loadData
{
    [self.activityIndicator startAnimating];
    [self.viewModel getBookListFor: selectedDate completeHandler:^(BookList *booksData) {
        data = booksData;
        booksArray = booksData.books;
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.activityIndicator stopAnimating];
            [self.tableView reloadData];
        });
    }];
}

-(IBAction)didTapChangeDateButton:(id)sender
{
    [self addDatePicker];
}

-(void)addDatePicker
{
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    datePicker.backgroundColor = [UIColor whiteColor];
    [datePicker setValue:[UIColor blackColor] forKey:@"textColor"];
    datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDate:selectedDate];
    
    [datePicker addTarget:self action:@selector(didChangeDateTo:) forControlEvents:UIControlEventValueChanged];
    datePicker.frame = CGRectMake(0.0, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width, 100);
    [self.view addSubview: datePicker];
}

-(void)didChangeDateTo:(UIDatePicker *)picker
{
    selectedDate = picker.date;
    [datePicker removeFromSuperview];
    [self loadData];
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
    searchBar.text = @"";
    booksArray = data.books;
    [self.tableView reloadData];
}

@end
