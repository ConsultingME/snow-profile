public with sharing class ProgramRequestHandler {
	
	public Program_Request__c[] requests;
	public Map<String, Lead_Times_For_Types__c> setting;
	public Map<Id, Program_Request__c> oldMap;
	
	private Id bioverativId;

	public ProgramRequestHandler(Program_Request__c[] requests, Map<Id, Program_Request__c> oldMap) {
		this.requests = requests;
		this.oldMap = oldMap;
		this.bioverativId = Schema.SObjectType.Program_Request__c.getRecordTypeInfosByName().get('Bioverativ Program Request').getRecordTypeId();
		
		setting = Lead_Times_For_Types__c.getAll();
	}

	/**
	 * replace error message on field with error message on object (SC-335) - Updated 2017-05-02 by Aaron
	 * only validate Bioverativ Program Request records (SC-287) - Updated 2017-05-02 by Aaron
	 * skip validation if 'Override Lead Time' is true (SC-366) - Updated 2017-06-06 by Aaron
	 */
	public void validateProgramDate() {

		for (Program_Request__c pr : requests) {
			// Skip if record type is not 'Bioverativ Program Request'
			// Skip if 'Override Lead Time' is true
			if (pr.RecordTypeId != this.bioverativId || pr.Override_Lead_Time__c == true) {
				continue;
			}
			
			Date earliestDate = getEarliestDate(pr);

			if (oldMap != null ) {

				if (oldMap.containsKey(pr.Id) && pr.Program_Date__c != oldMap.get(pr.Id).Program_Date__c || pr.Type_Topic__c != oldMap.get(pr.Id).Type_Topic__c || pr.Override_Lead_Time__c != oldMap.get(pr.Id).Override_Lead_Time__c) {

					if (pr.Program_Date__c != null && pr.Type_Topic__c == null) {

						pr.addError('Please select a Type prior to selecting a Program Date');
					}
					else if (pr.Program_Date__c < Date.today()) {

						pr.addError('You have selected a Program Date in the past, please select a future date for the event that coincides to the Type selected. For the current Type selected, the earliest date the event can be scheduled would be ' + earliestDate.format() + '.'); 
					}
					else if (pr.Program_Date__c < earliestDate) {

						pr.addError('You have selected a Program Date that does not provide the required lead time for the Type selected. Based on today\'s date, the earliest an event of this type can be scheduled would be ' + earliestDate.format() + '.'); 
					}
				}
			}
			else {

				if (pr.Program_Date__c != null && pr.Type_Topic__c == null) {

					pr.addError('Please select a Type prior to selecting a Program Date');
				}
				else if (pr.Program_Date__c < Date.today()) {

					pr.addError('You have selected a Program Date in the past, please select a future date for the event that coincides to the Type selected. For the current Type selected, the earliest date the event can be scheduled would be ' + earliestDate.format() + '.'); 
				}
				else if (pr.Program_Date__c < earliestDate) {

					pr.addError('You have selected a Program Date that does not provide the required lead time for the Type selected. Based on today\'s date, the earliest an event of this type can be scheduled would be ' + earliestDate.format() + '.'); 
				}

			}

		}
	}


	private Date getEarliestDate(Program_Request__c request) {

		Date earliestDate = Date.today();

		if (setting.containsKey(request.Type_Topic__c)) {

			Integer daysToAdd = Integer.valueOf(7 * setting.get(request.Type_Topic__c).Number_Of_Weeks__c);
			earliestDate = earliestDate.addDays(daysToAdd);
		}

		return earliestDate;
	}
}