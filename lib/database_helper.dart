import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('movie.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS reviews (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          movieName TEXT,
          review TEXT,
          rating REAL,
          favouriteCharacter TEXT,
          userEmail TEXT
        )
      ''');
      },
    );
  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE reviews (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      movieName TEXT,
      review TEXT,
      rating REAL,
      favouriteCharacter TEXT,
      userEmail TEXT
    )
    ''');
  }

    Future insertUser(
      String name,
      String email,
      String password,
    ) async {
      final db = await instance.database;

      await db.insert(
        'users',
        {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    }

    Future<bool> loginUser(
      String email,
      String password,
    ) async {
      final db = await instance.database;

      final result = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      return result.isNotEmpty;
    }

    Future<void> addReview(
      String movieName,
      String review,
      double rating,
      String favouriteCharacter,
      String userEmail,
      ) async {

      final db = await instance.database;

      await db.insert(
        'reviews',
        {
          'movieName': movieName,
          'review': review,
          'rating': rating,
          'favouriteCharacter': favouriteCharacter,
          'userEmail': userEmail,
        },
      );
    }

    Future<void> deleteReview(int id) async {
      final db = await instance.database;

      await db.delete(
        'reviews',
        where: 'id = ?',
        whereArgs: [id],
      );
    }

    Future<void> updateReview(
      int id,
      String review,
      double rating,
      String favouriteCharacter,
      ) async {
        final db = await instance.database;

        await db.update(
          'reviews',
          {
            'review': review,
            'rating': rating,
            'favouriteCharacter': favouriteCharacter,
          },
          where: 'id = ?',
          whereArgs: [id],
        );
      }

    Future<List<Map<String, dynamic>>> getUserReviews(
        String email,
      ) async {
        final db = await instance.database;

        return await db.query(
          'reviews',
          where: 'userEmail = ?',
          whereArgs: [email],
          orderBy: 'id DESC',
        );
      }


    Future<Map<String, dynamic>?> getUserByEmail(
      String email,
    ) async {
      final db = await instance.database;

      final result = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );

      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null;
      }
    }

    Future<List<Map<String, dynamic>>> getAllUsers() async {
      final db = await instance.database;

      return await db.query('users');
    }
}