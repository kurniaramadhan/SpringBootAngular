import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  checkoutFormGroup: FormGroup;
  billingAddressState: any;
  shippingAddressState: any;

  totalQuantity: number = 0;
  totalPrice: number = 0.0;

  constructor(private _formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.checkoutFormGroup = this._formBuilder.group({
      customer: this._formBuilder.group({
        firstName: [''],
        lastName: [''],
        email: [''],
        phone: ['']
      }),
      shippingAddress: this._formBuilder.group({
        country: [''],
        state: [''],
        city: [''],
        zipCode: [''],
        street: ['']
      }),
      billingAddress: this._formBuilder.group({
        country: [''],
        state: [''],
        city: [''],
        zipCode: [''],
        street: ['']
      }),
      creditCard: this._formBuilder.group({
        cardType: [''],
        nameOnCard: [''],
        cardNumber: [''],
        securityCode: [''],
        expirationMonth: [''],
        expirationYear: ['']
      })
    });
  }

  copyToBillingAddress(event) {
    if (event.target.checked) {
      console.log('Checked.................');
      this.checkoutFormGroup.controls['billingAddress'].setValue(
        this.checkoutFormGroup.controls['shippingAddress'].value
      );
      this.billingAddressState = this.shippingAddressState;
    } else {
      this.checkoutFormGroup.controls['billingAddress'].reset();
      this.billingAddressState = [];
    }
  }

  onSubmit() {
    console.log("Handling the submit button");
    console.log(this.checkoutFormGroup.get('customer').value);
    console.log('-----');
    console.log(this.checkoutFormGroup.get('shippingAddress').value);
    console.log('-----');
    console.log(this.checkoutFormGroup.get('billingAddress').value);
    console.log('-----');
    console.log(this.checkoutFormGroup.get('creditCard').value);
  }
}
