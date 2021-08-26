import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdm/components/direct_components/message_tile_image.dart';
import 'package:pdm/data/models/message.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, this.message}) : super(key: key);

  final Message? message;

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MessageTileImage(
                  message: message!,
                  image: message!.user!.image,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message!.user!.name!,
                      style: TextStyle(
                          fontWeight: message!.read!
                              ? FontWeight.normal
                              : FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(message!.lastText!,
                            style: TextStyle(
                                fontWeight: message!.read!
                                    ? FontWeight.normal
                                    : FontWeight.bold)),
                        Text(
                            " • " +
                                timeago.format(message!.time!, locale: 'pt_BR'),
                            style: TextStyle(
                                fontWeight: message!.read!
                                    ? FontWeight.normal
                                    : FontWeight.bold)),
                        message!.muted!
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.volume_off_rounded,
                                  size: 16,
                                ),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ],
            ),
            message!.read!
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
