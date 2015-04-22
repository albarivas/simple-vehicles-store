trigger Car on Car__c (before insert, before update)
{
	if (Trigger.isBefore)
	{
		if (Trigger.isInsert)
		{
			// Before insert
			for (Car__c myCarObject : Trigger.new)
			{
				if (myCarObject.Sold__c == true)
					throw new VehicleException('Cannot insert a sold car.');
			}
		}

		if (Trigger.isUpdate)
		{
			// Before insert
			for (Car__c myOldCarObject : Trigger.old)
			{
				if (myOldCarObject.Sold__c == true)
					throw new VehicleException('Cannot update a sold car.');
			}
		}
	}
}