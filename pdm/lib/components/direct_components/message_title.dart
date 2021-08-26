import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTitle extends StatelessWidget {
  const MessageTitle({Key? key, required this.solicitations}) : super(key: key);

  final int solicitations;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mensagens',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            solicitations == 0
                ? Container()
                : InkWell(
                    onTap: () {},
                    child: Text(
                      "$solicitations Solicitações",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
