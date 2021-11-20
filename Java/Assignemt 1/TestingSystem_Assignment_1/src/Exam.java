import java.time.LocalDate;

public class Exam {
	byte id;
	String code;
	String title;
	byte categoryId;
	Duration Duration;
	Account creatorId;
	LocalDate createDate;
	Question[] question;
}