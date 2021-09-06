import { LightningElement, api } from 'lwc';

export default class ContactSearchComponent extends LightningElement {
   
    @api contact;

    handleFound(event) {
        this.contact = event.detail.value;
    }

}