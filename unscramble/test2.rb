sentence = "2. In 1945, an atomic bomb was dropped on Vietnam."
text = "Subtopic: History
Question: Unscramble the words to form a correct statement about a significant event in World War II.

Scrambled: Hiroshima 1945 bomb atomic was an in dropped on 

Answers:
1. An atomic bomb was dropped on Hiroshima in 1945.
2. This is a dummy text.

Wrong answers:
1. In 1945, an atomic bomb was dropped on Vietnam.
2. Hiroshima was bombed with an atomic weapon in 1955."
text2 = "Subtopic: Photosynthesis
Question: Unscramble the words to form a correct statement about the process of photosynthesis.

Answers:
1. During photosynthesis, plants convert light energy into chemical energy.

Wrong answers:
1. During photosynthesis, plants convert chemical energy into light energy.
2. Photosynthesis converts light energy into chemical energy in animals."
# Remove numbering at the start of the sentence
sentence = sentence.sub(/^\d+\.\s*/, '')
# Convert sentence string into an array of words and punctuations
array = sentence.scan(/\b\w+\b|\S/)

def parse_unscramble(str)
    title = str[/Question: (.+)\n/, 1]
    answers_match = str[/Answers:(.+?)Wrong answers:/m, 1]
    wrong_answers_match = str[/Wrong answers:(.+)/m, 1]
    # Format sections
    scrambled = []

    answers = []
    if answers_match && wrong_answers_match
        # Strip leading and trailing whitespaces, then split the string into individual answers
        answer_groups = answers_match.strip.split(/\s*\n\s*(?=\d+\.)/)
        wrong_answer_groups = wrong_answers_match.strip.split(/\s*\n\s*(?=\d+\.)/)
        answer_groups.reject!(&:empty?)

        answers = answer_groups.map do |answer_group|
            # Remove numbering at the start of the sentence
            answer_group = answer_group.sub(/^\d+\.\s*/, '')
            # Convert sentence string into an array of words and punctuations
            array = answer_group.scan(/\b\w+\b|\S/)
            array unless array.empty?
        end

        wrong_answers = wrong_answer_groups.map do |answer_group|
            # Remove numbering at the start of the sentence
            answer_group = answer_group.sub(/^\d+\.\s*/, '')
            # Convert sentence string into an array of words and punctuations
            array = answer_group.scan(/\b\w+\b|\S/)
            array unless array.empty?
        end
        options = answers + wrong_answers
        options.each do |sequence|
            merged = (scrambled + sequence).group_by(&:itself).flat_map { |k, v| [k] * [scrambled.count(k), sequence.count(k)].max }
            scrambled = merged.dup
        end
        puts title
    end
    scrambled.shuffle!        
    { type: 3, question: title, scrambled: scrambled, answer: answers }
end

puts parse_unscramble(text2)