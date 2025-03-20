import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String selectedFilter = "All"; // Default selected filter
  Map<int, bool> likedPosts = {}; // Tracks liked posts (Post ID → Liked/Not)
  Map<int, int> likeCounts = {}; // Tracks like counts (Post ID → Like Count)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigates back
          },
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
                    backgroundImage: AssetImage(
                      'assets/hafiz.png',
                    ), // Replace with real image
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
                    onPressed: () {
                      // Edit profile action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Color(0xFFEA4335)),
                    onPressed: () {
                      // Notification action
                    },
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
                postId: 1,
                name: "Saidathul Fatiha",
                timeAgo: "5 min ago",
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                hasImages: true,
              ),
              _buildPostCard(
                postId: 2,
                name: "Hafiz Fauzi",
                timeAgo: "10 min ago",
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                hasImages: false,
              ),
              _buildPostCard(
                postId: 3,
                name: "Shaf Jeffery",
                timeAgo: "15 min ago",
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                hasImages: false,
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEA4335), // Red color
        onPressed: () {
          // Add new post action
        },
        child: Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  // Filter Button Widget
  Widget _buildFilterButton(String title) {
    bool isSelected = selectedFilter == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });
      },
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

  // Post Card Widget with Like Feature
  Widget _buildPostCard({
    required int postId,
    required String name,
    required String timeAgo,
    required String content,
    required bool hasImages,
  }) {
    bool isLiked = likedPosts[postId] ?? false;
    int likeCount = likeCounts[postId] ?? 0;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info & Time
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

            // Post Content
            Text(content, style: TextStyle(fontSize: 14, color: Colors.black)),
            SizedBox(height: 8),

            // Images (if available)
            if (hasImages)
              Row(
                children: [
                  Expanded(
                    child: Container(height: 80, color: Colors.grey[300]),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(height: 80, color: Colors.grey[300]),
                  ),
                ],
              ),
            SizedBox(height: 8),

            // Like & Comment Icons
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      likedPosts[postId] = !isLiked;
                      likeCounts[postId] =
                          isLiked ? likeCount - 1 : likeCount + 1;
                    });
                  },
                ),
                Text(
                  likeCount.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
                  onPressed: () {
                    // Comment action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
