import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-fecha',
  templateUrl: './fecha.page.html',
  styleUrls: ['./fecha.page.scss'],
})
export class FechaPage implements OnInit {

  selectedDate: string = '';

  constructor() { }

  ngOnInit() {
  }

  onDateChange(event: any) {
    this.selectedDate = event.detail.value;
  }

  cancelDate() {
    this.selectedDate = '';
  }

  confirmDate() {
    console.log('Fecha seleccionada:', this.selectedDate);
    
  }
}