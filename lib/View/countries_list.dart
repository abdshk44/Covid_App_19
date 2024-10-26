import 'package:flutter/material.dart';
import 'package:ovid_app/Services/states_services.dart';
import 'package:ovid_app/View/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchcountroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: searchcountroller,
              decoration: InputDecoration(
                hintText: 'Search with countries name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
              ),
            ),
          ),
          Expanded(child: FutureBuilder(
              future: statesServices.countriesListApi(),
              builder: (context ,AsyncSnapshot<List<dynamic>> snapshot){
                if(!snapshot.hasData){
                  return  ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context,index){
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                          child:Column(
                            children: [
                              ListTile(

                                title: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        );

                      });

                }else{
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                      String name = snapshot.data![index]["country"];

                      if(searchcountroller.text.isEmpty){
                        return Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      name: snapshot.data![index]['country'],
                                      image: snapshot.data![index]['countryInfo']['flag'],
                                      totalCases: snapshot.data![index]['cases'] ?? 0,
                                      todayRecovered: snapshot.data![index]['todayRecovered'] ?? 0,
                                      test: snapshot.data![index]['tests'] ?? 0,
                                      totalDeaths: snapshot.data![index]['deaths'] ?? 0,
                                      critical: snapshot.data![index]['critical'] ?? 0,
                                      active: snapshot.data![index]['active'] ?? 0,
                                    ),
                                  ),
                                );
                                ;
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(snapshot.data![index]["cases"].toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    )),
                              ),
                            )
                          ],
                        );

                      }else if(name.toLowerCase().contains(searchcountroller.text.toLowerCase())){
                        return Column(
                          children: [
                            InkWell(
                              onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                name: snapshot.data![index]['country'],
                                image: snapshot.data![index]['countryInfo']['flag'],
                                totalCases: snapshot.data![index]['cases'] ?? 0,
                                todayRecovered: snapshot.data![index]['todayRecovered'] ?? 0,
                                test: snapshot.data![index]['tests'] ?? 0,
                                totalDeaths: snapshot.data![index]['deaths'] ?? 0,
                                critical: snapshot.data![index]['critical'] ?? 0,
                                active: snapshot.data![index]['active'] ?? 0,
                              ),
                            ),
                          );
                          ;
                        },
                              child: ListTile(
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(snapshot.data![index]["cases"].toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    )),
                              ),
                            )
                          ],
                        );
                      }else{
                        return Container();
                      }

                      });
                }


          }))
        ],
      ),
    );
  }
}
