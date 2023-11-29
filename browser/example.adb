with Web.DOM.Event_Listeners;
with Web.DOM.Events;
with Web.Window;
with Web.XHR.Requests;
with WASM.Console;

package body Example is
   type Listener is
   limited new Web.DOM.Event_Listeners.Event_Listener with null record;

   overriding procedure Handle_Event
     (Self : in out Listener; Event : in out Web.DOM.Events.Event'Class);

   L   : aliased Listener;
   xhr : Web.XHR.Requests.XML_Http_Request;

   overriding procedure Handle_Event
     (Self : in out Listener; Event : in out Web.DOM.Events.Event'Class)
   is
      use type Web.XHR.Requests.State;
   begin
      if xhr.Get_Ready_State = Web.XHR.Requests.DONE then
         WASM.Console.Log (xhr.Get_Response_Text);
      end if;
   end Handle_Event;

   procedure Initialize_Example is
   begin
      xhr := Web.XHR.Requests.Constructors.New_XML_Http_Request;
      xhr.Open ("GET", "https://httpbin.org/anything");
      xhr.Send ("");
      xhr.Add_Event_Listener ("readystatechange", L'Access);
   end Initialize_Example;

begin
   Initialize_Example;
end Example;
