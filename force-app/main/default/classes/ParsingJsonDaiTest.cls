@isTest
public with sharing class ParsingJsonDaiTest {
    
    private static Account cuenta = new Account();

    static {
        cuenta.Name = 'nombre';
        insert cuenta;
    }


    @isTest
    public static void testGetColor(){

        Test.setMock(HttpCalloutMock.class, new ParsinJsonDaiMock());

        List<Color__c> colorsInserted = [SELECT Id FROM Color__c];
        System.assertEquals(0, colorsInserted.size());

        Color colorMio;
        Test.startTest();
        colorMio = ParsingJsonDai.getColor(cuenta.Id); 
        Test.stopTest();

        colorsInserted = [SELECT Id FROM Color__c];
        System.assertEquals(1, colorsInserted.size());

        System.assert(colorMio.successful, 'El color no fue guardado correctamente'); 
        System.assert(colorMio.colorDate != null); 

        
        System.assertEquals('random color: #23ABC0', colorMio.color);
        System.assertEquals('#23ABC0', colorMio.colorCode);
        System.assertEquals(cuenta.Id, colorMio.getAccountId());
    }
    
@isTest
    public static void testLatestColor(){

        Color__c unColor = new Color__c();

        unColor.colorCode__c = '#123423';
        unColor.colorDate__c = datetime.now(); //console.debug para obtenerlo
        unColor.Name = 'Color1';
        unColor.AccountColor__c = cuenta.Id;
        insert unColor;


        Color__c latestColor;

        Test.startTest();
        latestColor = ParsingJsonDai.getLatest(cuenta.Id);
        Test.stopTest();

        System.assert(latestColor != null); 
    }

}
