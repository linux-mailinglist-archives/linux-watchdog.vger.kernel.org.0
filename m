Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19266606A
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2019 22:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfGKULD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jul 2019 16:11:03 -0400
Received: from mail-eopbgr130073.outbound.protection.outlook.com ([40.107.13.73]:47606
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728194AbfGKULD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jul 2019 16:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ARqDWiKKjPy+xku8GSNfnyZX9lnSmEypw0wIO/fPnk=;
 b=nipvgXgX5R1kdfZrtRLpUDKmmmN4DTbzDfQQgDvnlei39tFmlZXVMsCsoKxVqIYsp0JcvLsARMsJx6zNhJnjPWFDiqmgLxn6OAv1t/U4tWTdheyOTrSPCPajDWsQy3XuPo0iKFvTK/ez9QCCk0dxC+/vpjAWBH7iBKQUCBUua04=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB6018.eurprd06.prod.outlook.com (20.178.112.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 20:10:57 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.022; Thu, 11 Jul 2019
 20:10:56 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Topic: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVNpIpwwoCbUKMfU6U33+0Mj8DZ6bCupCAgAA6IwD//9K3gIABdKSAgAAV9ICAAYosgA==
Date:   Thu, 11 Jul 2019 20:10:56 +0000
Message-ID: <1da72681-77c0-140f-5922-931cbb55ed87@vaisala.com>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
 <20190709202113.GD27937@roeck-us.net>
 <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
 <20190709210713.GB29377@roeck-us.net>
 <66ed7888-7ab9-0600-78d5-f9f2ebd4bf01@vaisala.com>
 <20190710203931.GB6330@roeck-us.net>
In-Reply-To: <20190710203931.GB6330@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::11) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b7c2a94-3577-479a-f8fc-08d7063be250
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR06MB6018;
x-ms-traffictypediagnostic: AM0PR06MB6018:
x-microsoft-antispam-prvs: <AM0PR06MB6018F72251AE53612406EA4EFDF30@AM0PR06MB6018.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(346002)(396003)(376002)(39850400004)(189003)(199004)(66066001)(486006)(71190400001)(2616005)(476003)(64756008)(316002)(71200400001)(66946007)(99286004)(66476007)(66556008)(54906003)(31696002)(66446008)(256004)(102836004)(478600001)(6246003)(76176011)(6486002)(305945005)(2906002)(229853002)(6916009)(4326008)(6512007)(36756003)(186003)(446003)(53546011)(6506007)(386003)(53936002)(52116002)(86362001)(25786009)(14454004)(68736007)(26005)(31686004)(81156014)(3846002)(6436002)(8936002)(6116002)(81166006)(5660300002)(11346002)(8676002)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB6018;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iyTQVODKQLG6O7qR6JgtN1EmtiqWvsr6wb/8A5jZCSq+w5KGQ53APxQe9pyP69rGX/fmN0+q2Dloy+DDZVktdB60wcQSdgdQb/4v0QcF6Lc0P81ZH1XGKxuGW/B4UnJCHwOHnR+40lp53NGSClwqqex+EHQ1VFK94h9idtTkkLuMCGWj7o6j4/4YUZe1gZuV1YGBysloCpf1wcHGE/5n5a2VsVVsI/7r9VKPpXtKU9mDavblLaQaTlDQ/AHRYrZsEhlvkxWs50rFDZAHGOwAk+nfeYP2oIakKONYbuDAocp8MrIqG+YNr1jcO3O704ThuTv7Id1gcQjWU8WOYwu3Av8VJskA2HyNgqylapNF2VINjM0AwQYjB0aNwI6SMyIwRiRRFGMnvs32/BSWaBP4/SRDc9ExZZLawaC6o+P1PmY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <723E4B377C140143AA63AC9B05D7C711@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7c2a94-3577-479a-f8fc-08d7063be250
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 20:10:56.8167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6018
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNy8xMC8xOSAxMTozOSBQTSwgR3VlbnRlciBSb2VjayB3cm90ZToNCg0KPiBPbiBXZWQsIEp1
bCAxMCwgMjAxOSBhdCAwNzoyMDo1OVBNICswMDAwLCBNZWxpbiBUb21hcyB3cm90ZToNCj4+IE9u
IDcvMTAvMTkgMTI6MDcgQU0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+Pj4gQWgsIHdlIGFyZSB0
YWxraW5nIGFib3V0IHRoZSBfc21hbGxlc3RfIHRpbWVvdXQgYW5kIGFib3V0IHJlc29sdXRpb24u
DQo+Pj4gQnV0IHRoYXQgaXMgbm8gcmVhc29uIHRvIGRlY2xhcmUgdGhlIGNsb2NrIGludmFsaWQu
IEp1c3Qgc2V0IHRoZSBtaW5pbXVtDQo+Pj4gdG8gdGhlIGFjdHVhbCBtaW5pbXVtLiAgVGhlcmUg
aXMgbm8gcmVhc29uIHRvIHJlamVjdCBzbG93IGNsb2NrcyBlbnRpcmVseSwNCj4+PiBldmVuIGlm
IHRoZSBncmFudWxhcml0eSBpcyBpbiB0aGUgbXVsdGktc2Vjb25kIHJhbmdlLiBUaGUgb25seSBj
YXZlYXQsDQo+Pj4gaWYgZ3JhbnVsYXJpdHkgaXMgbW9yZSB0aGFuIG9uZSBzZWNvbmQsIGlzIHRo
YXQgdGhlIHNldF90aW1lb3V0IGZ1bmN0aW9uDQo+Pj4gbXVzdCBzZWxlY3QgYW5kIHJlcG9ydCB0
aGUgYWN0dWFsIHRpbWVvdXQuDQo+PiBJIGRpZCBjb25zaWRlciBzdXBwb3J0aW5nIHNsb3dlciBj
bG9ja3MgYnV0IHRob3VnaHQgdGhhdCB0aGUgcmVxdWlyZWQNCj4+DQo+PiBhZGRpdGlvbmFsIGxv
Z2ljIHdhcyBwZXJoYXBzIG5vdCB3b3J0aCBpdC4gU28gaW5zdGVhZCBqdXN0IGRlY2xhcmVkDQo+
Pg0KPj4gdGhvc2UgY2xvY2sgZnJlcXVlbmNpZXMgaW52YWxpZC4NCj4+DQo+IEhtbSAuLi4gbm90
IHN1cmUgSSB1bmRlcnN0YW5kLiBXaGF0IG1ha2VzIGl0IHNvIGRpZmZpY3VsdCA/DQoNCk5vdCBu
ZWNlc3NhcmlseSBkaWZmaWN1bHQsIGp1c3QgYWRkaXRpb25hbCBsb2dpYyBmb3INCg0KdGhlIHNl
dF90aW1lb3V0IGNhdmVhdC4NCg0KDQpUaGFua3MsDQoNClRvbWFzDQoNCg0KDQo+DQo+IEd1ZW50
ZXINCj4NCj4+IEhvd2V2ZXIsIGlmIHRoYXQgbG9naWMgaXMgcmVxdWlyZWQsIHN1cmUgSSBjYW4g
dHJ5IHRvIGltcGxlbWVudCBpdC4NCj4+DQo+PiBJdCBtaWdodCB0YWtlIHNvbWUgd2Vla3MgYmVm
b3JlIEkgaGF2ZSB0aW1lIHRvIGxvb2sgYXQgaXQgcHJvcGVybHkuDQo+Pg0KPj4NCj4+IFRoYW5r
cywNCj4+DQo+PiBUb21hcw0KPj4NCj4+PiBUaGFua3MsDQo+Pj4gR3VlbnRlcg0KPj4+DQo+Pj4+
IFRoYW5rcywNCj4+Pj4NCj4+Pj4gVG9tYXMNCj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBU
b21hcyBNZWxpbiA8dG9tYXMubWVsaW5AdmFpc2FsYS5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4g
ICAgIGRyaXZlcnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQuYyB8IDIxICsrKysrKysrKysrKysrKy0t
LS0tLQ0KPj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2Nh
ZGVuY2Vfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2NhZGVuY2Vfd2R0LmMNCj4+Pj4+PiBpbmRl
eCAwYmRiMjc1ZDkwNGEuLjAzN2ZhZjU1N2Y5ZCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJz
L3dhdGNoZG9nL2NhZGVuY2Vfd2R0LmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2Nh
ZGVuY2Vfd2R0LmMNCj4+Pj4+PiBAQCAtMzMsMTYgKzMzLDE3IEBADQo+Pj4+Pj4gICAgICNkZWZp
bmUgQ0ROU19XRFRfQ09VTlRFUl9WQUxVRV9ESVZJU09SIDB4MTAwMA0KPj4+Pj4+ICAgICANCj4+
Pj4+PiAgICAgLyogQ2xvY2sgcHJlc2NhbGVyIHZhbHVlIGFuZCBzZWxlY3Rpb24gKi8NCj4+Pj4+
PiArI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FMRV84CTgNCj4+Pj4+PiAgICAgI2RlZmluZSBDRE5T
X1dEVF9QUkVTQ0FMRV82NAk2NA0KPj4+Pj4+ICAgICAjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxF
XzUxMgk1MTINCj4+Pj4+PiAgICAgI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FMRV80MDk2CTQwOTYN
Cj4+Pj4+PiArI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FMRV9TRUxFQ1RfOAkwDQo+Pj4+Pj4gICAg
ICNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfU0VMRUNUXzY0CTENCj4+Pj4+PiAgICAgI2RlZmlu
ZSBDRE5TX1dEVF9QUkVTQ0FMRV9TRUxFQ1RfNTEyCTINCj4+Pj4+PiAgICAgI2RlZmluZSBDRE5T
X1dEVF9QUkVTQ0FMRV9TRUxFQ1RfNDA5NgkzDQo+Pj4+Pj4gICAgIA0KPj4+Pj4+IC0vKiBJbnB1
dCBjbG9jayBmcmVxdWVuY3kgKi8NCj4+Pj4+PiAtI2RlZmluZSBDRE5TX1dEVF9DTEtfMTBNSFoJ
MTAwMDAwMDANCj4+Pj4+PiAtI2RlZmluZSBDRE5TX1dEVF9DTEtfNzVNSFoJNzUwMDAwMDANCj4+
Pj4+PiArLyogQmFzZSBpbnB1dCBjbG9jayBmcmVxdWVuY3kgKi8NCj4+Pj4+PiArI2RlZmluZSBD
RE5TX1dEVF9DTEtfMzJLSFogMzI3NjgNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXiBQbGVhc2UgdXNlIGEgdGFiIGhlcmUNCj4+Pj4+DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+
ICAgICAvKiBDb3VudGVyIG1heGltdW0gdmFsdWUgKi8NCj4+Pj4+PiAgICAgI2RlZmluZSBDRE5T
X1dEVF9DT1VOVEVSX01BWCAweEZGRg0KPj4+Pj4+IEBAIC0zMTgsMTAgKzMxOSwxOCBAQCBzdGF0
aWMgaW50IGNkbnNfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+
Pj4gICAgIAkJcmV0dXJuIHJldDsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gICAgIAljbG9ja19mID0g
Y2xrX2dldF9yYXRlKHdkdC0+Y2xrKTsNCj4+Pj4+PiAtCWlmIChjbG9ja19mID09IDApIHsNCj4+
Pj4+PiAtCQlkZXZfZXJyKGRldiwgImludmFsaWQgY2xvY2sgZnJlcXVlbmN5LCAoZj0lbHUpXG4i
LCBjbG9ja19mKTsNCj4+Pj4+PiArCWlmIChjbG9ja19mIDwgQ0ROU19XRFRfQ0xLXzMyS0haKSB7
DQo+Pj4+Pj4gKwkJZGV2X2VycihkZXYsDQo+Pj4+Pj4gKwkJCSJjYW5ub3QgZmluZCBzdWl0YWJs
ZSBjbG9jayBwcmVzY2FsZXIsIChmPSVsdSlcbiIsDQo+Pj4+Pj4gKwkJCWNsb2NrX2YpOw0KPj4+
Pj4+ICAgICAJCXJldHVybiAtRUlOVkFMOw0KPj4+Pj4+IC0JfSBlbHNlIGlmIChjbG9ja19mIDw9
IENETlNfV0RUX0NMS183NU1IWikgew0KPj4+Pj4+ICsJfSBlbHNlIGlmIChjbG9ja19mIDw9IENE
TlNfV0RUX0NMS18zMktIWiAqIENETlNfV0RUX1BSRVNDQUxFXzgpIHsNCj4+Pj4+PiArCQl3ZHQt
PnByZXNjYWxlciA9IENETlNfV0RUX1BSRVNDQUxFXzg7DQo+Pj4+Pj4gKwkJd2R0LT5jdHJsX2Ns
a3NlbCA9IENETlNfV0RUX1BSRVNDQUxFX1NFTEVDVF84Ow0KPj4+Pj4+ICsJfSBlbHNlIGlmIChj
bG9ja19mIDw9IENETlNfV0RUX0NMS18zMktIWiAqIENETlNfV0RUX1BSRVNDQUxFXzY0KSB7DQo+
Pj4+Pj4gKwkJd2R0LT5wcmVzY2FsZXIgPSBDRE5TX1dEVF9QUkVTQ0FMRV82NDsNCj4+Pj4+PiAr
CQl3ZHQtPmN0cmxfY2xrc2VsID0gQ0ROU19XRFRfUFJFU0NBTEVfU0VMRUNUXzY0Ow0KPj4+Pj4+
ICsJfSBlbHNlIGlmIChjbG9ja19mIDw9IENETlNfV0RUX0NMS18zMktIWiAqIENETlNfV0RUX1BS
RVNDQUxFXzUxMikgew0KPj4+Pj4+ICAgICAJCXdkdC0+cHJlc2NhbGVyID0gQ0ROU19XRFRfUFJF
U0NBTEVfNTEyOw0KPj4+Pj4+ICAgICAJCXdkdC0+Y3RybF9jbGtzZWwgPSBDRE5TX1dEVF9QUkVT
Q0FMRV9TRUxFQ1RfNTEyOw0KPj4+Pj4+ICAgICAJfSBlbHNlIHsNCj4+Pj4+PiAtLSANCj4+Pj4+
PiAyLjE3LjINCj4+Pj4+Pg0K
