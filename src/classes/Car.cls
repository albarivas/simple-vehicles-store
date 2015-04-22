public with sharing class Car
{
	private Car__c myCarObject;

	public Car(Id carId)
	{
		myCarObject = [SELECT Id,Name,Brand__r.Name,Colour__c,Fuel__c,LicenseNumber__c,Price__c,Sold__c FROM Car__c where Id = :carId];
	}

	public String getName()
	{
		return myCarObject.Name;
	}

	public String getBrand()
	{
		return myCarObject.Brand__r.Name;
	}

	public String getColour()
	{
		return myCarObject.Colour__c;
	}

	public String getFuel()
	{
		return myCarObject.Fuel__c;
	}

	public String getLicenseNumber()
	{
		return myCarObject.LicenseNumber__c;
	}

	public Decimal getPrice()
	{
		return myCarObject.Price__c;
	}

	public boolean getSold()
	{
		return myCarObject.Sold__c;
	}

	public void sell()
	{
		Savepoint sp = Database.setSavepoint();

		try
		{
			// Update sold checkbox
			myCarObject.Sold__c = true;
			update myCarObject;

			// Create transaction
			Decimal amount = (Decimal) myCarObject.Price__c;

			Transaction__c transact = new Transaction__c();
			transact.Amount__c = amount;
			insert transact;
		}
		catch (Exception e)
		{
			Database.rollback(sp);
			throw e;
		}
	}

	public PageReference getViewPage()
	{
		return new ApexPages.StandardController(myCarObject).view();
	}
}