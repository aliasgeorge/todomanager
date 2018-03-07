//
//  MyUITableViewCell.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity+CoreDataClass.h"

@interface MyUITableViewCell : UITableViewCell
@property (strong,nonatomic) ToDoEntity * localToDoEntity;
-(void)setInternalFields:(ToDoEntity*)incomingToDoEntity;
@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoStatusLabel;
@end
