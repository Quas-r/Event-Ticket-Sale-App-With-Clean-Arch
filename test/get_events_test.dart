import 'package:dartz/dartz.dart';
import 'package:event_ticket_sale_app_with_clean_arch/core/usecase/usecase_template.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/entity/event_entity.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/repository/home_repository.dart';
import 'package:event_ticket_sale_app_with_clean_arch/features/home/domain/usecase/get_events_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetEventsUsecase getEventsUsecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    getEventsUsecase = GetEventsUsecase(mockRepository);
  });

  group("Get Events Use Case Tests |", () {
    final List<EventEntity> mockEvents = [
      EventEntity(eventName: "Test1"),
      EventEntity(eventName: "Test2")
    ];

    test('Should get event list from repository', () async {
      when(mockRepository.getEvents())
          .thenAnswer((_) async => Right(mockEvents));
      // Arrange
      final result = await getEventsUsecase.call(NoParams());
      expect(result, Right(mockEvents));

      verify(mockRepository.getEvents());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
