package consent;

import extension.consent.ConsentStatus;
import extension.consent.ConsentUpdateListener;

class MyConsentUpdateListener extends ConsentUpdateListener
{
	public function new() {
		super();
	}
	
	// Note - these callbacks trigger when consent is updated *from some remote server*, not when we set it locally
	
	override public function onConsentInfoUpdated(consentStatus:ConsentStatus):Void {
		trace("Successfully updated consent status from server with status: " + consentStatus.toString());
		
		Main.spamStuff();
		
		// Request consent form right away
		ConsentWrapper.requestConsentForm();
	}
	
	override public function onFailedToUpdateConsentInfo(errorDescription:String):Void {
		trace("Failed to update consent status from server with error: " + errorDescription);
		
		Main.spamStuff();
	}
}