Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EC72317A2
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 04:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730901AbgG2C0k (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 22:26:40 -0400
Received: from mail-db8eur05on2042.outbound.protection.outlook.com ([40.107.20.42]:52704
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728401AbgG2C0j (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 22:26:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQdc5c7ZylctSMDsHCguuN7Bp5VQM5tBEV9LRo7NPGYwzcFPFq4a9t3GhjjB8mD1lC7dvTDf4QCuyVrYMemNg2uxgA64f+nuU6bs3LpGjiZKifBou+E3TaISM21OA9oFsrVQNfyrCka3GI9R07OWYNQGTQq3vQ0ypnNcf/vAiRJ4Wab/rpTa8Q520+uFYdanl8P908Ri/U9IHx3fsVVxbsvAwrGutH3auK0QGVB94kB63ePWWHNxqAc23cV9kdDnRk2dOd5Q5UrfXZtl6+3pgzImFm3I8o6q9qfyfxXQct0pCaN148X0R6792p5jzATyuuWt5M1JO/O0LRJ4IZLNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YONlEwMA6CnCGfLpk0tRPQecJeVfXgQV3PfGkmU5HFk=;
 b=Xcl4EaUMYdhbA4X1/xi4Lyk7hqsAO/CVKsyqfW0n9AxSZN8cQxZOWb/k3RH7qS4rHgkdq8ccOTwd2dXwKAN9IDrf2f0HlYwYcHvdGjVWfOs2x0diG0NorDV3cxC4XN41BC7tWbIEQeOZYvD6D98QspK2QAC9Fk2+JHRLOlRhrvdK8Ryn/YH3hNvGarioZVvKMlKG9I3GlSFLvphv4Iw1it8lNGe/NZYT87Z929TxXi4SOmlysB3ZVAn6KgbLG4gDkmNB/trTkC3SLygW6rpbjxDPo49KKdO/XDADOKJvG4G+Dk3MIYfzDA54wpjBdQBuq8DfrovaNMtGtaE3+MGwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YONlEwMA6CnCGfLpk0tRPQecJeVfXgQV3PfGkmU5HFk=;
 b=F8T9JCySUxMOmdMscLQfpgHH399FDm0blVYDOoeQkU7MfGWFYiqW+4cHBeeC1QCQ/rgk97SkYF3alyPefqNchCqbdbs0KvXOn0ZzPJludhvnN0ntjwDCC809M6mjOh8gHGvJJq/aAzyh2C1gF7KDEa179ar+tnqfY9xgGxB+RhU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0401MB2536.eurprd04.prod.outlook.com (2603:10a6:4:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Wed, 29 Jul
 2020 02:26:33 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 02:26:33 +0000
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
Thread-Index: AQHWZKrocghDMpUaBEu/lC3XXGngDakdDvaAgACUUzCAADIzYA==
Date:   Wed, 29 Jul 2020 02:26:33 +0000
Message-ID: <DB3PR0402MB39169A9F5E5D2D90A64AAF3DF5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595918567-2017-1-git-send-email-Anson.Huang@nxp.com>
 <566adde7-c397-72f1-145d-fbca9de77cd7@roeck-us.net>
 <DB3PR0402MB3916744794CDCCE7BC332147F5730@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916744794CDCCE7BC332147F5730@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 33e89742-b3f0-4c1d-39f1-08d83366cf88
x-ms-traffictypediagnostic: DB6PR0401MB2536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB25367E4D02F658CCDBE08A0BF5700@DB6PR0401MB2536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jsD4j9XrEGFo9kFA0xIAGCmGqs99+qoSXkQlAgdYSB4eiIy7bj3Ed+HUEraw0wgQI1Xfab1lOt1bgL5+si573EyE4t21mXmdSuTtA2SQqJWlg4stP3qjnBhzMUqTxwiuCbq+eLmzdYw8sdy6yqlSNC6J+I7pMZO9roi53BLKZ3/2xhqkOk4wWetbkVTR/WiRj4DJc1seIMY9t5SIDx708iQFojUABJHVbs6ze4BlJycPibdAgcaxjNp1ldPMcmqDSRVbQDtwPQrm+bo7JJVzlIFgSPRklEGRo5st/w6WAoNwbzLNK1IY8qPlozMb2BF6Uooxt8gs4Y2wgXA36tihQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(33656002)(86362001)(110136005)(5660300002)(71200400001)(4326008)(2906002)(316002)(478600001)(52536014)(83380400001)(186003)(66946007)(64756008)(76116006)(7696005)(9686003)(8936002)(66446008)(26005)(55016002)(44832011)(66476007)(66556008)(8676002)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Bl/JkE3Je4qclvkYpM6xyvqCghHLFmD7bUPO9pO9N4ujWiYprwVQWzhWyrlyv2ZfNUFMkTkavLKnTJDdBoij/zS+lQiJyiuG6Qo+s3VDgGST9SludkdKvY9oAspjTIc0jSGLHZpuFsz3iujQxvUD8uxoi+3H0iiceiotNYGJzuyARJraX9/+1Plkea/jmTcfFf9+t0ZLxnu5xJtjDEYELNQfBMY0NR5O/sdhFWkCqaUvLbMOz1ZTyifA7/imM8yN71MO3QpTyFWbfwwkzmk7l9HBb+WA+SgrSdhPK5j/ZSV38p+VOeFArR6EJ1vddORux5fSZkEyhiQStsawrMRGkUuEGx1lU2DcTlvjmBgpgehB4Vj5B7hn3x0vdozqIY7X5cDgRrie32TS6NTx1UkbWcPDPN541w4mgY/WJJvemR27W5JGO/k5TWO1TIsuwNUMBO+FVEtXDmMbf6GeF8bAjuqQUCtNCvD7WQpL87nxtY4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e89742-b3f0-4c1d-39f1-08d83366cf88
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 02:26:33.3148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FLpL+ov3AWd0EvidSW5IO67a253hpTEaMgHxSkQLDzXFbskXM/eK8TWKyGrwOsuJmh3mmN0iXMKJbH8SFpDeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2536
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMS8yXSB3YXRjaGRvZzogaW14
N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZSBmb3INCj4gd2RvZyBvcGVyYXRpb25z
DQo+IA0KPiBIaSwgR3VlbnRlcg0KPiANCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IHdhdGNoZG9nOiBpbXg3dWxwOiBTdHJpY3RseSBmb2xsb3cgdGhlDQo+ID4gc2VxdWVuY2UgZm9y
IHdkb2cgb3BlcmF0aW9ucw0KPiA+DQo+ID4gT24gNy8yNy8yMCAxMTo0MiBQTSwgQW5zb24gSHVh
bmcgd3JvdGU6DQo+ID4gPiBBY2NvcmRpbmcgdG8gcmVmZXJlbmNlIG1hbnVhbCwgdGhlIGkuTVg3
VUxQIFdET0cncyBvcGVyYXRpb25zIHNob3VsZA0KPiA+ID4gZm9sbG93IGJlbG93IHNlcXVlbmNl
Og0KPiA+ID4NCj4gPiA+IDEuIGRpc2FibGUgZ2xvYmFsIGludGVycnVwdHM7DQo+ID4gPiAyLiB1
bmxvY2sgdGhlIHdkb2cgYW5kIHdhaXQgdW5sb2NrIGJpdCBzZXQ7IDMuIHJlY29uZmlndXJlIHRo
ZSB3ZG9nDQo+ID4gPiBhbmQgd2FpdCBmb3IgcmVjb25maWd1cmF0aW9uIGJpdCBzZXQ7IDQuIGVu
YWJlbCBnbG9iYWwgaW50ZXJydXB0cy4NCj4gPiA+DQo+ID4gPiBTdHJpY3RseSBmb2xsb3cgdGhl
IHJlY29tbWVuZGVkIHNlcXVlbmNlIGNhbiBtYWtlIGl0IG1vcmUgcm9idXN0Lg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiAgZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2lteDd1
bHBfd2R0LmMNCj4gPiA+IGIvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jIGluZGV4IDc5
OTNjOGMuLmI0MTRlY2YgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2lteDd1
bHBfd2R0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvaW14N3VscF93ZHQuYw0KPiA+
ID4gQEAgLTQsNiArNCw3IEBADQo+ID4gPiAgICovDQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9jbGsuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiA+ICAjaW5j
bHVkZSA8bGludXgvaW8uaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4g
PiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ID4gQEAgLTQ4LDE3ICs0OSwzMiBAQCBz
dHJ1Y3QgaW14N3VscF93ZHRfZGV2aWNlIHsNCj4gPiA+ICAJc3RydWN0IGNsayAqY2xrOw0KPiA+
ID4gIH07DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbXg3dWxwX3dkdF93YWl0
KHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG1hc2spIHsNCj4gPiA+ICsJaW50IHJldHJpZXMgPSAx
MDA7DQo+ID4gPiArDQo+ID4gPiArCWRvIHsNCj4gPiA+ICsJCWlmIChyZWFkbF9yZWxheGVkKGJh
c2UgKyBXRE9HX0NTKSAmIG1hc2spDQo+ID4gPiArCQkJcmV0dXJuOw0KPiA+ID4gKwkJdXNsZWVw
X3JhbmdlKDIwMCwgMTAwMCk7DQo+ID4gPiArCX0gd2hpbGUgKHJldHJpZXMtLSk7DQo+ID4NCj4g
PiBTbGVlcCB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQgPyBJIGNhbiBub3QgaW1hZ2luZSB0aGF0
IHRoaXMgd29ya3MNCj4gPiB3ZWxsIGluIGEgc2luZ2xlIENQVSBzeXN0ZW0uIE9uIHRvcCBvZiB0
aGF0LCBpdCBzZWVtcyBxdWl0ZSBwb2ludGxlc3MuDQo+ID4gRWl0aGVyIHlvdSBkb24ndCB3YW50
IHRvIGJlIGludGVycnVwdGVkIG9yIHlvdSBkbywgYnV0IHNsZWVwaW5nIHdpdGgNCj4gPiBpbnRl
cnJ1cHRzIGRpc2FibGVkIHJlYWxseSBkb2Vzbid0IG1ha2Ugc2Vuc2UuIEFuZCBkb2VzIGl0IHJl
YWxseSB0YWtlDQo+ID4gMjAwLTEwMDAgdVMgZm9yIHRoZSB3YXRjaGRvZyBzdWJzeXN0ZW0gdG8g
cmVhY3QsIGFuZCBzb21ldGltZXMgdXAgdG8NCj4gPiAyMDAgKiAxMDAgPSAyMCBtUyA/IFRoYXQg
c2VlbXMgaGlnaGx5IHVubGlrZWx5LiBJZiBzdWNoIGEgZGVsYXkgbG9vcA0KPiA+IGlzIGluZGVl
ZCBuZWVkZWQsIGl0IHNob3VsZCBiZSBsaW1pdGVkIGJ5IGEgdGltZSwgbm90IGJ5IG51bWJlciBv
Zg0KPiByZXBldGl0aW9ucy4NCj4gPg0KPiA+IFVubGVzcyB0aGVyZSBpcyBldmlkZW5jZSB0aGF0
IHRoZXJlIGlzIGEgcHJvYmxlbSB0aGF0IG5lZWRzIHRvIGJlDQo+ID4gc29sdmVkLCBJIGFtIG5v
dCBnb2luZyB0byBhY2NlcHQgdGhpcyBjb2RlLg0KPiA+DQo+IA0KPiBPb3BzLCB0aGlzIGlzIGEg
bWlzdGFrZSBvZiB1c2luZyBzbGVlcCB3aXRoIGludGVycnVwdCBkaXNhYmxlZCwgc29ycnkgZm9y
IHRoYXQuDQo+IFRoZSBiZXN0IG9wdGlvbiBpcyB0byB1c2UgcmVhZGxfcmVsYXhlZF9wb2xsX3Rp
bWVvdXRfYXRvbWljKCkgdG8gcG9sbCB0aGUNCj4gc3RhdHVzIGJpdCwgaG93ZXZlciwgdGhlIGku
TVg3VUxQIHdhdGNoZG9nIGlzIHZlcnkgc3BlY2lhbCB0aGF0IHRoZSB1bmxvY2sNCj4gd2luZG93
IE9OTFkgb3BlbiBmb3Igc2V2ZXJhbCBjeWNsZXMsIHRoYXQgbWVhbnMgdGhlIHVubG9jayBzdGF0
dXMgYml0IHdpbGwgYmUNCj4gc2V0IGFuZCB0aGVuIGNsZWFyIGF1dG9tYXRpY2FsbHkgYWZ0ZXIg
dGhvc2UgY3ljbGVzLCB1c2luZw0KPiByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMo
KSB3aWxsIGZhaWwgc2luY2UgdGhlcmUgYXJlIG1hbnkgdGltZW91dA0KPiBoYW5kbGUgY29kZSBp
biBpdCBhbmQgdGhlIHVubG9jayB3aW5kb3cgaXMgb3BlbiBhbmQgY2xvc2UgZHVyaW5nIHRoaXMg
dGltZW91dA0KPiBoYW5kbGUgaW50ZXJ2YWwsIHNvIGl0IGZhaWwgdG8gY2F0Y2ggdGhlIHVubG9j
ayBiaXQuDQo+IA0KPiBUaGUgaWRlYWwgb3B0aW9uIGlzIHVzaW5nIGF0b21pYyBwb2xsaW5nIHdp
dGhvdXQgYW55IG90aGVyIHRpbWVvdXQgY2hlY2sgdG8NCj4gbWFrZSBzdXJlIHRoZSB1bmxvY2sg
d2luZG93IGlzIE5PVCBtaXNzZWQsIGJ1dCBJIHRoaW5rIExpbnV4IGtlcm5lbCB3aWxsIE5PVA0K
PiBhY2NlcHQgYSB3aGlsZSBsb29wIHdpdGhvdXQgdGltZW91dCwgYW5kIHRoYXQgaXMgd2h5IEkg
dHJpZWQgdG8gdXNlDQo+IHVzbGVlcF9yYW5nZXMoKSwgYnV0IG9idmlvdXNseSBJIG1hZGUgYSBt
aXN0YWtlIG9mIHVzaW5nIGl0IHdpdGggSVJRIGRpc2FibGVkLg0KPiANCj4gRG8geW91IGhhdmUg
YW55IHN1Z2dlc3Rpb24gb2YgaG93IHRvIGhhbmRsZSBzdWNoIGNhc2U/IElmIHRoZSBoYXJkd2Fy
ZSBPTkxZDQo+IHVubG9jayB0aGUgcmVnaXN0ZXIgZm9yIGEgc21hbGwgd2luZG93LCBob3cgdG8g
cG9sbCB0aGUgc3RhdHVzIGJpdCB3aXRoIHRpbWVvdXQNCj4gaGFuZGxlIGFuZCBhbHNvIG1ha2Ug
c3VyZSB0aGUgdGltZW91dCBoYW5kbGUgY29kZSBhcyBxdWljayBhcyBwb3NzaWJsZSB0bw0KPiBO
T1QgbWlzcyB0aGUgd2luZG93Pw0KPiANCg0KSSBkaWQgbW9yZSBleHBlcmltZW50IGFuZCBmb3Vu
ZCB0aGF0IGJlbG93IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMoKSBpcyBhY3R1YWxseQ0Kd29y
a2luZywgc28gSSBzZW50IGEgVjIgd2l0aCBpdCwgcGxlYXNlIGhlbHAgcmV2aWV3LCB0aGFuayB5
b3UuDQoNCg0KKyAgICAgICB1MzIgdmFsID0gcmVhZGwoYmFzZSArIFdET0dfQ1MpOw0KKw0KKyAg
ICAgICBpZiAoISh2YWwgJiBtYXNrKSkNCisgICAgICAgICAgICAgICBXQVJOX09OKHJlYWRsX3Bv
bGxfdGltZW91dF9hdG9taWMoYmFzZSArIFdET0dfQ1MsIHZhbCwNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsICYgbWFzaywgMCwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgV0RPR19XQUlUX1RJTUVP
VVQpKTsNCg0KVGhhbmtzLA0KQW5zb24NCiANCg0K
