//
//  Cell.h
//  BoxOfficeApp
//
//  Created by Dinesh Joshi on 1/7/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *moviePosterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSummaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;



@end
