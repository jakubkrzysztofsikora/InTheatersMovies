//
//  RottMasterViewController.h
//  RottenTom
//
//  Created by Jakub SIkora on 7/31/13.
//  Copyright (c) 2013 Jakub Sikora. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

#import <Foundation/Foundation.h>

@interface RottMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;
@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
