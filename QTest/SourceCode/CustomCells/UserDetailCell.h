//
//  UserDetailCell.h
//  QTest
//
//  Created by Malik Wahaj Ahmed on 13/02/2017.
//  Copyright © 2017 Malik Wahaj Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *postBodyTextView;

@end
