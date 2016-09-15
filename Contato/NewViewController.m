//
//  NewViewController.m
//  Contato
//
//  Created by Helton Shinhei Uema on 08/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "NewViewController.h"
#import "Contato.h"
#import "UIViewController+CoreData.h"

@interface NewViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *sobrenomeTextField;
@property (weak, nonatomic) NSManagedObject *contatoManagedObject;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) NSEntityDescription *entityDescription;

//-(void)setContatoManagedObject:(NSManagedObject *)object;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_contatoManagedObject){
        _nomeTextField.text = [_contatoManagedObject valueForKey:@"nome"];
        _sobrenomeTextField.text = [_contatoManagedObject valueForKey:@"sobrenome"];
    }
    // Do any additional setup after loading the view.
}
- (IBAction)excluir:(id)sender {
    
    if(_contatoManagedObject){
        [_managedObjectContext deleteObject: _contatoManagedObject];
        NSError * error = nil;
        if (![_managedObjectContext save:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    [self performSegueWithIdentifier:@"unwindToMaster" sender:sender];
}

-(IBAction)salvar:(id)sender{
    
    
    if(_nomeTextField.text.length && _sobrenomeTextField.text.length){
        
        
        if(_contatoManagedObject){
            [_contatoManagedObject setValue:_nomeTextField.text forKey:@"nome"];
            [_contatoManagedObject setValue:_sobrenomeTextField.text forKey:@"sobrenome"];
        }
        else{
//            NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//            NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
            NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[_entityDescription name] inManagedObjectContext:_managedObjectContext];
            
            // If appropriate, configure the new managed object.
            // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
            [newManagedObject setValue:_nomeTextField.text forKey:@"nome"];
            [newManagedObject setValue:_sobrenomeTextField.text forKey:@"sobrenome"];
            
//            contato.nome = _nomeTextField.text;
//            contato.sobrenome = _sobrenomeTextField.text;
        }
        
        NSError * error = nil;
        if (![_managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        [self performSegueWithIdentifier:@"unwindToMaster" sender:sender];
        
    }else{
        // TODO - UIAlertController
        UITextField * campoExigido = _nomeTextField;
        NSString * erro = @"Nome e sobrenome sao obrigatorios";
        if((!_nomeTextField.text.length) && _sobrenomeTextField.text.length){
            erro = @"Nome e obrigatorio";
        }else if(_nomeTextField.text.length && !_sobrenomeTextField.text.length){
            erro = @"Sobrenome e obrigatorio";
            campoExigido = _sobrenomeTextField;
        }
        
    
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Info"
                                      message:erro
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [campoExigido becomeFirstResponder];
                                 
                             }];
                UIAlertAction* cancel = [UIAlertAction
                                         actionWithTitle:@"Cancel"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action)
                                         {
                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                             [self performSegueWithIdentifier:@"unwindToMaster" sender:sender];
        
                                         }];
        
        [alert addAction:ok];
                [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)setContatoManagedObject:(NSManagedObject *)managedObject{
    _contatoManagedObject = managedObject;
}

-(void)setManagedObjectContext:(NSManagedObjectContext *)context andEntityDescription:(NSEntityDescription *)entityDescription{
    _managedObjectContext = context;
    _entityDescription = entityDescription;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
