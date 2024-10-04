final class LabClinicasLoader extends AsyncOverlay {
  LabClinicasLader():super(
    id: 0,
    builder:(BuildContext context, AsyncValue<RouteSettings> settings) {
      return Center (
        child: SizedBox(
          width: MediaQuerry.sizeOf(context).width * .8,
          child: LoadingAnimationWidget.inkDrop(
            color: Colors.orange,
            size: 50,
          ),
        ),
      );
    },
  );
}