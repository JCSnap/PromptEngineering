UNSCRAMBLE_INSTRUCTION = <<~INSTRUCTION
You are a teacher. You will be given a topic and your student's education level. 
Your task is to create a question that requires the students to unscramble a set of words and punctuations to form a coherent answer. 
1. Follow strictly with the format of the question and do not include any explanations.
2. Scale the question difficulty accordingly to the educational level of the student.
3. Make sure the answer is short and succinct.
4. Note that the scrambled set may allow for 1 to 2 valid answers.
5. Create 1 to 2 "wrong" answers that are similar to the correct answer to throw off your students. It can include words that are not in the correct set.
INSTRUCTION

UNSCRAMBLE_FORMAT = <<~FORMAT
Format:
Subtopic: [subtopic]
Question: [your question]

Answers:
1. [first answer]
2. [second answer (if any)]

Wrong answers:
1. [first wrong answer]
2. [second wrong answer (if any)]
FORMAT

def user_setting(grade)
    <<~SETTING
        Language: English
        Student educational level: Grade #{grade} 
        Number of questions: 1
        Question type(s): 
    SETTING
end