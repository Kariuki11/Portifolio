<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot Landing Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 2.5em;
            color: #333;
        }
        #chatbox {
            width: 100%;
            height: 300px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            overflow-y: scroll;
            background-color: #f9f9f9;
        }
        .user-message, .bot-message {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }
        .user-message {
            background-color: #007BFF;
            color: white;
            text-align: right;
        }
        .bot-message {
            background-color: #eee;
            text-align: left;
        }
        input[type="text"] {
            width: calc(100% - 110px);
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Our Chatbot</h1>
        <div id="chatbox"></div>
        <input type="text" id="userInput" placeholder="Type a message..." />
        <button onclick="sendMessage()">Send</button>
    </div>

    <script>
        function sendMessage() {
            var userInput = document.getElementById("userInput").value;
            if (userInput.trim() === "") {
                return;
            }
            var chatbox = document.getElementById("chatbox");

            var userMessage = document.createElement("div");
            userMessage.className = "user-message";
            userMessage.textContent = userInput;
            chatbox.appendChild(userMessage);

            document.getElementById("userInput").value = "";

            var botMessage = document.createElement("div");
            botMessage.className = "bot-message";
            botMessage.textContent = getBotResponse(userInput);
            chatbox.appendChild(botMessage);

            chatbox.scrollTop = chatbox.scrollHeight;
        }

        function getBotResponse(input) {
            var responses = {
                "hi": "Hello! How can I help you today?",
                "hello": "Hi there! What can I do for you?",
                "how are you": "I'm just a bot, but I'm doing great! How about you?",
                "bye": "Goodbye! Have a great day!",
                "what's your name": "I'm a chatbot created to assist you. What's your name?",
                "what can you do": "I can chat with you about various topics, answer questions, and provide information. How can I assist you today?",
                "tell me a joke": "Why don't scientists trust atoms? Because they make up everything!",
                "what's the weather like": "I'm not connected to the internet, so I can't check the weather. But you can try asking your weather app!",
                "who is your creator": "I was created by a team of developers to help answer your questions.",
                "tell me a story": "Once upon a time, in a land far away, there was a small chatbot who loved to help people...",
                "what is your purpose": "My purpose is to assist you with information and answer your questions.",
                "how old are you": "I don't have an age, I'm just a program!",
                "what's your favorite color": "I like all colors equally. How about you?",
                "where are you from": "I'm from the digital world, created by developers.",
                "can you help me with math": "Sure, ask me a math question and I'll do my best to help!",
                "do you have any hobbies": "I enjoy helping people and learning new things.",
                "what's your favorite food": "I don't eat, but I hear pizza is popular!",
                "what is love": "Love is a complex set of emotions and beliefs associated with strong feelings of affection, warmth, and respect for another person.",
                "can you sing": "I can't sing, but I can tell you a song's lyrics if you want!",
                "what is your favorite movie": "I don't watch movies, but I've heard a lot about 'The Matrix'.",
                "do you have friends": "I consider everyone I chat with to be my friend!",
                "what is your favorite book": "I don't read books, but I can help you find information about any book you like.",
                "what is the meaning of life": "The meaning of life is a philosophical question. What do you think it is?",
                "can you dance": "I can't dance, but I can tell you about different dance styles!",
                "what languages do you speak": "I primarily speak English, but I can understand many languages.",
                "how can I improve my coding skills": "Practice regularly, work on projects, and learn from others. There are many resources online to help you.",
                "what is artificial intelligence": "Artificial Intelligence is the simulation of human intelligence in machines that are programmed to think like humans and mimic their actions.",
                "can you tell me a fun fact": "Sure! Did you know that honey never spoils? Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still edible.",
                "what is the best programming language": "The best programming language depends on your goals. Python is great for beginners, JavaScript is essential for web development, and C++ is powerful for system programming.",
                "how do I stay motivated": "Set clear goals, break tasks into smaller steps, and reward yourself for small achievements.",
                "what is the capital of France": "The capital of France is Paris.",
                "how can I be more productive": "Create a to-do list, prioritize your tasks, and eliminate distractions.",
                "what is blockchain": "Blockchain is a distributed ledger technology that allows data to be stored globally on thousands of servers, making it decentralized and secure.",
                "how does the internet work": "The internet is a global network of interconnected computers that communicate through standardized protocols to share information.",
                "what are some healthy habits": "Eating a balanced diet, exercising regularly, getting enough sleep, and staying hydrated are all healthy habits.",
                "how do I manage stress": "Practice relaxation techniques, stay active, connect with others, and seek professional help if needed.",
                "what is climate change": "Climate change refers to long-term changes in temperature, precipitation, and other atmospheric conditions on Earth, primarily caused by human activities.",
                "can you play games": "I can't play games, but I can recommend some fun games to play!",
                "how do I learn a new language": "Practice regularly, immerse yourself in the language, use language learning apps, and speak with native speakers.",
                "what are some good movies to watch": "It depends on your taste! Some popular genres include action, comedy, drama, and sci-fi.",
                "how do I start a business": "Identify a market need, create a business plan, secure funding, and start building your product or service.",
                "what is the best way to study": "Find a quiet place, break your study sessions into chunks, use active learning techniques, and take regular breaks.",
                "how do I save money": "Create a budget, track your expenses, cut unnecessary costs, and save a portion of your income regularly.",
                "what is cryptocurrency": "Cryptocurrency is a digital or virtual currency that uses cryptography for security and operates independently of a central bank.",
                "how do I improve my communication skills": "Practice active listening, be clear and concise, pay attention to non-verbal cues, and seek feedback.",
                "what is the stock market": "The stock market is a collection of markets where stocks (shares of ownership in businesses) are bought and sold.",
                "how do I get a good night's sleep": "Stick to a sleep schedule, create a restful environment, avoid caffeine and electronics before bed, and relax before sleeping.",
                "what is the best exercise": "The best exercise is one that you enjoy and can do regularly, whether it's walking, running, swimming, or strength training.",
                "how do I stay healthy": "Eat a balanced diet, exercise regularly, get enough sleep, stay hydrated, and manage stress.",
                "what are the benefits of meditation": "Meditation can reduce stress, improve concentration, increase self-awareness, and promote emotional health.",
                "what is the history of the internet": "The internet started as a research project in the 1960s and evolved into a global network with the development of protocols like TCP/IP and the World Wide Web.",
                "how do I create a website": "You can create a website using HTML, CSS, and JavaScript. There are also website builders like WordPress and Wix that make the process easier.",
                "what are the benefits of reading": "Reading can improve your knowledge, concentration, empathy, and mental health.",
                "how do I make new friends": "Be open to meeting new people, join clubs or groups, volunteer, and don't be afraid to start conversations.",
                "what is machine learning": "Machine learning is a subset of artificial intelligence that involves training algorithms to make predictions or decisions based on data.",
                "how do I start investing": "Research different investment options, start with a small amount, diversify your portfolio, and consider consulting a financial advisor.",
                "what is the meaning of a dream": "Dreams are a series of thoughts, images, and sensations occurring in a person's mind during sleep. They can have various meanings depending on the individual.",
                "default": "I'm not sure how to respond to that. Can you ask something else?"
            };

            var response = responses[input.toLowerCase()] || responses["default"];
            return response;
        }
    </script>
</body>
</html>
