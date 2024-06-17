import pandas as pd
from django.core.management.base import BaseCommand
from mapapp.models import Marker

class Command(BaseCommand):
    help = 'Import markers from an Excel file'

    def add_arguments(self, parser):
        parser.add_argument('excel_file', type=str, help='Path to the Excel file')

    def handle(self, *args, **kwargs):
        excel_file = kwargs['excel_file']
        df = pd.read_excel(excel_file)

        for index, row in df.iterrows():
            name = row['name']
            lat = row['lat']
            lng = row['lng']
            
            Marker.objects.create(name=name, lat=lat, lng=lng)
            self.stdout.write(self.style.SUCCESS(f'Marker "{name}" added successfully'))