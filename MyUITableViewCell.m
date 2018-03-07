//
//  MyUITableViewCell.m
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import "MyUITableViewCell.h"

@implementation MyUITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setInternalFields:(ToDoEntity*)incomingToDoEntity{
    self.toDoTitleLabel.text=incomingToDoEntity.toDoTitle;
    self.toDoStatusLabel.text=incomingToDoEntity.toDoStatus;
    self.localToDoEntity=incomingToDoEntity;
}
@end
