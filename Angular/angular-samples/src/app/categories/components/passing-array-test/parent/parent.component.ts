import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-parent',
  templateUrl: './parent.component.html',
  styleUrls: ['./parent.component.scss']
})
export class ParentComponent implements OnInit {
  items: string[];

  constructor() { }

  ngOnInit() {
    this.items = new Array<string>();
    this.items.push('item1');
  }

  onClick() {
    this.items.push('added item');
  }
 
}
