class Ticket{
  int id;
  int ticketNumber;
  int visitorId;
  String visitorName;
  int statusId;
  String departementName;
  String statusNameAR;
  String statusNameEN;
  int branchId;
  String branchNameAR;
  String branchNameEN;
  int departementId;
  String departementNameAR;
  String departementNameEN;
  int branchDepartementId;
  int currentNumber;
  Ticket(id,current,branch,departement){
    this.id=id;
    this.currentNumber=current;
    this.branchNameEN=branch;
    this.departementName=departement;
  }
}