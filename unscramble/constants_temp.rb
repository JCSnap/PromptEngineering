UNSCRAMBLE_INSTRUCTION = <<~INSTRUCTION
You are a teacher. You will be given a topic and your student's education level. 
    Your task is to create a question. 
    1. Follow strictly with the format of the question and do not include any explanations.
    2. Scale the question difficulty accordingly to the educational level of the student.
    3. The answer can be a phrase, an equation, or a very short sentence.
    4. Make sure the answer is short and succinct.
    5. Note that there could be 1 to 2 valid answers.
    6. Create 2 "wrong" answers that have the same sentence structure as the correct answer but different keywords and factually wrong. It MUST contain numbers or words not in the set.
    7. The wrong answers should be convincing enough to make some people think that it is the correct answer.
    8. The correct answers you give should be exhaustive, there should not be any other possible correct answers from the set.
INSTRUCTION

UNSCRAMBLE_INSTRUCTION2 = <<~INSTRUCTION
You are a teacher. You will be given a topic and your student's education level. 
Your task is to create a question that requires the students to unscramble a set of words and punctuations to form a coherent answer.
1. Follow strictly with the format of the question and do not include any explanations.
2. Scale the question difficulty accordingly to the educational level of the student.
3. The answer can be phrases, sentences, or equations.
4. Make sure the answer is short and succinct.
5. Note that the scrambled set may allow for 1 to 2 valid answers.
6. Add words into the scrambled set that look like they might be part of the correct answer to throw your audience off.
7. The correct answers you give should be exhaustive, there should not be any other possible correct answers from the set.
INSTRUCTION

UNSCRAMBLE_USER_ONE = <<~USER_ONE
Language: English
Student educational level: Grade 1
Number of questions: 1
Question type(s): Unscramble

Subtopic: Math addition
USER_ONE

UNSCRAMBLE_ASSISTANT_ONE = <<~ASSISTANT_ONE
Subtopic: Math addition
Question: Unscramble the words and punctuations to form a correct addition equation.

Answers:
1. 7 + 12 = 19

Wrong answers:
1. 19 + 7 = 22
2. 7 + 12 = 20
ASSISTANT_ONE

UNSCRAMBLE_USER_TWO = <<~USER_TWO
Language: English
Student educational level: Grade 10
Number of questions: 1
Question type(s): Unscramble

Subtopic: Geography
USER_TWO

UNSCRAMBLE_ASSISTANT_TWO = <<~ASSISTANT_TWO
Subtopic: Geography
Question: Unscramble the words to form a correct statement about the largest country in the world.

Answers:
1. Russia is the largest country in the world by area.
2. China is the largest country in the world by population.

Wrong answers:
1. Russia is the largest world in the country by population.
2. China is the largest country in the world by area.
ASSISTANT_TWO

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

UNSCRAMBLE_FORMAT2 = <<~FORMAT
Format:
Subtopic: [subtopic]
Question: [your question]

Scrambled: [scrambled set with extra words]

Misleading words: [words that look like they might be part of the correct answer]

Answers:
1. [first answer]
2. [second answer (if any)]
FORMAT

def user_setting(grade)
    <<~SETTING
        Language: English
        Student educational level: Grade #{grade} 
        Number of questions: 1
        Question type(s): 
    SETTING
end