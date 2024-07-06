package com.wgalvao.udemy.karate.users;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:features/users")
public class UsersTestRunner {
}