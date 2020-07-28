Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1263123163B
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 01:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbgG1XgK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 19:36:10 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:64577
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730402AbgG1XgJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 19:36:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUUmDGDlil5TWN2XNjpwjFkMixOlTf7vstikcYecFxqY6wQdMILDS5bUcwQk29CxdokPGvfjHUeMe7eBokmy5ZQ27D5D5zkaO3LdWlUG6kykqL68arYSRk568Pl8YuuJjbnBLYwj0Wt1vVW3MQGbw8gyNceCEOZUUo1JsXjJ+EePXuCoVmROlxjJlREfhEWK3YEGcoQqKrifnIEYLSsJkN6v8laR9i8DlNRK1ORW2wiuAAYY0296z9qSAcQ/ls6xcSQwnqf63T/edTWCRHS4Ju2jBP+duBNNZZ+R3Mpcp1jxaUQfgh1eUjPMgw6QjYqOAhV2gqN7QB+oRUxzA/yH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVcc8ZqYWLlX4w8VVaWGqo3bjVatQP82gxk0GmcJ7/g=;
 b=iF6Axjsc0vQgqDb9OzO2DEfa12/WY5r0rEfdl5ZxLjPuJzD86RxK45uNA2ouTh23uSkX2a1t9OGlxu0SULLZTRDN5Y+nJua2nts3kLgcD1A+7RJKWfLJil8ALhBNwS8RAIwl3iAgIoS9t1o+L+gE0N8D96mtKmkq9efNwk4cDrjmAe8X/HdPxfB+jxwRCn3UzpDNMvdizpSZ7QYObKCbPL+bMLBZ7F/PHbHarqP1hStOrEUJuuWalyieMJq7tMIOaSi0IgZtQg+q1SAlrMMyTYs4AM5rbhITgCyuw9PgMLoLrr/NgbYnRHmvyNT8y0Qpm8U1eJvr0JTshphWqSUuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVcc8ZqYWLlX4w8VVaWGqo3bjVatQP82gxk0GmcJ7/g=;
 b=VnQikaXYFd0DjoBCzotE+q6DBH94CUcPAw2oAVpBv5ccLrHFNpH62k+AAUPQakQ9ZlEI0lS0586dEM53q3H9h3B5vOWP7EciNDOCUagHdUgefxLJ6y2wCKJitS4prh6Q5DMXO1sPDYnPVdHZHKzraT5QM6zTUs2ZesThLGu3T1s=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 23:36:03 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 23:36:03 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] watchdog: imx7ulp: Strictly follow the sequence for
 wdog operations
Thread-Topic: [PATCH 1/2] watchdog: imx7ulp: Strictly follow the sequence for
 wdog operations
Thread-Index: AQHWZKrocghDMpUaBEu/lC3XXGngDakdDvaAgACUUzA=
Date:   Tue, 28 Jul 2020 23:36:03 +0000
Message-ID: <DB3PR0402MB3916744794CDCCE7BC332147F5730@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595918567-2017-1-git-send-email-Anson.Huang@nxp.com>
 <566adde7-c397-72f1-145d-fbca9de77cd7@roeck-us.net>
