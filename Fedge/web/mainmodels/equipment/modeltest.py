from django.db import models

class TestP(models.Model):
    attrp3 = models.CharField(max_length=16,editable=True, unique=False)
    class Meta:
        pass
class Test(models.Model):
    attr1 =models.CharField(max_length=16,editable=True, unique=False)
    attr2 = models.CharField(max_length=16,editable=True, unique=True)
    attr3 = models.ForeignKey(TestP, on_delete=models.CASCADE)
    attr4 = models.CharField(max_length=16,editable=False,unique=False)

    def save(self, *args, **kwargs):
        self.attr4=self.attr3.attrp3

        super(Test, self).save(*args, **kwargs)
    class Meta:
        unique_together = ('attr1','attr4')
    
class Child(Test):
    childattr1 = models.CharField(max_length=16,editable=True, unique=False)

    def save(self, *args, **kwargs):
        self.attr1 = self.childattr1
        return super().save(*args, **kwargs)
    class Meta:
        pass