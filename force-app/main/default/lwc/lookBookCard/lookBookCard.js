import { LightningElement, api } from 'lwc';
import LOOKBOOK_ASSETS from '@salesforce/resourceUrl/LookbookAssets';

export default class LookBookCard extends LightningElement {
     
     astroProfilePicLarge = LOOKBOOK_ASSETS + '/lightning_blue_profile_avatar_160.png';
     astroProfilePicSmall = LOOKBOOK_ASSETS + '/lightning_blue_profile_avatar_96.png';

     @api firstName;
     @api lastName;
     @api city;
     @api state;

     @api displayCardLarge;
     @api displayCardSmall;
}