In-Reply-To: <566adde7-c397-72f1-145d-fbca9de77cd7@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d09a625-ac17-4993-0635-08d8334efe2a
x-ms-traffictypediagnostic: DB7PR04MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB423500CA0DB6B4DE0C2F5B71F5730@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JctIpaiqNs1j5UHoIAlv7sGtRKIgWqgbnWlMt4yNUYcTtJbd0vQqHOVFZ19puj6aQ55aAMB6brqgEU1SDln13Zc9xslrhd4otBaqeydqRtTKjjp6RoEwsxBg8DEL8Lu23EDOcNLlKjPOhzeS5mODSeEjlm3FDGsvuG+hr6Y6vQNb0gl0rs1ORAKZevWr+ZtZvsJoSsvhf/OopCM/CBPuL0zXs2z2BZ50b95VTlbUVMZKclO9RKy8PPFImwbDSi4ozr++o754y7UlhcV8BrVbKVC3nyeOul5aHY+BDAvm/ZRWdgAzW5L3MEVFfwWKWIvYvJXxdUpVXdY1c6sBHA+V1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(8936002)(55016002)(6506007)(4326008)(110136005)(478600001)(2906002)(316002)(53546011)(71200400001)(186003)(8676002)(7696005)(26005)(5660300002)(52536014)(33656002)(83380400001)(86362001)(66476007)(64756008)(66446008)(66556008)(76116006)(66946007)(44832011)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MQ30VDdve7A9y8EGQbCgU1qjFdGWiKvz6JKw1OznVFQlGiBFQq/kYFo7bxvQ9+Fx/84SltTgcT14L8dZ4aoIGVtMuQfYdwHqYfxp9zKoyw00jHfHDfQvU1HeLOZEhBFYEQFKrGrfq+Y8YQ9IHQM/crkclzfrjcXS+vAfMgFS6cdk+SD7hizOtIjs+SPJckDKuIoEz4Wfig2+y7aFFC97mLDA7CNGK3mIsU5yeusdZQLkbaeDZB24o3QT97uoP9HzyhMWE5kwZv/bBkwZXqm5uGxkhATv4wt+tDUUYCQpH9I1xG1FoQk5PvDiEIg5tuXEPezhPD2zRppm3oZPpNgd0IWHOfVZS2US2YEE2xxdbBIJK6i8HNQfP+l1mfwCgtqKjKq+UEeIfKyTUjjktOG3nHaxbD/H+6eF5HbasAdereD2LVwDtLrDkKE/YonYofkk3Wtd5QN+s4FA/RedXkcRFXW2fYkIbA70Qp/CZzCbxd7TPwSutRQIH7M0weceaAXR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d09a625-ac17-4993-0635-08d8334efe2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 23:36:03.5868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wi0sZL2+EnTqbnv8jAvwwIcVcda/Yk0K4kn+DgB8tyiQE2NCeAr8iAC5qqRhipQXJS3mhCeWQ92z+HlSR+H7aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB3YXRjaGRvZzogaW14
N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZSBmb3INCj4gd2RvZyBvcGVyYXRpb25z
DQo+IA0KPiBPbiA3LzI3LzIwIDExOjQyIFBNLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiBBY2Nv
cmRpbmcgdG8gcmVmZXJlbmNlIG1hbnVhbCwgdGhlIGkuTVg3VUxQIFdET0cncyBvcGVyYXRpb25z
IHNob3VsZA0KPiA+IGZvbGxvdyBiZWxvdyBzZXF1ZW5jZToNCj4gPg0KPiA+IDEuIGRpc2FibGUg
Z2xvYmFsIGludGVycnVwdHM7DQo+ID4gMi4gdW5sb2NrIHRoZSB3ZG9nIGFuZCB3YWl0IHVubG9j
ayBiaXQgc2V0OyAzLiByZWNvbmZpZ3VyZSB0aGUgd2RvZw0KPiA+IGFuZCB3YWl0IGZvciByZWNv
bmZpZ3VyYXRpb24gYml0IHNldDsgNC4gZW5hYmVsIGdsb2JhbCBpbnRlcnJ1cHRzLg0KPiA+DQo+
ID4gU3RyaWN0bHkgZm9sbG93IHRoZSByZWNvbW1lbmRlZCBzZXF1ZW5jZSBjYW4gbWFrZSBpdCBt
b3JlIHJvYnVzdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5I
dWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3dhdGNoZG9nL2lteDd1bHBfd2R0
LmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hk
b2cvaW14N3VscF93ZHQuYw0KPiA+IGIvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jIGlu
ZGV4IDc5OTNjOGMuLmI0MTRlY2YgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9p
bXg3dWxwX3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+
ID4gQEAgLTQsNiArNCw3IEBADQo+ID4gICAqLw0KPiA+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9j
bGsuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51
eC9pby5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4NCj4gPiBAQCAtNDgsMTcgKzQ5LDMyIEBAIHN0cnVjdCBpbXg3dWxwX3dk
dF9kZXZpY2Ugew0KPiA+ICAJc3RydWN0IGNsayAqY2xrOw0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBpbXg3dWxwX3dkdF93YWl0KHZvaWQgX19pb21lbSAqYmFzZSwgdTMy
IG1hc2spIHsNCj4gPiArCWludCByZXRyaWVzID0gMTAwOw0KPiA+ICsNCj4gPiArCWRvIHsNCj4g
PiArCQlpZiAocmVhZGxfcmVsYXhlZChiYXNlICsgV0RPR19DUykgJiBtYXNrKQ0KPiA+ICsJCQly
ZXR1cm47DQo+ID4gKwkJdXNsZWVwX3JhbmdlKDIwMCwgMTAwMCk7DQo+ID4gKwl9IHdoaWxlIChy
ZXRyaWVzLS0pOw0KPiANCj4gU2xlZXAgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkID8gSSBjYW4g
bm90IGltYWdpbmUgdGhhdCB0aGlzIHdvcmtzIHdlbGwgaW4gYQ0KPiBzaW5nbGUgQ1BVIHN5c3Rl
bS4gT24gdG9wIG9mIHRoYXQsIGl0IHNlZW1zIHF1aXRlIHBvaW50bGVzcy4NCj4gRWl0aGVyIHlv
dSBkb24ndCB3YW50IHRvIGJlIGludGVycnVwdGVkIG9yIHlvdSBkbywgYnV0IHNsZWVwaW5nIHdp
dGggaW50ZXJydXB0cw0KPiBkaXNhYmxlZCByZWFsbHkgZG9lc24ndCBtYWtlIHNlbnNlLiBBbmQg
ZG9lcyBpdCByZWFsbHkgdGFrZSAyMDAtMTAwMCB1UyBmb3IgdGhlDQo+IHdhdGNoZG9nIHN1YnN5
c3RlbSB0byByZWFjdCwgYW5kIHNvbWV0aW1lcyB1cCB0byAyMDAgKiAxMDAgPSAyMCBtUyA/IFRo
YXQNCj4gc2VlbXMgaGlnaGx5IHVubGlrZWx5LiBJZiBzdWNoIGEgZGVsYXkgbG9vcCBpcyBpbmRl
ZWQgbmVlZGVkLCBpdCBzaG91bGQgYmUNCj4gbGltaXRlZCBieSBhIHRpbWUsIG5vdCBieSBudW1i
ZXIgb2YgcmVwZXRpdGlvbnMuDQo+IA0KPiBVbmxlc3MgdGhlcmUgaXMgZXZpZGVuY2UgdGhhdCB0
aGVyZSBpcyBhIHByb2JsZW0gdGhhdCBuZWVkcyB0byBiZSBzb2x2ZWQsIEkgYW0NCj4gbm90IGdv
aW5nIHRvIGFjY2VwdCB0aGlzIGNvZGUuDQo+IA0KDQpPb3BzLCB0aGlzIGlzIGEgbWlzdGFrZSBv
ZiB1c2luZyBzbGVlcCB3aXRoIGludGVycnVwdCBkaXNhYmxlZCwgc29ycnkgZm9yIHRoYXQuDQpU
aGUgYmVzdCBvcHRpb24gaXMgdG8gdXNlIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21p
YygpIHRvIHBvbGwgdGhlIHN0YXR1cw0KYml0LCBob3dldmVyLCB0aGUgaS5NWDdVTFAgd2F0Y2hk
b2cgaXMgdmVyeSBzcGVjaWFsIHRoYXQgdGhlIHVubG9jayB3aW5kb3cgT05MWQ0Kb3BlbiBmb3Ig
c2V2ZXJhbCBjeWNsZXMsIHRoYXQgbWVhbnMgdGhlIHVubG9jayBzdGF0dXMgYml0IHdpbGwgYmUg
c2V0IGFuZCB0aGVuIGNsZWFyDQphdXRvbWF0aWNhbGx5IGFmdGVyIHRob3NlIGN5Y2xlcywgdXNp
bmcgcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKCkgd2lsbA0KZmFpbCBzaW5jZSB0
aGVyZSBhcmUgbWFueSB0aW1lb3V0IGhhbmRsZSBjb2RlIGluIGl0IGFuZCB0aGUgdW5sb2NrIHdp
bmRvdyBpcyBvcGVuDQphbmQgY2xvc2UgZHVyaW5nIHRoaXMgdGltZW91dCBoYW5kbGUgaW50ZXJ2
YWwsIHNvIGl0IGZhaWwgdG8gY2F0Y2ggdGhlIHVubG9jayBiaXQuDQoNClRoZSBpZGVhbCBvcHRp
b24gaXMgdXNpbmcgYXRvbWljIHBvbGxpbmcgd2l0aG91dCBhbnkgb3RoZXIgdGltZW91dCBjaGVj
ayB0byBtYWtlDQpzdXJlIHRoZSB1bmxvY2sgd2luZG93IGlzIE5PVCBtaXNzZWQsIGJ1dCBJIHRo
aW5rIExpbnV4IGtlcm5lbCB3aWxsIE5PVCBhY2NlcHQNCmEgd2hpbGUgbG9vcCB3aXRob3V0IHRp
bWVvdXQsIGFuZCB0aGF0IGlzIHdoeSBJIHRyaWVkIHRvIHVzZSB1c2xlZXBfcmFuZ2VzKCksIGJ1
dA0Kb2J2aW91c2x5IEkgbWFkZSBhIG1pc3Rha2Ugb2YgdXNpbmcgaXQgd2l0aCBJUlEgZGlzYWJs
ZWQuDQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIG9mIGhvdyB0byBoYW5kbGUgc3VjaCBj
YXNlPyBJZiB0aGUgaGFyZHdhcmUgT05MWQ0KdW5sb2NrIHRoZSByZWdpc3RlciBmb3IgYSBzbWFs
bCB3aW5kb3csIGhvdyB0byBwb2xsIHRoZSBzdGF0dXMgYml0IHdpdGggdGltZW91dA0KaGFuZGxl
IGFuZCBhbHNvIG1ha2Ugc3VyZSB0aGUgdGltZW91dCBoYW5kbGUgY29kZSBhcyBxdWljayBhcyBw
b3NzaWJsZSB0byBOT1QNCm1pc3MgdGhlIHdpbmRvdz8NCg0KVGhhbmtzLA0KQW5zb24NCg0KIA0K
DQoNCg0K
