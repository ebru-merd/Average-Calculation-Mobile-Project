import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:not_ortalama_hesaplama/helper/data_helper.dart';
import 'package:not_ortalama_hesaplama/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({super.key, required this.onElemanCikarildi});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              'Lütfen Ders Ekleyin',
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
