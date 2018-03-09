//
//  MyUIViewController.m
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property(strong,nonatomic)NSArray *statusArray;

@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)ToDoEntity *localToDoEntity;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIPickerView *statusField;

@property (weak, nonatomic) IBOutlet UIDatePicker *startDateField;
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;

@property (weak, nonatomic) IBOutlet UILabel *priorityField;

@property (nonatomic,assign) BOOL wasDeleted;

@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.statusArray = [NSArray arrayWithObjects: @"Complete", @"Gave up", @"Not Started", @"In Progress", nil];
    self.statusField.dataSource=self;
    self.statusField.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.statusArray.count;
}



// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.statusArray[row];
}
-(void)saveMyToDoEntity{
    NSError *err;
    BOOL saveSuccess=[self.managedObjectContext save:&err];
    if(!saveSuccess){
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey:err}];
    }
}


-(void)receiveMOC:(NSManagedObjectContext *)incomingMOC{
    self.managedObjectContext=incomingMOC;
}
-(void)receiveToDoEntity:(ToDoEntity *)incomingToDoEntity{
    self.localToDoEntity=incomingToDoEntity;
}
-(void) viewWillAppear:(BOOL)animated{
    
    self.wasDeleted=NO;
    self.titleField.text=self.localToDoEntity.toDoTitle;
    NSInteger row = [self.statusArray indexOfObject:self.localToDoEntity.toDoStatus];
    if(NSNotFound != row) {
        [self.statusField selectRow:row inComponent:0 animated:NO];
    }
    
    //[self pickerView:self.statusField didSelectRow:4 inComponent:0];
    if(self.localToDoEntity.toDoPriority!=0){
        self.priorityField.text=[NSString stringWithFormat:@"%i", self.localToDoEntity.toDoPriority];
    }else{
        self.priorityField.text=@"1";
    }
    
    NSDate *startDate=self.localToDoEntity.toDoStartDate;
    if(startDate!=nil){
        [self.startDateField setDate:startDate];
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    if(self.wasDeleted==NO){
        NSInteger row;
        row = [self.statusField selectedRowInComponent:0];
        self.localToDoEntity.toDoTitle=self.titleField.text;
        self.localToDoEntity.toDoStatus=[self.statusArray objectAtIndex:row];
        
        NSDate *date=[self.startDateField date];
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
     //   NSString *startDate=[formatter dateFromString:date];
        self.localToDoEntity.toDoStartDate=date;
        self.localToDoEntity.toDoPriority=[self.priorityField.text intValue];
        [self saveMyToDoEntity];
    }
}
- (IBAction)titleFieldEdited:(id)sender {
    self.localToDoEntity.toDoTitle=self.titleField.text;
    [self saveMyToDoEntity];
}

- (IBAction)trashTapped:(id)sender {
    self.wasDeleted =YES;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveMyToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)priorityStepperClicked:(id)sender {
    NSString *priority=[NSString stringWithFormat:@"%i",(int)self.priorityStepper.value];
    self.priorityField.text=priority;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
