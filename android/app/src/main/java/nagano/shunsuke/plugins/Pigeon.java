// Autogenerated from Pigeon (v0.1.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package nagano.shunsuke.plugins;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import java.util.ArrayList;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings("unused")
public class Pigeon {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ButteryResponse {
    private String responseMessage;
    public String getResponseMessage() { return responseMessage; }
    public void setResponseMessage(String setterArg) { this.responseMessage = setterArg; }

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("responseMessage", responseMessage);
      return toMapResult;
    }
    static ButteryResponse fromMap(HashMap map) {
      ButteryResponse fromMapResult = new ButteryResponse();
      Object responseMessage = map.get("responseMessage");
      fromMapResult.responseMessage = (String)responseMessage;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ButteryRequest {
    private String unit;
    public String getUnit() { return unit; }
    public void setUnit(String setterArg) { this.unit = setterArg; }

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("unit", unit);
      return toMapResult;
    }
    static ButteryRequest fromMap(HashMap map) {
      ButteryRequest fromMapResult = new ButteryRequest();
      Object unit = map.get("unit");
      fromMapResult.unit = (String)unit;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class WifiResponse {
    private String responseMessage;
    public String getResponseMessage() { return responseMessage; }
    public void setResponseMessage(String setterArg) { this.responseMessage = setterArg; }

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("responseMessage", responseMessage);
      return toMapResult;
    }
    static WifiResponse fromMap(HashMap map) {
      WifiResponse fromMapResult = new WifiResponse();
      Object responseMessage = map.get("responseMessage");
      fromMapResult.responseMessage = (String)responseMessage;
      return fromMapResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class WifiRequest {
    private String unit;
    public String getUnit() { return unit; }
    public void setUnit(String setterArg) { this.unit = setterArg; }

    HashMap toMap() {
      HashMap<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("unit", unit);
      return toMapResult;
    }
    static WifiRequest fromMap(HashMap map) {
      WifiRequest fromMapResult = new WifiRequest();
      Object unit = map.get("unit");
      fromMapResult.unit = (String)unit;
      return fromMapResult;
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface ButteryApi {
    ButteryResponse add(ButteryRequest arg);

    /** Sets up an instance of `ButteryApi` to handle messages through the `binaryMessenger` */
    static void setup(BinaryMessenger binaryMessenger, ButteryApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ButteryApi.add", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            HashMap<String, HashMap> wrapped = new HashMap<>();
            try {
              @SuppressWarnings("ConstantConditions")
              ButteryRequest input = ButteryRequest.fromMap((HashMap)message);
              ButteryResponse output = api.add(input);
              wrapped.put("result", output.toMap());
            }
            catch (Exception exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface WifiApi {
    WifiResponse call(WifiRequest arg);

    /** Sets up an instance of `WifiApi` to handle messages through the `binaryMessenger` */
    static void setup(BinaryMessenger binaryMessenger, WifiApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.WifiApi.call", new StandardMessageCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            HashMap<String, HashMap> wrapped = new HashMap<>();
            try {
              @SuppressWarnings("ConstantConditions")
              WifiRequest input = WifiRequest.fromMap((HashMap)message);
              WifiResponse output = api.call(input);
              wrapped.put("result", output.toMap());
            }
            catch (Exception exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static HashMap wrapError(Exception exception) {
    HashMap<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", null);
    return errorMap;
  }
}
