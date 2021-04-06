import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/entities/user.dart';
import 'package:flutter/material.dart';

class HomeAvatar extends StatelessWidget {
  const HomeAvatar({
    Key key,
    @required this.user,
    @required this.onLogout,
  }) : super(key: key);

  final User user;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 56.0,
            backgroundColor: Theme.of(context).accentColor,
            child: CircleAvatar(
              radius: 55.0,
              backgroundColor: Colors.white,
              child: CachedNetworkImage(
                imageUrl: user.avatarURL,
                imageBuilder: (_, imageProvider) => CircleAvatar(
                  radius: 48.0,
                  backgroundImage: imageProvider,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.0),
          OutlinedButton(
            onPressed: onLogout,
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
