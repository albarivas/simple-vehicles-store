public with sharing class CarController
{
	public Car MyCar {get;set;}

	public CarController(ApexPages.StandardController standardController)
	{
		myCar = new Car(standardController.getId());
	}

	public PageReference sell()
	{
		try
		{
			myCar.sell();
			return goBack();
		}
		catch (Exception e)
		{
			ApexPages.addMessage(new Apexpages.Message(ApexPages.Severity.Error,e.getMessage()));
		}
		return null;
	}

	public PageReference goBack()
	{
		PageReference viewPage = myCar.getViewPage();
		viewPage.setRedirect(true);
		return viewPage;
	}
}