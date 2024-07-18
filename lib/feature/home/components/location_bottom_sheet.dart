import 'package:flutter/material.dart';
import 'package:sezin_soft/feature/home/model/location_model.dart';

final class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key, required this.locationModelList});
  final List<LocationModel?> locationModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locationModelList.length,
      itemBuilder: (context, index) {
        final locationModel = locationModelList[index];
        if (locationModel == null) {
          return const SizedBox();
        }
        return Card(
          margin: const EdgeInsets.all(8.0),
          elevation: 4,
          child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  child: Text(
                    locationModel.id.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 77, 77, 77),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'Müşteri Bilgileri\n',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Ad Soyad: ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        TextSpan(
                          text: ' ${locationModel.fullName}\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 94, 94, 94),
                          ),
                        ),
                        const TextSpan(
                          text: 'Telefon: ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        TextSpan(
                          text: '${locationModel.phone}\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 94, 94, 94),
                          ),
                        ),
                        const TextSpan(
                          text: 'Adres: ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        TextSpan(
                          text: '${locationModel.address}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 94, 94, 94),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
