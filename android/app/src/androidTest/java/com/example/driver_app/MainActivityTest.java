package com.example.driver_app;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.integration_test.FlutterRunnerTest;
import org.unit.Rule;
import org.unit.runner.RunWith;
import com.example.driver_app.MainActivity;

@RunWith(FlutterRunnerTest.class)
public class MainActivityTest {
  @Rule
  public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class);
}