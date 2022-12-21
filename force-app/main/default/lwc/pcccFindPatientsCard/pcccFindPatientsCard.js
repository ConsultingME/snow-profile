import { LightningElement, api } from 'lwc';

export default class PcccFindPatientsCard extends LightningElement {
     @api patientName;
     @api patientLocation;
     @api patientSelected;
     @api patientStatus;
}