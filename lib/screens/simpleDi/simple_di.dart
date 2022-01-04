import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class SimpleDI extends StatefulWidget {
  const SimpleDI({Key? key}) : super(key: key);

  @override
  _SimpleDIState createState() => _SimpleDIState();
}

class _SimpleDIState extends State<SimpleDI> {
  final injector = ModuleContainer().initialise(Injector());
  @override
  Widget build(BuildContext context) {
    injector.get<SomeService>().doSomething();

    // get an instance of each of the same mapped types
    final instances = injector.getAll<SomeType>();
    print(instances.length); // prints '3'

    // passing in additional arguments when getting an instance
    final instance =
        injector.get<SomeOtherType>(additionalParameters: {'id': 'some-id'});
    print(instance.id); // prints 'some-id'
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple DI'),
      ),
      body: const Center(
        child: Text('Check your console chief'),
      ),
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<Logger>((i) => Logger(), isSingleton: true);
    injector.map<String>((i) => 'https://api.com/', key: 'apiUrl');
    injector.map<SomeService>(
        (i) => SomeService(i.get<Logger>(), i.get<String>(key: 'apiUrl')));

    injector.map<SomeType>((injector) => SomeType('0'));
    injector.map<SomeType>((injector) => SomeType('1'), key: 'One');
    injector.map<SomeType>((injector) => SomeType('2'), key: 'Two');

    injector.mapWithParams<SomeOtherType>((i, p) => SomeOtherType(p['id']));

    return injector;
  }
}

class Logger {
  void log(String message) => print(message);
}

class SomeService {
  final Logger _logger;
  final String _apiUrl;

  SomeService(this._logger, this._apiUrl);

  void doSomething() {
    _logger.log('Doing something with the api at `$_apiUrl`');
  }
}

class SomeType {
  final String id;
  SomeType(this.id);
}

class SomeOtherType {
  final String id;
  SomeOtherType(this.id);
}
