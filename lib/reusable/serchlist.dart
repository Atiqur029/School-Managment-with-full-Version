class Serch{
  static final list=[
    "Atiqur Rhman",
    "Atiar Rahman",
    "Rakib",
    "Riad",


  ];
  static List<String> getSerch(String query){

    List<String>match=[];
    match.addAll(list);
    match.retainWhere((element) => element.toLowerCase().contains(query));
    return match;

  }
}