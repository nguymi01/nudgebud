import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/widgets/FriendCard/friend_card_bloc.dart';

class FriendCard extends StatefulWidget {
  const FriendCard({super.key, required this.id, required this.selectedFriends, final bool? confirm}):_confirm=confirm??false;

  final String id;
  final List<dynamic> selectedFriends;
  final bool _confirm;
  @override
  State<FriendCard> createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  FriendCardBloc bloc = FriendCardBloc();

  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendCardBloc, FriendCardState>(
      bloc: bloc,
      builder: (BuildContext context, FriendCardState state) {
        if (state is FriendCardStateSelected) {
          return mainView(context, state.checked);
        }
        return mainView(context, widget._confirm);
      },
    );
  }

  Widget mainView(BuildContext context, bool checked) {
    return GestureDetector(
      onTap: () {
        // _toggleCheck();
        if (!checked){
          widget.selectedFriends.add(widget.id);
        }
        else{
          widget.selectedFriends.remove(widget.id);
        }
        bloc.add(FriendCardEventSelect(!checked));
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child:
                checked ? const Icon(Icons.check, color: Colors.green) : null,
          ),
        ),
      ]),
    );
  }
}
