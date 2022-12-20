import { LightningElement, api } from 'lwc';
import LOOKBOOK_ASSETS from '@salesforce/resourceUrl/LookbookAssets';

export default class LookBookProfile extends LightningElement {
     lookbookQuotes = LOOKBOOK_ASSETS + '/quotes.png';
     lookbookProfilePic = LOOKBOOK_ASSETS + '/profile-pic-example.png';
     
     handleProfileClick() {
          this.dispatchEvent(new CustomEvent('profileclose'));
     }
}