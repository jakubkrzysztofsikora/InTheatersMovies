//
//  RottDetailViewController.m
//  RottenTom
//
//  Created by Jakub SIkora on 7/31/13.
//  Copyright (c) 2013 Jakub Sikora. All rights reserved.
//

#import "RottDetailViewController.h"

@interface RottDetailViewController ()
- (void)configureView;
@end

@implementation RottDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailCont) {
        self.detailDescriptionLabel.text = self.detailCont;
        self.detailDescriptionLabel.numberOfLines = 0;
        [self.detailDescriptionLabel sizeToFit];
    }
    if (self.detailThumb) {
        self.thumbnail.image = [UIImage imageWithData:self.detailThumb];
        
    }
    if (self.detailName) {
        self.navTitle.title = self.detailName;
    }
    if (self.detailRate) {
        self.rateLabel.text = self.detailRate;
    }
    if (self.detailDate) {
        self.releaseLabel.text = self.detailDate;
    }
    if (self.detailAuthors) {
        /*[self.firstAuthor setTitle:[self.detailAuthors objectAtIndex:0] forState:UIControlStateNormal];
        [self.firstAuthor sizeToFit];
        
        [self.secondAuthor setTitle:[self.detailAuthors objectAtIndex:1] forState:UIControlStateNormal];
        [self.secondAuthor sizeToFit];
        
        [self.thirdAuthor setTitle:[self.detailAuthors objectAtIndex:2] forState:UIControlStateNormal];
        [self.thirdAuthor sizeToFit];
        
        [self.fourthAuthor setTitle:[self.detailAuthors objectAtIndex:3] forState:UIControlStateNormal];
        [self.fourthAuthor sizeToFit];
        
        [self.fifthAuthor setTitle:[self.detailAuthors objectAtIndex:4] forState:UIControlStateNormal];
        [self.fifthAuthor sizeToFit]; */
        self.firstAuthorL.text = [self.detailAuthors objectAtIndex:0];
        //self.firstAuthorL.numberOfLines = 0;
        //[self.firstAuthorL sizeToFit];
        
        self.secondAuthorL.text = [self.detailAuthors objectAtIndex:1];
        //self.secondAuthorL.numberOfLines = 0;
        //[self.firstAuthorL sizeToFit];
        
        self.thirdAuthorL.text = [self.detailAuthors objectAtIndex:2];
        //self.thirdAuthorL.numberOfLines = 0;
        //[self.thirdAuthorL sizeToFit];
        
        self.fourthAuthorL.text = [self.detailAuthors objectAtIndex:3];
        //self.fourthAuthorL.numberOfLines = 0;
        //[self.fourthAuthorL sizeToFit];
        
        self.fifthAuthorL.text = [self.detailAuthors objectAtIndex:4];
        //self.fifthAuthorL.numberOfLines = 0;
        //[self.fifthAuthorL sizeToFit];
    }
    
}

-(void)firstButtonAction
{
    if (self.detailReviews) {
        self.reviewField.text = [self.detailReviews objectAtIndex:0];
        self.reviewField.numberOfLines = 0;
        [self.reviewField sizeToFit];
    }
    if (self.detailScores) {
        self.scoreField.text = [self.detailScores objectAtIndex:0];
    }
    if (self.detailAuthors) self.writtenBy.text = [self.detailAuthors objectAtIndex:0];
    [self.writtenBy setHidden:NO];
    [self.reviewField setHidden:NO];
    [self.scoreField setHidden:NO];
    [self.scoreLabel setHidden:NO];
    [self.view setNeedsDisplay];
}

-(void)secondButtonAction
{
    if (self.detailReviews) {
        self.reviewField.text = [self.detailReviews objectAtIndex:1];
        //self.reviewField.numberOfLines = 0;
        //[self.reviewField sizeToFit];
    }
    if (self.detailScores) {
        self.scoreField.text = [self.detailScores objectAtIndex:1];
    }
    if (self.detailAuthors) self.writtenBy.text = [self.detailAuthors objectAtIndex:1];
    [self.writtenBy setHidden:NO];
    [self.reviewField setHidden:NO];
    [self.scoreField setHidden:NO];
    [self.scoreLabel setHidden:NO];
    [self.view setNeedsDisplay];
}

-(void)thirdButtonAction
{
    if (self.detailReviews) {
        self.reviewField.text = [self.detailReviews objectAtIndex:2];
        //self.reviewField.numberOfLines = 0;
        //[self.reviewField sizeToFit];
    }
    if (self.detailScores) {
        self.scoreField.text = [self.detailScores objectAtIndex:2];
    }
    if (self.detailAuthors) self.writtenBy.text = [self.detailAuthors objectAtIndex:2];
    [self.writtenBy setHidden:NO];
    [self.reviewField setHidden:NO];
    [self.scoreField setHidden:NO];
    [self.scoreLabel setHidden:NO];
    [self.view setNeedsDisplay];
}

-(void)fourthButtonAction
{
    if (self.detailReviews) {
        self.reviewField.text = [self.detailReviews objectAtIndex:3];
        //self.reviewField.numberOfLines = 0;
        //[self.reviewField sizeToFit];
    }
    if (self.detailScores) {
        self.scoreField.text = [self.detailScores objectAtIndex:3];
    }
    if (self.detailAuthors) self.writtenBy.text = [self.detailAuthors objectAtIndex:3];
    [self.writtenBy setHidden:NO];
    [self.reviewField setHidden:NO];
    [self.scoreField setHidden:NO];
    [self.scoreLabel setHidden:NO];
    [self.view setNeedsDisplay];
}

-(void)fifthButtonAction
{
    if (self.detailReviews) {
        self.reviewField.text = [self.detailReviews objectAtIndex:4];
        //self.reviewField.numberOfLines = 0;
        //[self.reviewField sizeToFit];
    }
    if (self.detailScores) {
        self.scoreField.text = [self.detailScores objectAtIndex:4];
    }
    if (self.detailAuthors) self.writtenBy.text = [self.detailAuthors objectAtIndex:4];
    [self.writtenBy setHidden:NO];
    [self.reviewField setHidden:NO];
    [self.scoreField setHidden:NO];
    [self.scoreLabel setHidden:NO];
    [self.view setNeedsDisplay];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self.firstAuthor addTarget:self action:@selector(firstButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.secondAuthor addTarget:self action:@selector(secondButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdAuthor addTarget:self action:@selector(thirdButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.fourthAuthor addTarget:self action:@selector(fourthButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.fifthAuthor addTarget:self action:@selector(fifthButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
