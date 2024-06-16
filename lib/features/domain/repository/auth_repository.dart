import '../entities/auth_user.dart';

// Think of the Repository as a tool that you can perform
// CRUD operations (Create, Read, Update, Delete) on.
// Repositories in the domain layer do not specify how the
// data is actually stored or retrieved, they just define
// what you can do with the data.

abstract class AuthRepository {
  // Single Responsibility: Each Repository has a single responsibility,
  // which is to provide data for a specific type of entity.

  Stream<AuthUser> get authUser;

  Future<AuthUser> signUp({
    required String email,
    required String password,
  });

  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

}
