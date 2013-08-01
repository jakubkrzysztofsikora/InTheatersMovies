//
//  RottDetailViewController.h
//  RottenTom
//
//  Created by Jakub SIkora on 7/31/13.
//  Copyright (c) 2013 Jakub Sikora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RottDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) NSString *detailCont;
@property (strong, nonatomic) NSString *detailName;
@property (strong, nonatomic) NSData *detailThumb;
@property (strong, nonatomic) NSString *detailRate;
@property (strong, nonatomic) NSString *detailDate;
@property (strong, nonatomic) NSMutableArray *detailAuthors;
@property (strong, nonatomic) NSMutableArray *detailReviews;
@property (strong, nonatomic) NSMutableArray *detailScores;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;


@property (weak, nonatomic) IBOutlet UILabel *scoreField;
@property (weak, nonatomic) IBOutlet UILabel *reviewField;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property (weak, nonatomic) IBOutlet UIButton *firstAuthor;

@property (weak, nonatomic) IBOutlet UIButton *secondAuthor;
@property (weak, nonatomic) IBOutlet UIButton *thirdAuthor;
@property (weak, nonatomic) IBOutlet UIButton *fourthAuthor;
@property (weak, nonatomic) IBOutlet UIButton *fifthAuthor;
@property (weak, nonatomic) IBOutlet UILabel *firstAuthorL;
@property (weak, nonatomic) IBOutlet UILabel *secondAuthorL;
@property (weak, nonatomic) IBOutlet UILabel *thirdAuthorL;
@property (weak, nonatomic) IBOutlet UILabel *fourthAuthorL;
@property (weak, nonatomic) IBOutlet UILabel *fifthAuthorL;
@property (weak, nonatomic) IBOutlet UILabel *writtenBy;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
