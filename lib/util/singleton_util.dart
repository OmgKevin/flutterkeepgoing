class TransferDataSingleton {

  static final TransferDataSingleton _instance = TransferDataSingleton.__internal();

  int appVersion;

  factory TransferDataSingleton() {
    return _instance;
  }

  TransferDataSingleton.__internal();
}

final transSingletonData = TransferDataSingleton();