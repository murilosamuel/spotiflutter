abstract class EntityMapper<F, T> {
  T from(F object);
  F to(T object);
}
