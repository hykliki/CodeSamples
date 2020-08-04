import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { CategoriesComponent } from './categories/categories.component';
import { compileBaseDefFromMetadata } from '@angular/compiler';
import { DirectivesComponent } from './categories/directives/directives.component';
import { ClickOutsideDrectiveTestComponent } from './categories/directives/click-outside-drective-test/click-outside-drective-test.component';
import { WelcomeComponent } from './welcome/welcome.component';
import { ComponentsComponent } from './categories/components/components.component';
import { ContentTestComponent } from './categories/components/content-test/content-test.component';
import { DynamicComponentCreationTestComponent } from './categories/directives/dynamic-component-creation-test/dynamic-component-creation-test.component';
import { PassingArrayTestComponent } from './categories/components/passing-array-test/passing-array-test.component';


const routes: Routes = [
  {
    path: '',
    component: WelcomeComponent
  },
  {
    path: 'categories',
    component: CategoriesComponent
  },
  {
    path: 'categories/directives',
    component: DirectivesComponent
  },
  {
    path: 'categories/components',
    component: ComponentsComponent
  },

  {
    path: 'categories/directives/click-outside-test',
    component: ClickOutsideDrectiveTestComponent
  },
  {
    path: 'categories/components/ng-content-test',
    component: ContentTestComponent
  },
  {
    path: 'categories/directives/dynamic-component-creation-test',
    component: DynamicComponentCreationTestComponent
  },
  {
    path: 'categories/components/passing-array-test',
    component: PassingArrayTestComponent
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
