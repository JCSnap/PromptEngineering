require 'openai'
require_relative 'constants'

client = OpenAI::Client.new(access_token: "")


subtopic = "Photosynthesis"
grade = "5"

setting = user_setting(grade)

prompt = setting + "\n" + "Subtopic: " + subtopic + "\n" + UNSCRAMBLE_FORMAT 
print(prompt)

parameters = {
    model: "gpt-4",
    messages: [
        {role: "system", content: UNSCRAMBLE_INSTRUCTION},
        {role: "user", content: prompt}
    ],
    temperature: 0.7,
    max_tokens: 200,
}

response = client.chat(parameters)

output = response.dig("choices", 0, "message", "content")

puts output
