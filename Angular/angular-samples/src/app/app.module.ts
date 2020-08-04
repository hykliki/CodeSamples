import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CategoriesComponent } from './categories/categories.component';
import { DirectivesComponent } from './categories/directives/directives.component';
import { ClickOutsideDrectiveTestComponent } from './categories/directives/click-outside-drective-test/click-outside-drective-test.component';
import { WelcomeComponent } from './welcome/welcome.component';
import { ClickOutsideDirective } from './categories/directives/click-outside-drective-test/click-outside.directive';
import { ComponentsComponent } from './categories/components/components.component';
import { ContentTestComponent } from './categories/components/content-test/content-test.component';
import { MultipleContentsComponent } from './categories/components/content-test/multiple-contents/multiple-contents.component';
import { DynamicComponentCreationTestComponent } from './categories/directives/dynamic-component-creation-test/dynamic-component-creation-test.component';
import { AddComponentDirective } from './categories/directives/dynamic-component-creation-test/add-component.directive';
import { InsertableComponent } from './categories/directives/dynamic-component-creation-test/insertable/insertable.component';
import { PassingArrayTestComponent } from './categories/components/passing-array-test/passing-array-test.component';
import { ParentComponent } from './categories/components/passing-array-test/parent/parent.component';
import { ChildComponent } from './categories/components/passing-array-test/child/child.component';

@NgModule({
  declarations: [
    AppComponent,
    CategoriesComponent,
    DirectivesComponent,
    ClickOutsideDrectiveTestComponent,
    WelcomeComponent,
    ClickOutsideDirective,
    ComponentsComponent,
    ContentTestComponent,
    MultipleContentsComponent,
    DynamicComponentCreationTestComponent,
    AddComponentDirective,
    InsertableComponent,
    PassingArrayTestComponent,
    ParentComponent,
    ChildComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  entryComponents: [InsertableComponent]
})
export class AppModule { }
