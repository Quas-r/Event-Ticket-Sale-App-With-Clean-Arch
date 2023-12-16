
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

abstract class Usecase<L,R,P>{

}

@injectable
class NoParams extends Equatable{

  @override
  List<Object> get props => [];
}