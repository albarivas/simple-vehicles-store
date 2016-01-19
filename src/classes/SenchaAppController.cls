public with sharing class SenchaAppController
{
    public static Boolean DEV_MODE { get { return true; } }

    /**
     * Remote Actions
     */
    @RemoteAction
    public static List<Car__c> getCars()
    {
        return [SELECT Brand__c, Colour__c, Fuel__c, Id, LicenseNumber__c, Name, Price__c, Sold__c from Car__c];
    }
    
    @RemoteAction
    public static List<Brand__c> getBrands()
    {
        return [SELECT Id, Name from Brand__c];
    }
}