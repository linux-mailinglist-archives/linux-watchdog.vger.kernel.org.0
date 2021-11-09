Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D2344ABBD
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 11:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbhKIKqV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 05:46:21 -0500
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:48161
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242370AbhKIKqU (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 05:46:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YieveesfK6p0H4Fj7phaUNsaz8b1R3BSn2tenHMfIZyfgA11xWpyS8WyEWhTyWN8SL/+4vPevidKnnOJZkjfid7rfU2Jjn913mFXIS7kPBNsL2QMMy+b8NglduKXIoNFSDrA5Y1Ie3nCu3e8GfbZROAIm46qzbyDyoXz0Uv5r8hiUSBgw+9KjDowW0M8SXzcPSVEdPyWHxJGVjZbgmQKN0kA5NfPxvU/qZku2AOmVucdT6GmgknPz3+qzs0zFs6bahT2m2UpnWHxAB2TEcbtxHHZRDBYcCfEvqPUiq9s1j0233RpKbF+9y1gtfQ6b/tb4VfaT2tZqoQz0Oul8Ogfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Wyw1kIjs6xsQHz6NkzAYO5+C6SWNl5p4oZsYMmGZM=;
 b=Jr2Jecza/oxs9ozfi5rxRXvz/1wpNI9mJjUYWpToLG0JUWMdrGFQiqf72enA2PgY7NAPqqxRxoWXVTLvIL92m0gADqM24SBesZT+XLF5V0HyDIraygUcj3OF1BSSTFYD0YNVHGYP5NDO19HTgz1hvdqUKITs9aekD4Epv0KdVBqIcGDTgBeOb3qV3kDkmod/ECE+WzdAd0bFB+oGVJrfV+ahAsD3hzVeyRjok1JhJIhVjpyIxpoy1loeIGADlqWNTMokOOi0k1Xik/xu7KGPcDoP7de+hjUJkxJm6ImVIyFzgypapIjnTGblCNj0j+ibE9dmbdmubG8iSc9X/e/hWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/Wyw1kIjs6xsQHz6NkzAYO5+C6SWNl5p4oZsYMmGZM=;
 b=jKPK57w9Ty7mBVfzd7mQFduUKYs2YGWr/hBMqRuEx1aMh7P+ZZW1vA888nJgNnR7inRxck/7EoDwIDEweVMqmRwT1miIiJe2E0K4NvWo4YzdcQfYE9UTZE1/34PsG6mHpTvCb5xwzYskS4Nq5Jri3WhBL2RYqHmnIBbHuhc03Ho=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5953.jpnprd01.prod.outlook.com (2603:1096:604:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 10:43:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 10:43:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX0ZZR7vE/pMRgFEu2TDzTbftJH6v6/N+AgAALfRA=
Date:   Tue, 9 Nov 2021 10:43:32 +0000
Message-ID: <OS0PR01MB59222F2434FFF617FB853D4886929@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
         <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
 <9ac6629d3fb4002b51c7b39eda4648d8845795a3.camel@pengutronix.de>
In-Reply-To: <9ac6629d3fb4002b51c7b39eda4648d8845795a3.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57e029d4-bd78-40bb-a513-08d9a36dc675
x-ms-traffictypediagnostic: OS0PR01MB5953:
x-microsoft-antispam-prvs: <OS0PR01MB5953FE80B3A4188772F3FF5486929@OS0PR01MB5953.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UCYoxiXv3btcvAGFK+VmBCwI1lfVVjqfj1l2+60BvZLEM4RWiTZCN0TT8xfj1QS7U1lRKSQh7q3yNjfxmpWLPImFuw59meeU1ywtQiOW2YzaF+y6tmrkxD5RQ++rTn0gDFTcXyDJw8ILU/NvijpfmrW0qtKlhJpzZjV/z3yTpLobI/k+m+LZgxYUhW5rwV6899K+liTKr3kQ9f3jt2hrHd919HBYG1rT63g+TFG1X7WioSyyUv8GL0HzC3vzazvG66+QJwbD3fMPWl3RqzX24eXhcVZZNEWWdCDM31U/96u+ePaM7eYH1vwCPAzVthPyyO//bQyHQjD6VVr3BORlBH5WAg1v15kvAGHXkUJA8E8OYEre/dUgVnNfcki4sSBQmi3qR4CGw2tSktZw9wVSsapCPs7S75IF8YjPvhvVh0+Xt7biaXXI0H/GRFDHYb8keXcnviEZ2X6Qe3PTldoFIHAzC2wVBMvLpUQvMqV+5bESvKPXo5wfC+h3taWvp6/KH33GO12TV9/yQxfd1mJEWAz5J1418fv4HZ2gt/RbYg6IZgl5cpewyOVOSac0k5yvZdJ0YTiDh5THx4ZE0i7CoqA3B1Jt5c6NVBw8WsDb5NqWnsOnWpJdK8QImjBZwPDZpTDASVntJgp2smqvQtJ8tsZAsudzPxXLWXozViax02nPcmoO9fXM/PrkI+BtQOXWZOl4LqIwhf9wPzeNicIFKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(33656002)(52536014)(38100700002)(316002)(2906002)(8936002)(55016002)(86362001)(71200400001)(6506007)(26005)(66556008)(64756008)(122000001)(66476007)(8676002)(66446008)(4326008)(54906003)(186003)(9686003)(38070700005)(66946007)(110136005)(5660300002)(83380400001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWxVNDdqckxNZE9FQTJnS1RrUHZZd2hRUzNjR0lGT20zRTVFcW80RzNLRnVz?=
 =?utf-8?B?NzVtNnJhUzlIOHFkRE5oVGpNUCtWWGVscEdhWnAzK1M4OFdqQ1ZSM3ZGSGZ1?=
 =?utf-8?B?cUJzOUNidzFScHAyd1daRjVmRVJSM1Aya2w3SXBkNVFUcDZ0VEdxTmxRQzZ2?=
 =?utf-8?B?YVR3RW1LM3BLQlkxSWwvNzhXNjJLTFh2S2V6UTZlVmY1eGI2bmtQR1BaMkhz?=
 =?utf-8?B?YmFIRUVIdzM0WnNUSlQ4dHV1b0JPbDdKb1dPcHRWNjFiM1YrbS9aeHF1T0kr?=
 =?utf-8?B?SWNGMDZjT2JEYXMrcmJDdno1bjQrOUEyc3o1bkc0N3hjZGdzZGwrVGtGS1Jy?=
 =?utf-8?B?UTVWS2prUFJYREpLbTRIalFsRzhVc09LelFJVmFQTXA0eG80VTVYZ3lPRTVI?=
 =?utf-8?B?bzJhZytjK3gzQ3VZd21MZzF4UzBtbW1KdFpFd3FvK084S2piT3BKNlk1MXgx?=
 =?utf-8?B?Q0ZoZGZoSzZwUk5haU9LdkZGRGM2cmo1akxZYm43TmZ5K1FPT0NadEJaWlc0?=
 =?utf-8?B?NnN2MVJYRHVkVGYweEN1dHdMditRbVRLQ1hPVFBQMDRZdnY1bmx1c2NkakpK?=
 =?utf-8?B?OEY0a1NkWGl5MHlQV29HWGJHRjV1eVd5S2ZTdEdwL3B6emJrVDI0K2VydE5L?=
 =?utf-8?B?L3d0UlFZSjNDVnNyU3V0aVdjL1pvWXJ3SUtzUXBoWnVySlZ6dDd0MWtUVWp2?=
 =?utf-8?B?eWc2TFQvSnR4dVo2dTVHVkVTd0dDK1hRU3c3UVVRQVhmZ2R6UlFoaENraCtx?=
 =?utf-8?B?UzM0T3VJWTVyay9EaG1tV2FaaDkrd1RBdGlaaWM3dGlmRzcvNENTVFBiNGJX?=
 =?utf-8?B?TXhzWWo0akhQYTFoc2k4eGhFaFdyZXFpWSt6YWYwZUQvRGN1bkl6OUlpSHg1?=
 =?utf-8?B?WmhOazlvZHU2cThab0VxUjFWd2ErV0syM3M4Qnp3NE9FMVc5WGpGQjMvb1c2?=
 =?utf-8?B?SElmVWFiS3JIaEMrMkhhMkZEUEcrQzhMT1hFcSs4ZkRmYmVKOGZmbHZyM3ZP?=
 =?utf-8?B?YlZHZmoxQ2RFNXg5NzdMNDJRSUpOYTYzQnc5anRESWhKU2FEdHZieDNRY0Jj?=
 =?utf-8?B?czg1VXpkdXQ5UkM1U29ON3drREttVXBrNFFqd1hxWFFJbS9WM1FyRTVCcjNB?=
 =?utf-8?B?eGUzUlRza05tR0JYQzJIUTFFeU44NnNMZlBGMWpGWFRMRVg5SUY2Y3RRdnZt?=
 =?utf-8?B?a2xFeVJKOUs5UTIzQTZ2U1JmaUFSV2xvbUIrR3VvR2NjY2pOQlF5Z0RtcHZV?=
 =?utf-8?B?Skd0Vm9BL1ZOcTREQlprWDFpRld3YWxaWkdMMXJHZEJJbTJiR1lMZ1N2U0FR?=
 =?utf-8?B?ZzdydzdvMkJGYnUrenUwUm5lLzRYaGU2dHU2REprMkVRQnJmTWpHMFlyRFFC?=
 =?utf-8?B?cyt2MU5lQWZrTzY4NnJFQ241YjBFa0M0bFlsbHZ2bklSaTQvcWVDcEJzZ2lE?=
 =?utf-8?B?SnUybHROWFhjbW9wYkhIeGZQdS84M3Z3L3Rtalc1bFZIbFpqYktiQWZ3MlNt?=
 =?utf-8?B?VU5iY2lqT2p5TkVjR2F3Z3pqbUtXWjEwK2oyMUtSejlnNVJkeWZwWjd2OVJF?=
 =?utf-8?B?bDdkaU5GM2hDS3VwUWhNMEJKZllYblFaRHhMRHliL3FvNmVIVFdCKzJseGEz?=
 =?utf-8?B?eUNpVjJZUm5qbjVBdXZRcWIvOElhTlRHRWVrNktnU0s5cm9WdjcrVHJsZkpN?=
 =?utf-8?B?MmlnM3NXZ2Vyb2dCRmdEWFlPa01kYzFVV3Z0S1ZmL0ZYQVJDT0tkZ1U1NXZW?=
 =?utf-8?B?dUlUMjZlWlJVaVdoU2kyQ2VxbU8yVG9aRkgzaWxyM2crR2xqdWF4VnJ6OVln?=
 =?utf-8?B?TEMyOTJ5NGI2M2l6SHZhVXNPbGNEdUF5RkFLYkdNWmIvUWdXY2NrV2g2QTdY?=
 =?utf-8?B?V2MycXc1dVI2UXlrT2xXbnJqUFJqam11Z0V6UkRaaDcrNHhacjBWVEpPWGk1?=
 =?utf-8?B?cEFHSGxQQWU3eGRKUVdhclVJYnUxYnZ3ZENRcFBrTXI0MU5LNFZrTjVSekRr?=
 =?utf-8?B?b1VBcElqV00wWUp0OVRiNDJvcjdKNjJ6ZnVDS0FpMy9vdWwxVzFmYVJBdUVT?=
 =?utf-8?B?TkIwTDM2QjZ5SWNMc25WUFFhQ3dwOFQrV2tjOFFreUFpSk5WUWFRSTJsTmhU?=
 =?utf-8?B?MkJaOFZ2Rm9sSHQ1Q2JJWXBJelNzTDFQWHQxU2VGZHFUSWRIUWpMR3Yxak1k?=
 =?utf-8?B?KzlGRk5vVGRNaThneGNJWmM1OVIwVklPZnIwWVZRWG5ldXQ0U3QrWVJEcWFG?=
 =?utf-8?B?VWZ6dkJvS1NIRGJGd1VERDdhQVl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e029d4-bd78-40bb-a513-08d9a36dc675
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 10:43:32.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFMtC1mSw4SPD8VCQX/C5NCN9zZrRKGKECSl/2j/ilgxgznhYkA3pSPGDOFdSWYEdrx0QKi7In4jUdsYkXAzpc+gdeSnkudMV6QyRulbub8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5953
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIA0KDQo+IFN1
YmplY3Q6IFJlOiBbUkZDIDQvNF0gd2F0Y2hkb2c6IEFkZCBXYXRjaGRvZyBUaW1lciBkcml2ZXIg
Zm9yIFJaL0cyTA0KPiANCj4gT24gVGh1LCAyMDIxLTExLTA0IGF0IDE2OjA4ICswMDAwLCBCaWp1
IERhcyB3cm90ZToNCj4gWy4uLl0NCj4gPiArc3RhdGljIGludCByemcybF93ZHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0g
JnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCByemcybF93ZHRfcHJpdiAqcHJpdjsNCj4gPiArCXN0
cnVjdCBjbGsgKndkdF9jbGs7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXByaXYgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICgh
cHJpdikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlwcml2LT5iYXNlID0g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VS
Uihwcml2LT5iYXNlKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsNCj4gPiAr
DQo+ID4gKwkvKiBHZXQgd2F0Y2hkb2cgbWFpbiBjbG9jayAqLw0KPiA+ICsJd2R0X2NsayA9IGRl
dm1fY2xrX2dldCgmcGRldi0+ZGV2LCAib3NjY2xrIik7DQo+ID4gKwlpZiAoSVNfRVJSKHdkdF9j
bGspKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIod2R0
X2NsayksICJubw0KPiBvc2NjbGsiKTsNCj4gPiArDQo+ID4gKwlwcml2LT5vc2NfY2xrX3JhdGUg
PSBjbGtfZ2V0X3JhdGUod2R0X2Nsayk7DQo+ID4gKwlpZiAoIXByaXYtPm9zY19jbGtfcmF0ZSkN
Cj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRUlOVkFMLCAib3NjY2xr
IHJhdGUgaXMgMCIpOw0KPiA+ICsNCj4gPiArCS8qIEdldCBQZXJpcGhlcmFsIGNsb2NrICovDQo+
ID4gKwl3ZHRfY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJwY2xrIik7DQo+ID4gKwlp
ZiAoSVNfRVJSKHdkdF9jbGspKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsIFBUUl9FUlIod2R0X2NsayksICJubyBwY2xrIik7DQo+ID4gKw0KPiA+ICsJcHJpdi0+cGNs
a19yYXRlID0gY2xrX2dldF9yYXRlKHdkdF9jbGspOw0KPiA+ICsJaWYgKCFwcml2LT5wY2xrX3Jh
dGUpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgLUVJTlZBTCwgInBj
bGsgcmF0ZSBpcyAwIik7DQo+ID4gKw0KPiA+ICsJcHJpdi0+ZGVsYXkgPSBGMkNZQ0xFX05TRUMo
cHJpdi0+b3NjX2Nsa19yYXRlKSAqIDYgKw0KPiA+ICtGMkNZQ0xFX05TRUMocHJpdi0+cGNsa19y
YXRlKSAqIDk7DQo+ID4gKw0KPiA+ICsJcHJpdi0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9n
ZXQoJnBkZXYtPmRldiwgTlVMTCk7DQo+IA0KPiBQbGVhc2UgdXNlIGRldm1fcmVzZXRfY29udHJv
bF9nZXRfZXhjbHVzaXZlKCkuDQoNCkFncmVlZC4gV2lsbCB1c2UgZGV2bV9yZXNldF9jb250cm9s
X2dldF9leGNsdXNpdmUuDQo+IA0KPiA+ICsJaWYgKElTX0VSUihwcml2LT5yc3RjKSkNCj4gPiAr
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHByaXYtPnJzdGMpLA0K
PiA+ICsJCQkiZmFpbGVkIHRvIGdldCBjcGcgcmVzZXQiKTsNCj4gPiArDQo+ID4gKwlyZXNldF9j
b250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+ICsJcmV0ID0gZGV2bV9hZGRfYWN0aW9u
X29yX3Jlc2V0KCZwZGV2LT5kZXYsDQo+ID4gKwkJCQkgICAgICAgcnpnMmxfd2R0X3Jlc2V0X2Fz
c2VydF9jbG9ja19kaXNhYmxlLA0KPiANCj4gSSBzdXBwb3NlIHJ6ZzJsX3dkdF9yZXNldF9hc3Nl
cnRfY2xvY2tfZGlzYWJsZSBzaG91bGQgYmUgcmVuYW1lZCB0bw0KPiByemcybF93ZHRfcmVzZXRf
YXNzZXJ0IGdpdmVuIHRoYXQgaXQgZG9lcyBub3QgZGlzYWJsZSBhIGNsb2NrLg0KDQpPSy4gQnV0
IEkgYW0gZ29pbmcgdG8gdXNlIGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJfZGV2aWNlIGFuZCBwbGFu
bmluZyB0byANCmFkZCBwbSBkaXNhYmxlL3B1dCBpbiByemcybF93ZHRfcmVzZXRfYXNzZXJ0X3Bt
X2Rpc2FibGUgZnVuY3Rpb24uDQoNCkFmdGVyIHRoYXQgZHJpdmVyIHdvbid0IGhhdmUgcmVtb3Zl
IGNhbGxiYWNrIGFzIGl0IGlzIGVtcHR5Lg0KDQo+IA0KPiA+ICsJCQkJICAgICAgICZwcml2LT53
ZGV2KTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZw
ZGV2LT5kZXYsIHJldCwgImZhaWxlZCB0byBnZXQgcmVzZXQiKTsNCj4gDQo+IEkgdGhpbmsgdGhp
cyBzaG91bGQganVzdCByZXR1cm4gcmV0LCBhcyB0aGUgb25seSBwb3NzaWJsZSBmYWlsdXJlIGZy
b20NCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgaXMgLUVOT01FTS4NCg0KQWdyZWVkLCB3
aWxsIGp1c3QgcmV0dXJuIHJldC4NCg0KPiANCj4gPiArDQo+ID4gKwlwbV9ydW50aW1lX2VuYWJs
ZSgmcGRldi0+ZGV2KTsNCj4gPiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoJnBk
ZXYtPmRldik7DQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAicG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldCBmYWlsZWQiKTsNCj4gDQo+IENvbnNpZGVyIHByaW50aW5n
IHJldCB3aXRoICVwZS4NCg0KT2sgd2lsbCBwcmludCByZXQgd2l0aCAlcGUuDQoNClJlZ2FyZHMs
DQpCaWp1DQoNCj4gDQo+ID4gKwkJZ290byBvdXRfcG1fZ2V0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4g
PiArCXByaXYtPndkZXYuaW5mbyA9ICZyemcybF93ZHRfaWRlbnQ7DQo+ID4gKwlwcml2LT53ZGV2
Lm9wcyA9ICZyemcybF93ZHRfb3BzOw0KPiA+ICsJcHJpdi0+d2Rldi5wYXJlbnQgPSBkZXY7DQo+
ID4gKwlwcml2LT53ZGV2Lm1pbl90aW1lb3V0ID0gMTsNCj4gPiArCXByaXYtPndkZXYubWF4X3Rp
bWVvdXQgPSBXRFRfQ1lDTEVfTVNFQyhwcml2LT5vc2NfY2xrX3JhdGUsIDB4ZmZmKTsNCj4gPiAr
CXByaXYtPndkZXYudGltZW91dCA9IFdEVF9ERUZBVUxUX1RJTUVPVVQ7DQo+ID4gKw0KPiA+ICsJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7DQo+ID4gKwl3YXRjaGRvZ19zZXRfZHJ2
ZGF0YSgmcHJpdi0+d2RldiwgcHJpdik7DQo+ID4gKwl3YXRjaGRvZ19zZXRfbm93YXlvdXQoJnBy
aXYtPndkZXYsIG5vd2F5b3V0KTsNCj4gPiArCXdhdGNoZG9nX3NldF9yZXN0YXJ0X3ByaW9yaXR5
KCZwcml2LT53ZGV2LCAwKTsNCj4gPiArCXdhdGNoZG9nX3N0b3Bfb25fdW5yZWdpc3RlcigmcHJp
di0+d2Rldik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gd2F0Y2hkb2dfaW5pdF90aW1lb3V0KCZwcml2
LT53ZGV2LCAwLCBkZXYpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlkZXZfd2FybihkZXYsICJT
cGVjaWZpZWQgdGltZW91dCBpbnZhbGlkLCB1c2luZyBkZWZhdWx0Iik7DQo+ID4gKw0KPiA+ICsJ
cmV0ID0gZGV2bV93YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2UoJnBkZXYtPmRldiwgJnByaXYtPndk
ZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJZ290byBvdXRfcG1fZGlzYWJsZTsNCj4g
PiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK291dF9wbV9kaXNhYmxlOg0KPiA+ICsJ
cG1fcnVudGltZV9wdXQoZGV2KTsNCj4gPiArb3V0X3BtX2dldDoNCj4gPiArCXBtX3J1bnRpbWVf
ZGlzYWJsZShkZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gDQo+IHJl
Z2FyZHMNCj4gUGhpbGlwcA0K
