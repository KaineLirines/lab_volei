// sealed = Classe selada, não pode ser extendida, quantidade de classe filhas pré-definidas
sealed class Either<L, R> {}

class Left<L, R> extends Either<L, R>{
  final L value;
  Left(this.value);
}

class Right<L, R> extends Either<L, R>{
  final R value;
  Right(this.value);
}