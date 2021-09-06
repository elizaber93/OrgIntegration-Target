import { LightningElement, api, track } from 'lwc';
import sendInvitation from '@salesforce/apex/OrgintegrationController.sendInvitation';

export default class ContactOutput extends LightningElement {
    
    @api contact;


    get firstName() {
        if (this.contact) {
        return JSON.parse(this.contact).FirstName; 
        }
    }

    get lastName() {
        if (this.contact) {
        return JSON.parse(this.contact).LastName;
        }
    }

    get email() {
        if (this.contact) {
        return JSON.parse(this.contact).Email;
        }
    }

    handleClick(event) {
        sendInvitation({email: JSON.parse(this.contact).Email});
        
    }

    



}