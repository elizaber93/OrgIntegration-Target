import { LightningElement, api } from 'lwc';

export default class ContactSearchComponent extends LightningElement {
   
    @api contact;

    handleFound(event) {
        console.log('im in parent component');
        console.log(event.detail.value);
        this.contact = event.detail.value;
    }

}