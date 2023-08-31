import uuid
from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet


class Door(models.Model):
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE)
    qr = models.CharField(max_length=20, unique=True, blank=True, editable=False)
    name = models.CharField(max_length=50)
    profinet_name = models.CharField(max_length=100)

    class Direction(models.TextChoices):
        FRONT = "FRONT", "front"
        BACK = "BACK", "back"

    direction = models.CharField(choices=Direction.choices, default=None, max_length=20)

    class Section(models.TextChoices):
        NETWORK = "NETWORK", "IT Network"
        PS = "PS", "Powe supply"
        FE = "FE", "Factory Edge Server"

    section = models.CharField(choices=Section.choices, default=None, max_length=20)

    # class Meta:
    #     unique_together = ('name', 'cabinet')

    def save(self, *args, **kwargs):
        self.profinet_name = str(self.cabinet.profinet_name) + str(self.name)
        doors = Door.objects.all()
        condition = True
        # self.qr = uuid.uuid4().hex[:20]
        generatedqr = uuid.uuid4().hex[:20]
        if doors:
            for door in doors:
                while condition:
                    if generatedqr == door.qr:
                        generatedqr = uuid.uuid4().hex[:20]
                        condition = True
                    else:
                        condition = False

        self.qr = generatedqr
        # print(generatedqr)
        super(Door, self).save(*args, **kwargs)
