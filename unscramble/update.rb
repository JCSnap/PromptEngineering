require 'openai'
require_relative 'constants_temp'

client = OpenAI::Client.new(access_token: "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")


subtopic = "Photosynthesis"
grade = "6"

setting = user_setting(grade)

prompt = setting + "\n" + "Subtopic: " + subtopic + "\n" + UNSCRAMBLE_FORMAT
print(prompt)

parameters = {
    model: "gpt-4-0613",
    messages: [
        {role: "system", content: UNSCRAMBLE_INSTRUCTION},
        {role: "user", content: UNSCRAMBLE_USER_ONE},
        {role: "system", content: UNSCRAMBLE_ASSISTANT_ONE},
        {role: "user", content: UNSCRAMBLE_USER_TWO},
        {role: "system", content: UNSCRAMBLE_ASSISTANT_TWO},
        {role: "user", content: prompt}
    ],
    temperature: 0.7,
    max_tokens: 200,
}

response = client.chat(parameters: parameters)
puts response
output = response.dig("choices", 0, "message", "content")
puts output