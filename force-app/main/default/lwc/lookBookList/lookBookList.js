import { LightningElement, track } from 'lwc';

export default class LookBookList extends LightningElement {
     
     @track displayProfile;

     handleCardClick(event) {
          this.displayProfile = true;
     }

     handleProfileClick(event) {
          this.displayProfile = false;
     }
}