# Keep rules for flutter_gemma / MediaPipe LLM inference.
# MediaPipe references optional proto classes that aren't bundled; R8 must
# not fail on them. Generated from build/.../missing_rules.txt.
-dontwarn com.google.mediapipe.proto.CalculatorProfileProto$CalculatorProfile
-dontwarn com.google.mediapipe.proto.GraphTemplateProto$CalculatorGraphTemplate
-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.Conscrypt$Version
-dontwarn org.conscrypt.Conscrypt
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE

# Keep MediaPipe framework classes used via JNI/reflection by LiteRT-LM.
-keep class com.google.mediapipe.** { *; }
-keep class com.google.protobuf.** { *; }
