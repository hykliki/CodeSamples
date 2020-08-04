import { Component, OnInit, ComponentFactoryResolver, ViewChild } from '@angular/core';
import { InsertableComponent } from './dynamic-component-creation-test/insertable/insertable.component';
import { AddComponentDirective } from './dynamic-component-creation-test/add-component.directive';

@Component({
  selector: 'app-directives',
  templateUrl: './directives.component.html',
  styleUrls: ['./directives.component.scss']
})
export class DirectivesComponent implements OnInit {
 constructor() {}

  ngOnInit() {
  }

  onClick() {
    console.info("clicked");
  }

}
