//
//  MovieListViewController.m
//  BoxOfficeApp
//
//  Created by Dinesh Joshi on 1/7/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import "MovieListViewController.h"
#import "Cell.h"
#import "MovieModel.h"

@interface MovieListViewController ()
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) NSMutableArray *movieModels;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            self.movies = [object valueForKeyPath:@"movies"];
            
            // iterate over movies and create movie model objects
            self.movieModels = [[NSMutableArray alloc] init];
            for (NSUInteger i=0; i < [self.movies count]; i++) {
                [self.movieModels addObject:[[MovieModel alloc] initWithDictionary:[self.movies objectAtIndex:i]]];
            }

            [self.tableView reloadData];
            NSLog(@"%@", object);
        }];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Cell *movieCell = (Cell *)cell;
    
    MovieModel *movie = [self.movieModels objectAtIndex:indexPath.row];
    
    NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:movie.imgUrl]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    
    movieCell.movieTitleLabel.text = movie.title;
    movieCell.movieCastLabel.text = movie.cast;
    movieCell.movieSummaryLabel.text = movie.summary;
    movieCell.moviePosterImageView.image = image;
    
    // Configure the cell...
//    NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
//    cell.textLabel.text = [movie objectForKey:@"title"];
    return movieCell;
}
@end
