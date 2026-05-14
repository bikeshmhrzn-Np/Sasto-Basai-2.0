from django.urls import path
from .views import (
    RegisterView,
    RoomListCreateView,
    RoomDetailView,
    BookingCreateView,
    BookingListView,
)

urlpatterns = [
    path("register/", RegisterView.as_view()),
    path("rooms/", RoomListCreateView.as_view()),
    path("rooms/<int:pk>/", RoomDetailView.as_view()),
    path("bookings/", BookingListView.as_view()),
    path("book-room/", BookingCreateView.as_view()),
]