from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Room, Booking

class UserRegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ["id", "username", "email", "password"]

    def create(self, validated_data):
        return User.objects.create_user(**validated_data)

#seriallizers
class RoomSerializer(serializers.ModelSerializer):
    owner_name = serializers.CharField(source="owner.username", read_only=True)

    class Meta:
        model = Room
        fields = "__all__"
        read_only_fields = ["owner"]


class BookingSerializer(serializers.ModelSerializer):
    renter_name = serializers.CharField(source="renter.username", read_only=True)
    room_title = serializers.CharField(source="room.title", read_only=True)

    class Meta:
        model = Booking
        fields = "__all__"
        read_only_fields = ["renter", "status"]