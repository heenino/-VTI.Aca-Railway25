import java.time.LocalDate;

public class Program {
	public static void main(String[] args) {
		// logic
		
												// create department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "sale";
		
		Department department2 = new Department();
		department2.id = 2;
		department2.name = "CEO";
		
		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Nv1";
		
		Department department4 = new Department();
		department4.id = 4;
		department4.name = "Nv2";

												//create position
		Position position1 = new Position();
		position1.id = 1;
		
		Position position2 = new Position();
		position2.id = 2;
		
		Position position3 = new Position();
		position3.id = 3;
		
		Position position4 = new Position();
		position4.id = 4;
		
												//create Account
		Account Account1 = new Account();
		Account1.id = 1;
		Account1.mail = "hoang123@yahoo.com";
		Account1.fullName = "Tran Van Hoang";
		Account1.userName = "Hoang113";
		Account1.Department = department1;
		Account1.position = position1;
		Account1.PositionName = PositionName.DEV;
		Account1.createDate = LocalDate.of(2020,9,12);
			
		Account Account2 = new Account();
		Account2.id = 2;
		Account2.mail = "quy123@yahoo.com";
		Account2.fullName = "Tran Van Quy";
		Account2.userName = "Quypro";
		Account2.Department = department2;
		Account2.position = position2;
		Account2.PositionName = PositionName.PM;
		Account2.createDate = LocalDate.of(2021,9,12);
		
		Account Account3 = new Account();
		Account3.id = 3;
		Account3.mail = "Tuantienti@yahoo.com";
		Account3.fullName = "Tran Thi Tuan";
		Account3.userName = "Tuantienti";
		Account3.Department = department3;
		Account3.position = position3;
		Account3.PositionName = PositionName.SCRUM_MATER;
		Account3.createDate = LocalDate.of(2020,3,12);
		
											// create Group
		
		Group Group1 = new Group();
		Group1.id = 1;
		Group1.name = "SieuNhanGao";
		Group1.createId = Account1;
		Group1.createDate = LocalDate.of(2021, 8, 15);
		
		Group Group2 = new Group();
		Group2.id = 2;
		Group2.name = "KidDongNat";
		Group2.createId = Account1;
		Group2.createDate = LocalDate.of(2020, 12, 25);
		
		Group Group3 = new Group();
		Group3.id = 3;
		Group3.name = "BanCotaiMa";
		Group3.createId = Account3;
		Group3.createDate = LocalDate.of(2021, 10, 15);
		
											// create Group of Account
		
		Group[] GroupOfAccount1 = {Group1,Group2};  // nhóm các Gr lại với nhau và gán cho Account 1
		Account1.Group = GroupOfAccount1;
		Account[] AccountOfGroup1 = {Account1,Account3,Account2}; // nhóm các account lại rồi gán cho gr 1
		Group1.AccountId = AccountOfGroup1;
		
		Group[] GroupOfAccount2 = {Group1};
		Account2.Group = GroupOfAccount2;
		Account[] AccountOfGroup2 = {Account3,Account2};
		Group1.AccountId = AccountOfGroup2;
		
		Group[] GroupOfAccount3 = {Group1,Group3};
		Account2.Group = GroupOfAccount3;
		Account[] AccountOfGroup3 = {Account1};
		Group1.AccountId = AccountOfGroup3;
		
												// create TypeQuestion
		TypeQuestion TypeQuestion1 = new TypeQuestion();
		TypeQuestion1.id =1;	
		
		TypeQuestion TypeQuestion2 = new TypeQuestion();
		TypeQuestion2.id =2;
		
		TypeQuestion TypeQuestion3 = new TypeQuestion();
		TypeQuestion3.id =3;
		
		
												// create CategoryQuestion
		
		CategoryQuestion CategoryQuestion1 = new CategoryQuestion();
		CategoryQuestion1.id = 1;
		CategoryQuestion1.name = "Java";
				
		CategoryQuestion CategoryQuestion2 = new CategoryQuestion();
		CategoryQuestion2.id = 3;
		CategoryQuestion2.name = "Ruby";
		
		CategoryQuestion CategoryQuestion3 = new CategoryQuestion();
		CategoryQuestion3.id = 3;
		CategoryQuestion3.name = "SQL";
		
												// create Question
		
		Question Question1 = new  Question();
		Question1.id = 1;
		Question1.content = "Java là gì?";
		Question1.category = CategoryQuestion1;
		Question1.type = TypeQuestion1 ;
		Question1.TypeName = TypeName.ESSAY;
		Question1.creator = Account1;
		Question1.createDate = LocalDate.of(2021, 1, 10);
		
		Question Question2 = new  Question();
		Question2.id = 2;
		Question2.content = "Ruby là gì?";
		Question2.category = CategoryQuestion2;
		Question2.type = TypeQuestion2 ;
		Question2.TypeName = TypeName.MULTIPLE_CHOICE;
		Question2.creator = Account1;
		Question1.createDate = LocalDate.of(2021, 4, 16);
		
		Question Question3 = new  Question();
		Question3.id = 3;
		Question3.content = "SQL là gì?";
		Question3.category = CategoryQuestion3;
		Question3.type = TypeQuestion3 ;
		Question3.TypeName = TypeName.ESSAY;
		Question3.creator = Account1;
		Question1.createDate = LocalDate.of(2021, 8, 11);
		
												//create Answer
		
		Answer Ansew1 = new Answer();
		Ansew1.id = 1;
		Ansew1.questionId = Question1;
		Ansew1.content = "Java là ngôn ngữ lập trình hướng đối tượng";
		Ansew1.isCorrect = true;
		
		Answer Ansew2 = new Answer();
		Ansew1.id = 2;
		Ansew1.questionId = Question2;
		Ansew1.content = "Ruby là một ngôn ngữ lập trình hướng đối tượng như Java";
		Ansew1.isCorrect = false;
		
		Answer Ansew3 = new Answer();
		Ansew1.id = 3;
		Ansew1.questionId = Question3;
		Ansew1.content = "SQL là viết tắt của từ Structured Query Language";
		Ansew1.isCorrect = true;
		
		
												 //create exam
		
		Exam Exam1  = new Exam();
		Exam1.id = 1;
		Exam1.code = "A2021";
		Exam1.categoryId = 1;
		Exam1.creatorId = Account1;
		Exam1.Duration = Duration.M_15 ;
		Exam1.createDate = LocalDate.of(2021, 10, 10);
		
		Exam Exam2  = new Exam();
		Exam2.id = 2;
		Exam2.code = "A2020";
		Exam2.categoryId = 2;
		Exam2.creatorId = Account1;
		Exam2.Duration = Duration.M_60;
		Exam2.createDate = LocalDate.of(2020, 10, 10);
		
		Exam Exam3  = new Exam();
		Exam3.id = 3;
		Exam3.code = "A2019";
		Exam3.categoryId = 3;
		Exam3.creatorId = Account2;
		Exam3.Duration = Duration.M_60;
		Exam3.createDate = LocalDate.of(2019, 10, 10);
							// create Exam Question
		Exam[] ExamOfQuestion1 = {Exam1,Exam2}; // gộp đề thi 1 và 2 lại với nhau
		Question1.exam = ExamOfQuestion1;		// Question1 thì đều có trong đề 1 và 2
		Question[] QuestionOfExam1 = {Question3,Question1};
		Exam1.question = QuestionOfExam1;
		
		
		
				// in ra thông tin phòng ban 1 
		System.out.println("thông tin phòng ban 1");
		System.out.println("id : " + department1.id);
		System.out.println("name : " + department1.name);
		System.out.println("\n");
		 		// in ra thông tin Account 1
		System.out.println("Thông tin Account 1");
		System.out.println("Id :" + Account1.id);
		System.out.println("Mail :" + Account1.mail);
		System.out.println("User Name :" + Account1.userName);
		System.out.println("Full Name :" + Account1.fullName);
		System.out.println("Create Date :" + Account1.createDate);
		System.out.println("Department Id :" + Account1.Department.id);
		System.out.println("Department Name :" + Account1.Department.name);
		System.out.println("Position Id:" + Account1.position.id);
		System.out.println("Position Name :" + Account1.PositionName);
		System.out.println("Create Date :" + Account1.createDate);
		System.out.println("\n");
				//in ta thông tin Group 1
		System.out.println(" Thông Tin Group 1!");
		System.out.println("Id :" + Group1.id);
		System.out.println("Name : " + Group1.name);
		System.out.println("Creator Id :" + Group1.createId.id);
		System.out.println("Creator Name :" + Group1.createId.userName);
		System.out.println("Create Date :" + Group1.createDate);
		System.out.println("\n");
				//in ra thông tin CategoryQuestion 1
		System.out.println("thông tin CategoryQuestion 1 ");
		System.out.println("Id :" + CategoryQuestion1.id);
		System.out.println("Name :" + CategoryQuestion1.name);
		System.out.println("\n");
				//in ra thông tin Question 1
		System.out.println("Thông Tin Question 1!");
		System.out.println("Id :" + Question1.id);
		System.out.println("Content: " + Question1.content);
		System.out.println("CategoryQuestion id :" + Question1.category.id);
		System.out.println("CategoryQuestion name :" + Question1.category.name);
		System.out.println("Type id :" + Question1.type.id);
		System.out.println("Type name :" + Question1.TypeName);
		System.out.println("Creator Id :" + Question1.creator.id);
		System.out.println("Creator Name :" + Question1.creator.userName);
		System.out.println("Create Date :" + Question1.createDate);
		System.out.println("\n");
				//in ra thông in Answer 1
		System.out.println("In Ra Thông Tin Answer 1");
		System.out.println("Id :" + Ansew1.id);
		System.out.println("Content :" + Ansew1.content);
		System.out.println("Question Id :" + Ansew1.questionId.id);
		System.out.println("isCorrect :" + Ansew1.isCorrect);
		System.out.println("\n");
				//in ra thông tin Exam 1
		System.out.println("Thông Tin Exam 1");
		System.out.println("Id :" + Exam1.id);
		System.out.println("Title :" + Exam1.title);
		System.out.println("Code :" + Exam1.code);
		System.out.println("category Id :" + Exam1.categoryId);
		System.out.println("Creator Id:" + Exam1.creatorId.id);
		System.out.println("duration : " + Exam1.Duration);
		System.out.println("Create Date :" +Exam1.createDate);
		
	}	
	
}

