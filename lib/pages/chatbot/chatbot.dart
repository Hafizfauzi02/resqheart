import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();
  bool showInitialUI = true; // Controls greeting and suggestion buttons

  void sendMessage(String message) {
    if (message.isEmpty) return;

    setState(() {
      if (showInitialUI) showInitialUI = false; // Remove greeting UI
      messages.add({"text": message, "isUser": true});
    });

    messageController.clear();

    // Simulating bot response after a delay
    Future.delayed(Duration(milliseconds: 500), () {
      botResponse();
    });
  }

  void botResponse() {
    if (!mounted) return; // Ensure widget is still active before updating UI

    setState(() {
      messages.add({
        "text":
            "Hi! I'm your personal assistant. How can I assist you today? 😊",
        "isUser": false,
      });
    });
  }

  Widget suggestedChats() {
    List<String> suggestions = ["Suggest exercise", "Advice on symptoms"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          suggestions.map((text) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: () => sendMessage(text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Text(text),
                    SizedBox(width: 1),
                    Icon(
                      Icons.arrow_outward,
                      size: 16,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            
            Image.asset(
              "assets/chatbot_icon.png", // Ensure this asset exists
              height: 24,
            ),
            SizedBox(width: 10),
            Text("HeartAssist", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: Column(
        children: [
          if (showInitialUI) ...[
            Expanded(
              child: Center(
                child: Text(
                  "Hi, I’m your personal Health Assistant",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: suggestedChats(),
            ),
          ] else
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool isUser = messages[index]["isUser"];
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[300] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        messages[index]["text"],
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => sendMessage(messageController.text),
                  child: Icon(Icons.send,color: Colors.white,),
                  backgroundColor:  const Color(0xFF364FF5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
