/**
* ForgeBox API Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "ForgeBox SDK", function(){
			
			beforeEach(function( currentSpec ){
				fb = new forgeboxsdk.models.ForgeBox();
			});

			it( "can build the SDK with defaults", function(){
				expect(	fb.getVersion() ).toBe( "v1" );
			});

			it( "can retrieve entry types", function(){
				var types = fb.getTypes();
				//debug( types );
				expect(	types ).toBeArray()
					.notToBeEmpty();
			});

			it( "can retrieve entries with defaults", function(){
				var entries = fb.getEntries();
				//debug( entries );
				expect(	entries ).toBeStruct()
					.toHaveKey( "count" )
					.toHaveKey( "results" );
				expect(	entries.results ).toBeArray();
			});

			it( "can retrieve an entry", function(){
				var entry = fb.getEntry( "coldbox" );
				expect(	entry ).toBeStruct();
				expect(	entry.slug ).toBe( "coldbox" );
			});

			it( "can ping the service", function(){
				var ping = fb.ping();
				expect(	ping ).toBe( "Welcome to the ForgeBox IO API version 1.0.0" );
			});

			it( "can retrieve an entry type", function(){
				var type = fb.getType( "mvc" );
				expect(	type.typeSlug ).toBe( "mvc" );
			});

			it( "can verify slugs", function(){
				var verify = fb.isSlugAvailable( "verifyit" );
				expect(	verify ).toBeBoolean();
			});

		});
	}
	
}