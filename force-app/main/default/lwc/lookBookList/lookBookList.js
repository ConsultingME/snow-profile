import { LightningElement, track } from 'lwc';

export default class LookBookList extends LightningElement {
     
     @track displayProfile = false;

     handleCardClick(event) {
          this.displayProfile = true;
     }

     handleProfileClick(event) {
          this.displayProfile = false;
     }
}