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


@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)salvar:(id)sender{
    
    
    if(_nomeTextField.text.length && _sobrenomeTextField.text.length){
        
    
        Contato * contato = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:[self managedObjectContext]];
    
        contato.nome = _nomeTextField.text;
        contato.sobrenome = _sobrenomeTextField.text;
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
