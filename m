Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358FD42AF2
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Jun 2019 17:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409346AbfFLPas (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Jun 2019 11:30:48 -0400
Received: from mail-eopbgr720118.outbound.protection.outlook.com ([40.107.72.118]:53120
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405706AbfFLPas (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 11:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUrwkpVESSLKyCeZDDZlL9AXbZ8MhVvp0Lp1Lss1JM8=;
 b=KgcleaNfgku22xKbdVjlRM5iZComqLS6U1fF2VGkPdT7YASuUSxkgtmhW6zVvxFYoBfjdY1tpDB7MOV5lYJuck8UYMHku5GA6lY8ZGWDYkyCKY07YVS+gMcUXNPddWmoPtlHtzbfvccWn7eeXrHI+CUIEN/XnnRIoJ6lckBhyq4=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5251.namprd07.prod.outlook.com (10.167.241.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Wed, 12 Jun 2019 15:30:43 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 15:30:43 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
CC:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ken Sloat <KSloat@aampglobal.com>
Subject: RE: [PATCH v1 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Topic: [PATCH v1 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Index: AQHVIS/MMKNdMTqzC02O6HgdHPA8iKaYI2QAgAAAH6A=
Date:   Wed, 12 Jun 2019 15:30:43 +0000
Message-ID: <BL0PR07MB4115B38E41BE91E045C04F6AADEC0@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <20190612150154.16778-1-ksloat@aampglobal.com>
 <8af0794a-327d-7144-609f-0c56422e92ec@roeck-us.net>
In-Reply-To: <8af0794a-327d-7144-609f-0c56422e92ec@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c74a636-3378-46bf-2c7d-08d6ef4aef07
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5251;
x-ms-traffictypediagnostic: BL0PR07MB5251:
x-microsoft-antispam-prvs: <BL0PR07MB52517E6F07FE3C45CD31E5CBADEC0@BL0PR07MB5251.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(189003)(199004)(13464003)(71200400001)(305945005)(2501003)(486006)(5660300002)(476003)(7736002)(72206003)(71190400001)(11346002)(446003)(14454004)(6246003)(86362001)(107886003)(110136005)(80792005)(256004)(74316002)(54906003)(33656002)(4326008)(81166006)(52536014)(81156014)(6436002)(6116002)(102836004)(53936002)(8936002)(66066001)(2906002)(8676002)(186003)(64756008)(53546011)(6506007)(25786009)(229853002)(66946007)(26005)(66556008)(66446008)(66476007)(76176011)(68736007)(73956011)(9686003)(99286004)(15650500001)(498600001)(55016002)(7696005)(14444005)(76116006)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5251;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kTJJWtM5PJNDflrYib8KLPWdiEhgGIabdgknyx3IbDt0/B1xRwNS4Az8Bskth3grwU8AwwUttbPxr9/sQRUzxSc6l1SoLrxWZ75kIyzYA144CO/2mvHAWVfNP0R5IW7qa4S+lDHyqr6olPW1W1Aq/L1169mMwyzikwtrKhzF8C9F/mpRTae1y5HtLA76KrH4Hwrc2ORcvKXIJ47sNYxJdTiQYXZcluN/RTURSeu8GguR5KBZrKtnOXf6x//Km4Ry/qWXabPUlR6hRsIJvrEnlxhGpvN+rMgNTzeQborivgHZkyFed40nN6PFtXaXHaw+OaR0BXjw7uk8hA6kJX5R839KSGfOYG0E9BEkNZE7aBm/UIvtLmwhOUHL8KIDFFEM5Ol1FMQJo7jTcJU4XjAzj3h6E0uGH8+blhpyA+mVeBU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c74a636-3378-46bf-2c7d-08d6ef4aef07
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 15:30:43.4358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5251
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: BL0PR07MB4115.namprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-TransportTrafficSubType: 
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 100.3.71.115
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-transporttrafficsubtype: 
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: BL0PR07MB5251.namprd07.prod.outlook.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEyLCAyMDE5IDExOjI0IEFNDQo+IFRvOiBLZW4gU2xv
YXQgPEtTbG9hdEBhYW1wZ2xvYmFsLmNvbT47IG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbQ0K
PiBDYzogYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IGx1ZG92aWMuZGVzcm9jaGVzQG1p
Y3JvY2hpcC5jb207DQo+IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IHdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEv
MV0gd2F0Y2hkb2c6IGF0bWVsOiBhdG1lbC1zYW1hNWQ0LXdkdDogRGlzYWJsZQ0KPiB3YXRjaGRv
ZyBvbiBzeXN0ZW0gc3VzcGVuZA0KPiANCj4gW1RoaXMgaXMgYW4gRVhURVJOQUwgRU1BSUxdDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IA0KPiBPbiA2LzEyLzE5IDg6MDIg
QU0sIEtlbiBTbG9hdCB3cm90ZToNCj4gPiBGcm9tOiBLZW4gU2xvYXQgPGtzbG9hdEBhYW1wZ2xv
YmFsLmNvbT4NCj4gPg0KPiA+IEN1cnJlbnRseSwgdGhlIGF0bWVsLXNhbWE1ZDQtd2R0IGNvbnRp
bnVlcyB0byBydW4gYWZ0ZXIgc3lzdGVtIHN1c3BlbmQuDQo+ID4gVW5sZXNzIHRoZSBzeXN0ZW0g
cmVzdW1lcyB3aXRoaW4gdGhlIHdhdGNoZG9nIHRpbWVvdXQgcGVyaW9kIHNvIHRoZQ0KPiA+IHVz
ZXJzcGFjZSBjYW4ga2ljayBpdCwgdGhlIHN5c3RlbSB3aWxsIGJlIHJlc2V0LiBUaGlzIGNoYW5n
ZSBkaXNhYmxlcw0KPiA+IHRoZSB3YXRjaGRvZyBvbiBzdXNwZW5kIGlmIGl0IGlzIGFjdGl2ZSBh
bmQgcmUtZW5hYmxlcyBvbiByZXN1bWUuDQo+ID4gVGhlc2UgYWN0aW9ucyBvY2N1ciBkdXJpbmcg
dGhlIGxhdGUgYW5kIGVhcmx5IHBoYXNlcyBvZiBzdXNwZW5kIGFuZA0KPiA+IHJlc3VtZSByZXNw
ZWN0aXZlbHkgdG8gbWluaW1pemUgY2hhbmNlcyB3aGVyZSBhIGxvY2sgY291bGQgb2NjdXIgd2hp
bGUNCj4gPiB0aGUgd2F0Y2hkb2cgaXMgZGlzYWJsZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLZW4gU2xvYXQgPGtzbG9hdEBhYW1wZ2xvYmFsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZl
cnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYyB8IDMxDQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvc2FtYTVkNF93
ZHQuYw0KPiA+IGIvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jIGluZGV4IDExMTY5NTIy
M2FhZS4uODRlYjRkYjIzOTkzDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRv
Zy9zYW1hNWQ0X3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5j
DQo+ID4gQEAgLTI4MCw2ICsyODAsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQNCj4gc2FtYTVkNF93ZHRfb2ZfbWF0Y2hbXSA9IHsNCj4gPiAgIE1PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHNhbWE1ZDRfd2R0X29mX21hdGNoKTsNCj4gPg0KPiA+ICAgI2lmZGVmIENPTkZJR19Q
TV9TTEVFUA0KPiA+ICtzdGF0aWMgaW50IHNhbWE1ZDRfd2R0X3N1c3BlbmRfbGF0ZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpIHsNCj4gPiArICAgICBzdHJ1Y3Qgc2FtYTVkNF93ZHQgKndkdDsNCj4gPiAr
DQo+ID4gKyAgICAgd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsgICAg
IGlmICh3YXRjaGRvZ19hY3RpdmUoJndkdC0+d2RkKSkNCj4gPiArICAgICAgICAgICAgIHNhbWE1
ZDRfd2R0X3N0b3AoJndkdC0+d2RkKTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gICBzdGF0aWMgaW50IHNhbWE1ZDRfd2R0X3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gICB7DQo+ID4gICAgICAgc3RydWN0IHNhbWE1ZDRfd2R0ICp3ZHQgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsgQEAgLTI5MywxMA0KPiA+ICszMDUsMjUgQEAgc3RhdGljIGlu
dCBzYW1hNWQ0X3dkdF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gICAgICAg
cmV0dXJuIDA7DQo+ID4gICB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHNhbWE1ZDRfd2R0X3Jl
c3VtZV9lYXJseShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gPiArICAgICBzdHJ1Y3Qgc2FtYTVk
NF93ZHQgKndkdDsNCj4gPiArDQo+ID4gKyAgICAgd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
DQo+ID4gKw0KPiA+ICsgICAgIGlmICh3YXRjaGRvZ19hY3RpdmUoJndkdC0+d2RkKSkNCj4gPiAr
ICAgICAgICAgICAgIHNhbWE1ZDRfd2R0X3N0YXJ0KCZ3ZHQtPndkZCk7DQo+ID4gKw0KPiA+ICsg
ICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+IC1zdGF0aWMgU0lN
UExFX0RFVl9QTV9PUFMoc2FtYTVkNF93ZHRfcG1fb3BzLCBOVUxMLA0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgc2FtYTVkNF93ZHRfcmVzdW1lKTsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBkZXZfcG1fb3BzIHNhbWE1ZDRfd2R0X3BtX29wcyA9IHsNCj4gPiArICAgICBTRVRfU1lTVEVN
X1NMRUVQX1BNX09QUyhOVUxMLCBzYW1hNWQ0X3dkdF9yZXN1bWUpDQo+ID4gKyAgICAgU0VUX0xB
VEVfU1lTVEVNX1NMRUVQX1BNX09QUyhzYW1hNWQ0X3dkdF9zdXNwZW5kX2xhdGUsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHNhbWE1ZDRfd2R0X3Jlc3VtZV9lYXJseSkNCj4gDQo+IEkgZG9u
J3QgdGhpbmsgeW91IG5lZWQgYm90aCBzYW1hNWQ0X3dkdF9yZXN1bWUoKSBhbmQNCj4gc2FtYTVk
NF93ZHRfcmVzdW1lX2Vhcmx5KCkuDQoNClllcyBJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhhdCBi
dXQgd2FudGVkIGZlZWRiYWNrIG9uIHRoZSBzdWJqZWN0IGZpcnN0Lg0KSSBjYW4gc2ltcGx5IGNv
bnNvbGlkYXRlIHRoZSBzdGF0ZW1lbnRzLCB0aGUgc2FtYTVkNF93ZHRfaW5pdCBzdGF0ZW1lbnQN
CnByZXNlbnQgbm93IHNob3VsZCBwcm9iYWJseSBiZSBjYWxsZWQgZmlyc3QgYW55d2F5cywgc28g
c29tZXRoaW5nIGxpa2UgdGhpcw0Kd2l0aGluIHJlc3VtZV9lYXJseToNCg0Kc3RydWN0IHNhbWE1
ZDRfd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7IA0KDQpzYW1hNWQ0X3dkdF9pbml0KHdkdCk7
DQoNCmlmICh3YXRjaGRvZ19hY3RpdmUoJndkdC0+d2RkKSkNCiAgICAgICAgc2FtYTVkNF93ZHRf
c3RhcnQoJndkdC0+d2RkKTsNCg0KcmV0dXJuIDA7DQoNCklmIHRoYXQgc291bmRzIGdvb2QgSSB3
aWxsIHJlc3VibWl0Lg0KDQo+IEd1ZW50ZXINCj4gDQo+ID4gK307DQo+ID4NCj4gPiAgIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNhbWE1ZDRfd2R0X2RyaXZlciA9IHsNCj4gPiAgICAg
ICAucHJvYmUgICAgICAgICAgPSBzYW1hNWQ0X3dkdF9wcm9iZSwNCj4gPg0KDQpUaGFua3MsDQpL
ZW4gU2xvYXQNCg0K
