import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InvitationsContainer extends StatefulWidget {
  const InvitationsContainer({super.key});

  @override
  State<InvitationsContainer> createState() => _InvitationsContainerState();
}

class _InvitationsContainerState extends State<InvitationsContainer> {
  final List _invitations = [];

  @override
  Widget build(BuildContext context) {
    return GroupContainer(
      child: _invitations.isEmpty
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
                child: Text(
                  'No invitations',
                  style: CustomTextStyle.bodyMedium(context,
                      color: CustomColor.bodyText(context, opacity: 0.5)),
                ),
              ),
          )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _invitations.length,
              itemBuilder: (context, index) {
                return Placeholder();
              }),
    );
  }
}
