import { Component, OnInit } from '@angular/core';
import { NavController, AlertController } from '@ionic/angular';

@Component({
  selector: 'app-pago',
  templateUrl: './pago.page.html',
  styleUrls: ['./pago.page.scss'],
})
export class PagoPage implements OnInit {

  selectedDate: string = '';

  constructor(
    private navCtrl: NavController,
    private alertCtrl: AlertController
  ) { }

  ngOnInit() {
    this.selectedDate = '17/08/2023';
  }


  ok() {
    console.log('Datos de tarjeta completados');
  }

  async confirmarPago() {
    const alert = await this.alertCtrl.create({
      header: 'Reserva confirmada',
      message: '¡Su reserva ha sido confirmada exitosamente!',
      buttons: ['OK']
    });

    await alert.present();
  }

  cancel() {
    this.navCtrl.navigateBack('/home');
  }
}

