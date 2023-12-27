import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/entity/event_details_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/repository/events_repository.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/events/domain/usecase/get_event_details_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  late GetEventDetailsUsecase getEventDetailsUsecase;
  late MockEventsRepository mockRepository;

  setUp(() {
    mockRepository = MockEventsRepository();
    getEventDetailsUsecase = GetEventDetailsUsecase(mockRepository);
  });

  group("Get Event Details Use Case Tests |", () {
    Map<String, dynamic> json = {
      "12345": [
        {
          "eventName": "Taylor Swift",
          "eventImage": "assets/events/taylor_swift.png",
          "eventSubDetails": [
            {
              "eventParticularId": "1",
              "eventDate": "26.03.2024",
              "eventLocation": "Melbourne Cricket Ground (MCG) Melbourne",
              "eventTime": "12.00 PM",
              "eventPrice": "1000"
            }
          ]
        }
      ]
    };
    final List<EventDetailsEntity> mockEventDetails = [
      EventDetailsEntity.fromJson(json),
      EventDetailsEntity()
    ];

    test('Should get event details from repository', () async {
      when(mockRepository.getEventDetails("12345"))
          .thenAnswer((_) async => Right(mockEventDetails[0]));
      // Arrange
      final result = await getEventDetailsUsecase.call("12345");
      expect(result, Right(mockEventDetails[0]));

      verify(mockRepository.getEventDetails("12345"));
      verifyNoMoreInteractions(mockRepository);
    });
    test('Should get empty event', () async {
      when(mockRepository.getEventDetails("1"))
          .thenAnswer((_) async => Right(mockEventDetails[1]));
      // Arrange
      final result = await getEventDetailsUsecase.call("1");
      expect(result, Right(mockEventDetails[1]));

      verify(mockRepository.getEventDetails("1"));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
