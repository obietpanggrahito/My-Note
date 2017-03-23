//
//  contentViewController.m
//  MyNotes
//
//  Created by Obiet Panggrahito on 22/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "contentViewController.h"

@interface contentViewController ()

@end

@implementation contentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.titleLabel setText:self.selectedNote.title];
    [self.content setText:self.selectedNote.desc];    
    
}

- (IBAction)saveButton:(id)sender {
    
    self.selectedNote.title = self.titleLabel.text;
    self.selectedNote.desc = self.content.text;
    
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
