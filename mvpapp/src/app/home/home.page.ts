import { Component } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private navCtrl: NavController) { }

  goToFechaPage(roomType: string) {
    console.log('Room selected:', roomType);
    this.navCtrl.navigateForward('/fecha');
  }
}