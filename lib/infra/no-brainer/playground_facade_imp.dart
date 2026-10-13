import 'package:ensayo/domain/no-brainer/i_playground_data_source.dart';
import 'package:ensayo/domain/no-brainer/i_playground_facade.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPlaygroundFacade)
class PlaygroundFacadeImp implements IPlaygroundFacade {
  PlaygroundFacadeImp({required this.playgroundDataSource});

  final IPlaygroundDataSource playgroundDataSource;

  @override
  Future<void> playClick() {
    return playgroundDataSource.playClick();
  }
}
