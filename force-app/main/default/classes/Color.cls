
public class Color {
   
    @AuraEnabled
    public String color;
    @AuraEnabled
    public String colorCode;
    @AuraEnabled
    public Datetime colorDate;
    @AuraEnabled
    public Boolean successful;
    @AuraEnabled
    public String accountId;

        public Color(){
        } 

        public Color(String color, String colorCode, Datetime colorDate){
        }

        //getters y setters 
        public void setSuccessful(Boolean successful) {
            this.successful = successful;
        }
 
        public Boolean getSuccessful(){
            return successful;
        }
 
        public void setAccountId(ID accountID) {
            this.accountID = accountID;
        }
 
        public ID getAccountId(){
            return accountID;
        }


}

