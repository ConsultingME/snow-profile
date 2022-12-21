import { LightningElement, track } from 'lwc';

export default class PcccFindPatients extends LightningElement {
     
     @track displayProfile = false;

     handleCardClick(event) {
          this.displayProfile = true;
     }

     handleProfileClick(event) {
          this.displayProfile = false;
     }

     items = [
          {
              label: 'Therapeutic Area',
              name: '1',
              expanded: true,
              items: [
               {
                    label: 'aHUS',
                    name: '2'
               },
               {
                    label: 'gMG',
                    name: '3'
               },
               {
                    label: 'HPP',
                    name: '4'
               },
               {
                    label: 'LAL-D',
                    name: '5'
               },
               {
                    label: 'NMOSD',
                    name: '5'
               },
               {
                    label: 'PNH',
                    name: '5'
               },
              ]
          },
          {
               label: 'Location',
               name: '6',
               expanded: false,
               items: [
                    {
                         label: 'New England',
                         name: '7'
                    },
                    {
                         label: 'Mid-Atlantic',
                         name: '8'
                    },
                    {
                         label: 'Midwest',
                         name: '9'
                    },
                    {
                         label: 'South',
                         name: '10'
                    }
               ]
          }
      ];
}