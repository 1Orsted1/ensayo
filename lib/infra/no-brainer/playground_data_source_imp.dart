import 'package:ensayo/domain/no-brainer/i_playground_data_source.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPlaygroundDataSource)
class PlaygroundDataSourceImp implements IPlaygroundDataSource {
  @override
  Future<void> playClick() {
    return SystemSound.play(SystemSoundType.click);
  }
}
