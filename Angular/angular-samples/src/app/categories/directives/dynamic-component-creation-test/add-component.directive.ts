import { Directive, ViewContainerRef, ViewChild, ComponentFactoryResolver } from '@angular/core';
import { InsertableComponent } from './insertable/insertable.component';

@Directive({
  selector: '[appAddComponent]'
})
export class AddComponentDirective {

  @ViewChild(AddComponentDirective, {static: true}) componentHost: AddComponentDirective;

  constructor(public viewContainerRef: ViewContainerRef, private componentFactoryResolver: ComponentFactoryResolver) {

    const componentFactory = this.componentFactoryResolver.resolveComponentFactory(InsertableComponent);
    //const viewContainerRef = this.componentHost.viewContanerRef;

    const componentRef = viewContainerRef.createComponent(componentFactory);
    
   }

}
