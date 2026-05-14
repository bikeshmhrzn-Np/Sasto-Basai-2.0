from rest_framework import generics, permissions
from django.contrib.auth.models import User
from .models import Room, Booking
from .serializers import UserRegisterSerializer, RoomSerializer, BookingSerializer

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserRegisterSerializer


class RoomListCreateView(generics.ListCreateAPIView):
    queryset = Room.objects.all().order_by("-created_at")
    serializer_class = RoomSerializer

    def perform_create(self, serializer):
        user = User.objects.first()
        serializer.save(owner=user)


class RoomDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Room.objects.all()
    serializer_class = RoomSerializer


class BookingCreateView(generics.CreateAPIView):
    queryset = Booking.objects.all()
    serializer_class = BookingSerializer

    def perform_create(self, serializer):
        user = User.objects.first()
        serializer.save(renter=user)


class BookingListView(generics.ListAPIView):
    queryset = Booking.objects.all().order_by("-created_at")
    serializer_class = BookingSerializer