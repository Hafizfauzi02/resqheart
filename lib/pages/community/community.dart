import 'package:flutter/material.dart';


class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String selectedFilter = "All";
  Map<int, bool> likedPosts = {};
  Map<int, int> likeCounts = {};
  Map<int, List<String>> postComments = {};
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "COMMUNITY AND SUPPORT",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/hafiz.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hafiz Fauzi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "10 Posts    200 Followers",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Color(0xFFEA4335)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Color(0xFFEA4335)),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search here...",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Browse By Title
              Text(
                "Browse By",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Browse By Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFilterButton("All"),
                  SizedBox(width: 8),
                  _buildFilterButton("Latest"),
                  SizedBox(width: 8),
                  _buildFilterButton("My Post"),
                ],
              ),
              SizedBox(height: 16),

              // List of Posts
              _buildPostCard(
                1,
                "Saidathul Fatiha",
                "5 min ago",
                "Lorem ipsum dolor sit amet.",
                true,
              ),
              _buildPostCard(
                2,
                "Hafiz Fauzi",
                "10 min ago",
                "Lorem ipsum dolor sit amet.",
                false,
              ),
              _buildPostCard(
                3,
                "Shaf Jeffery",
                "15 min ago",
                "Lorem ipsum dolor sit amet.",
                false,
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEA4335),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  // Filter Button Widget
  Widget _buildFilterButton(String title) {
    bool isSelected = selectedFilter == title;
    return GestureDetector(
      onTap: () => setState(() => selectedFilter = title),
      child: Container(
        width: 105,
        height: 45,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEA4335) : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Post Card Widget
  Widget _buildPostCard(
    int postId,
    String name,
    String timeAgo,
    String content,
    bool hasImages,
  ) {
    bool isLiked = likedPosts[postId] ?? false;
    int likeCount = likeCounts[postId] ?? 0;
    List<String> comments = postComments[postId] ?? [];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  timeAgo,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(content, style: TextStyle(fontSize: 14, color: Colors.black)),
            if (hasImages) Container(height: 80, color: Colors.grey[300]),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                  onPressed:
                      () => setState(() {
                        likedPosts[postId] = !isLiked;
                        likeCounts[postId] =
                            isLiked ? likeCount - 1 : likeCount + 1;
                      }),
                ),
                Text(
                  likeCount.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline, color: Colors.black),
                      SizedBox(width: 4),
                      Text(
                        comments.length.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  onPressed: () => _showCommentDialog(postId),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Comment Dialog
  void _showCommentDialog(int postId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            List<String> comments = postComments[postId] ?? [];

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 400,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Comments",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children:
                            comments
                                .map(
                                  (comment) => ListTile(title: Text(comment)),
                                )
                                .toList(),
                      ),
                    ),
                    TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: "Write a comment...",
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: Colors.red),
                          onPressed: () {
                            setState(
                              () => comments.add(commentController.text),
                            );
                            postComments[postId] = comments;
                            commentController.clear();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

