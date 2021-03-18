abstract class StorageService{

  Future<int> getShrift();
  void saveShrift(int shrift);

  Future<String> getLang();
  void saveLang(String lang);
}