//
//  RottMasterViewController.m
//  RottenTom
//
//  Created by Jakub SIkora on 7/31/13.
//  Copyright (c) 2013 Jakub Sikora. All rights reserved.
//

#import "RottMasterViewController.h"

#import "RottDetailViewController.h"

#import "JSONKit.h"

@interface RottMasterViewController ()
{
NSMutableArray *totalStrings;
NSMutableArray *totalContent;
NSMutableArray *totalThumbs;
NSMutableArray *totalDates;
NSMutableArray *totalRatings;
NSMutableArray *totalAuthors;
NSMutableArray *totalReviews;
NSMutableArray *totalScore;
NSMutableArray *tablesReviews;
NSMutableArray *totalTablesReviews;
NSMutableArray *totalIDs;
NSData *imageData;
}
@end

@implementation RottMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    
    self.activityInd.center = CGPointMake(160, 240);
    [self.activityInd setNeedsDisplay];
    [self.tView setNeedsDisplay];
    [self.tView reloadData];
    
    totalStrings = [[NSMutableArray alloc]init];
    totalContent = [[NSMutableArray alloc]init];
    totalThumbs = [[NSMutableArray alloc]init];
    totalDates = [[NSMutableArray alloc]init];
    totalRatings = [[NSMutableArray alloc]init];
    totalAuthors = [[NSMutableArray alloc]initWithCapacity:20];
    totalReviews = [[NSMutableArray alloc]initWithCapacity:20];
    totalScore = [[NSMutableArray alloc]initWithCapacity:20];
    tablesReviews = [[NSMutableArray alloc]init];
    totalTablesReviews = [[NSMutableArray alloc]init];
    totalIDs = [[NSMutableArray alloc]initWithCapacity:20];
    
    
    NSString* theURL = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=%s&page_limit=%d&country=%s","e5g3czgjryzgdbb4qcnf9m2m", 20, "pl" ];
    
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    NSURL*URL = [NSURL URLWithString:theURL];
    [request setURL:URL];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:URL];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *err)
     {
        if (err)
        {
        [totalStrings addObject:@"Error"];
        }
        else
        {
        JSONDecoder* decoder = [[JSONDecoder alloc] init];
        NSDictionary *resultsDictionary = [decoder objectWithData:data];
        NSArray *tempData = [resultsDictionary objectForKey:@"movies"];
        NSDictionary *tempDataThumb;
        NSDictionary *tempDataRate;
        NSDictionary *tempDataDate;
            
        //NSLog(@"Title: %@",[[tempData objectAtIndex:0] objectForKey:@"title"]);
        [totalStrings removeAllObjects];
        [totalContent removeAllObjects];
        [totalThumbs removeAllObjects];
        [totalRatings removeAllObjects];
        [totalDates removeAllObjects];
            
            for (NSInteger c = 0; c < 20; c++) {
                [totalAuthors addObject:[NSNull null]];
                [totalReviews addObject:[NSNull null]];
                [totalScore addObject:[NSNull null]];
                [totalIDs addObject:[NSNull null]];
            }
            
        [tablesReviews removeAllObjects];
        [totalTablesReviews removeAllObjects];
        __block NSString *temp = nil;
        //__block NSString *tempID = nil;
            
            for (NSInteger i = 0;i < 20;i++)
            {
                [NSThread sleepForTimeInterval:0.5];
                tempDataThumb = [[tempData objectAtIndex:i] objectForKey:@"posters"];
                tempDataRate = [[tempData objectAtIndex:i] objectForKey:@"ratings"];
                tempDataDate = [[tempData objectAtIndex:i] objectForKey:@"release_dates"];
                [totalIDs insertObject:[[tempData objectAtIndex:i] objectForKey:@"id"] atIndex:i];//tempID = [[tempData objectAtIndex:i] objectForKey:@"id"];
                [totalStrings addObject:[[tempData objectAtIndex:i] objectForKey:@"title"]];
                [totalContent addObject:[[tempData objectAtIndex:i] objectForKey:@"synopsis"]];
                imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[tempDataThumb objectForKey:@"profile"]]];
                [totalThumbs addObject:imageData];
                [totalDates addObject:[tempDataDate objectForKey:@"theater"]];
                [totalRatings addObject:[tempDataRate objectForKey:@"critics_rating"]];
                
                //reviews
                
            NSString* theURL2 = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies/%@/reviews.json?apikey=%s&review_type=%s&page_limit=%d",[totalIDs objectAtIndex:i],"e5g3czgjryzgdbb4qcnf9m2m","all", 5 ];
                
                NSMutableURLRequest* request2 = [[NSMutableURLRequest alloc] init];
                NSURL*URL2 = [NSURL URLWithString:theURL2];
                [request2 setURL:URL2];
                //[request2 setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
                [request2 setTimeoutInterval:60];

                NSURLRequest *urlRequest2 = [NSURLRequest requestWithURL:URL2];
                NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
                
                [NSURLConnection sendAsynchronousRequest:urlRequest2 queue:queue2 completionHandler:^(NSURLResponse *response2, NSData *data2, NSError *err2){
                    if (!err2) {
                        JSONDecoder* decoder2 = [[JSONDecoder alloc] init];
                        NSDictionary *resultsDictionary2 = [decoder2 objectWithData:data2];
                        NSLog(@"%@",resultsDictionary2);
                        NSMutableArray *tableAuthors = [[NSMutableArray alloc]initWithCapacity:5];
                        NSMutableArray *tableReviews = [[NSMutableArray alloc]initWithCapacity:5];
                        NSMutableArray *tableScores = [[NSMutableArray alloc]initWithCapacity:5];
                        NSArray *tempData2 = [resultsDictionary2 objectForKey:@"reviews"];
                       // NSLog(@"Reviews: %@",tempData2);
                        NSLog(@"%ld - Processing object %@ ...",(long)i,[totalIDs objectAtIndex:i]);
                        if (tempData2 != nil) {
                        for (NSInteger j=0;j<5;j++)
                        {
                            [tableAuthors addObject:[[tempData2 objectAtIndex:j] objectForKey:@"critic"]];
                            [tableReviews addObject:[[tempData2 objectAtIndex:j] objectForKey:@"quote"]];
                            temp = [[tempData2 objectAtIndex:j] objectForKey:@"original_score"];
                            if (temp != nil)
                            {
                                [tableScores addObject:temp];
                            }
                            else
                            {
                                [tableScores addObject:@"None"];
                            }
                        }
                        if (tableAuthors) [totalAuthors insertObject:tableAuthors atIndex:i];
                            else NSLog(@"Connection error - Authors - at object %@",[totalIDs objectAtIndex:i]);
                        if (tableReviews) [totalReviews insertObject:tableReviews atIndex:i];
                            else NSLog(@"Connection error - Reviews - at object %@",[totalIDs objectAtIndex:i]);
                            if (tableScores) [totalScore insertObject:tableScores atIndex:i];
                            else NSLog(@"Connection error - Scores - at object %@",[totalIDs objectAtIndex:i]);
                        }
                        else
                        {
                            /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Connection Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];*/
                            NSLog(@"Connection error at object %@",[totalIDs objectAtIndex:i]);
                            //NSLog(totalAuthors.description);
                        }
                    }
                    else{
                        NSLog(@"API connection problem.");
                    }
                }];
            }
        [self.activityInd removeFromSuperview];
        [self reload];
        }
         
     }]; 
    /*
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    if (err)
    {
        [totalStrings addObject:@"Error"];
    }
    else
    {
        JSONDecoder* decoder = [[JSONDecoder alloc] init];
        NSDictionary *resultsDictionary = [decoder objectWithData:data];
        NSArray *tempData = [resultsDictionary objectForKey:@"movies"];
        
        NSLog(@"Title: %@",[[tempData objectAtIndex:0] objectForKey:@"title"]);
        [totalStrings addObject:[[tempData objectAtIndex:0] objectForKey:@"title"]];
    }
     */
}

-(void)reload {
    [self.myTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [totalStrings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }

        UILabel *title = (UILabel *)[cell viewWithTag:100];
        title.text = [totalStrings objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        RottDetailViewController *controller = (RottDetailViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        controller.detailCont = [totalContent objectAtIndex:indexPath.row];
        controller.detailDate = [totalDates objectAtIndex:indexPath.row];
        controller.detailName = [totalStrings objectAtIndex:indexPath.row];
        controller.detailThumb = [totalThumbs objectAtIndex:indexPath.row];
        controller.detailRate = [totalRatings objectAtIndex:indexPath.row];
        if ([totalAuthors objectAtIndex:indexPath.row]!= nil) controller.detailAuthors =[totalAuthors objectAtIndex:indexPath.row];
        if ([totalReviews objectAtIndex:indexPath.row] != nil) controller.detailReviews=[totalReviews objectAtIndex:indexPath.row];
        if ([totalScore objectAtIndex:indexPath.row ]!= nil) controller.detailScores =[totalScore objectAtIndex:indexPath.row];
    }
}


/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
