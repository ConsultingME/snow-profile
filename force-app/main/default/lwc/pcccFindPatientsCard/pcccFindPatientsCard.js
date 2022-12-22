import { LightningElement, api } from 'lwc';
import LOOKBOOK_ASSETS from '@salesforce/resourceUrl/LookbookAssets';

export default class PcccFindPatientsCard extends LightningElement {
     
     astroProfilePicSmall = LOOKBOOK_ASSETS + '/lightning_blue_profile_avatar_96.png';

     @api patientName;
     @api patientLocation;
     @api patientSelected;
     @api patientStatus;
     @api showCheckbox;
     @api showStatus;
     @api showProfilePic;

}