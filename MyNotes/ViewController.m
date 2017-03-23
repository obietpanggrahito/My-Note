//
//  ViewController.m
//  MyNotes
//
//  Created by Obiet Panggrahito on 22/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
#import "contentViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *notes;
@property (weak, nonatomic) IBOutlet UITableView *noteTableView;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *edit;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNote;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.noteTableView.dataSource = self;
    self.noteTableView.delegate = self;
    
    self.notes = [[NSMutableArray alloc] init];
    
    [self generateNotes];
    
}

- (void) generateNotes {
    
    //first method
    Note *note1 = [[Note alloc] init];
    note1.title = @"Worst day";
    note1.desc = @"Today I tripped once.";
    note1.image = [UIImage imageNamed:@""];
    [self.notes addObject: note1];
    
    //second method
    Note *note2 = [[Note alloc] initWithTitle:@"Worse than worst day" withDesc:@"Today I tripped twice." withImage:[UIImage imageNamed:@""]];
    [self.notes addObject: note2];
    
    Note *note3 = [[Note alloc] initWithTitle:@"Slightly better than worst day" withDesc:@"Today I almost tripped." withImage:[UIImage imageNamed:@""]];
    [self.notes addObject: note3];
    
}

// how many queue
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.notes.count;
    
}

//what's in cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell"];
    
    Note *currentNote = [self.notes objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:currentNote.title];
    [cell.detailTextLabel setText:currentNote.desc];

    return cell;
    
}

//select cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"tapCellIdentifier" sender:self];
    
}

//segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"tapCellIdentifier"]) {
        
        contentViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.selectedNote = [self.notes objectAtIndex:self.selectedIndex];
        
        //sound
        AudioServicesPlaySystemSound(0x450);
    }
    
    else if ([segue.identifier isEqualToString:@"AddNewNote"]) {
        
        AudioServicesPlaySystemSound(0x450);
            
        }
}



//declare for delete and re-ordering
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}

//delete
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        AudioServicesPlaySystemSound(0x450);
        // remove data from the array
        [self.notes removeObjectAtIndex:indexPath.row];
        
        //remove row from the tableview
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

//re-order
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    return;
}


//for edit
- (IBAction)editButton:(id)sender {
    
    [self.noteTableView setEditing:!self.noteTableView.editing];
    if (self.noteTableView.editing) {
        [self.edit setTitle:@"Done"];
        [self.edit setTintColor:[UIColor redColor]];
    } else {
        [self.edit setTitle:@"Edit"];
        [self.edit setTintColor:[UIColor blueColor]];
    }
}

//for saving the editable notes
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    [self.noteTableView reloadData];
    
//    if (self.titleLabel = @"") {
//        
//        [super viewWillAppear:NO];
//        
//    }
}

@end




















