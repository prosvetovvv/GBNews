//
//  ViewController.m
//  GBNews
//
//  Created by Vitaly Prosvetov on 10.03.2021.
//

#import "ViewController.h"
#import "New.h"
#import "NewCell.h"

#define NewCellReuseIdentifier @"NewCellIdentifier"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *news;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = @"Russian news";
    
    [self setupActivityIndicator];
    [self setupTableView];
    
    [[APIService sharedInstance] loadNews:^(NSArray * _Nonnull news) {
        self.news = news;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.activityIndicator stopAnimating];
        });
    }];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[NewCell class] forCellReuseIdentifier:NewCellReuseIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

-(void) setupActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicator.frame = CGRectMake(0.0, 0.0, 50.0, 50.0);
    self.activityIndicator.color = [UIColor redColor];
    self.activityIndicator.center = CGPointMake(self.view.center.x, self.view.center.y);
    self.activityIndicator.hidesWhenStopped = YES;
    [self.activityIndicator startAnimating];
    
    [self.view addSubview:self.activityIndicator];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewCellReuseIdentifier forIndexPath:indexPath];
    [cell setWith:[self.news objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
