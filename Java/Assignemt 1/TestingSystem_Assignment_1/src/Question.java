import java.time.LocalDate;

public class Question {
		byte id;
		String content;
		CategoryQuestion category;
		TypeQuestion type;
		TypeName TypeName;
		Account creator;
		LocalDate createDate;
		Exam[] exam;
}
