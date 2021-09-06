import { LightningElement, api, track, wire } from 'lwc';
import getContact from '@salesforce/apex/OrgIntegrationController.getContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class SeachContactFormat extends LightningElement {

    
    @track buttonStatus = true;
    @api lastNameValue;

    get disableButton(){
        return this.buttonStatus;
    }

    handleChange(event) {
        this.buttonStatus=!event.detail.value;
        this.lastNameValue=event.detail.value;
        console.log(this.lastNameValue);
    }
   
    handleSearch(event) {
        console.log('im here');
        getContact({lastName: this.lastNameValue})
        .then((data)=>{
            this.dispatchEvent(new CustomEvent('found',{detail: {value: data}}));
            console.log(data);
            
        })
        .catch((error)=>{this.showNotification()});

    }

    showNotification() {
        const evt = new ShowToastEvent({
            title: 'Contact Search',
            message: 'Contact didn\'t found',
            variant: 'warning',
        });
        this.dispatchEvent(evt);
    }

}