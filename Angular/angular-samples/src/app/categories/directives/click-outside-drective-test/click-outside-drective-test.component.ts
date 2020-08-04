import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-click-outside-drective-test',
  templateUrl: './click-outside-drective-test.component.html',
  styleUrls: ['./click-outside-drective-test.component.scss']
})
export class ClickOutsideDrectiveTestComponent implements OnInit {

  constructor() { }

  ngOnInit() {

  }

  callBack() {
    console.info('callback called: clicked outside!');
    alert('Clicked outside!');
  }

}
