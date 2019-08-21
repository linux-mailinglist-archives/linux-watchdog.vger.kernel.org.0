Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F4496F81
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 04:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfHUC1l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 22:27:41 -0400
Received: from mail-eopbgr00049.outbound.protection.outlook.com ([40.107.0.49]:51286
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726954AbfHUC1l (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 22:27:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzbMggFTw5IiCB8Z7OqwILgFyAoyXRh2eIkHwX6EKQaBNpSQVASrQcvKtGNI7xFmbpaHX3x33yoMkkxw1PsCDVd+P313fODE3weCY5mrMJHSkVUbOPCEbmfuNdpbimuDNBfQ3mlTZlEvwnh0OYLp89gPceJwWfGjWNuKoib+C3USeeef2UpgHGQzOFJF2ExL/tAmpb/ZlvzoVBw09Q4YTnUOOzeOt/1Mq07uyOvIQALxbuLBEw9eEfKNZfQZDnyjfc8GB83fCLjT6vDLd7b0CEXYdw8XiZCNVhlpEyL8ljgT9F55afU35RWIOeLFbQlR/0+WWIiZU9JFZd8GZJu5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlyKDqbAZrhBIahnIfbCebQOjozXH4YYloAEvc1R4Gk=;
 b=a+vEux9WdyTyiDaDAJV4LDvIqVsIhBD8FLjZmFC5igSuxsj1EMcx9UELdNVMkTWgs5UD0nTLHeYtR0PxZPQzk8OR1yN5SvzwWOQUomANbNWBfP5bNJNik/QmtX1iIkTPrLZR7m/MEuyYxganEmjuDsHl7UhUlYGc1nZfMKY8xuzoEZDK2L+uw1ombluBgB6yYytJll55M3j7ebJX3QkBWP+pTDu5eh+xsyF2+77ByRJYmVpujpJomJaO+OlW9tiCeN+zrk4cPLTjhKYAiO/n0UIqUer4XPmRLRnCDPYbWS50IPPvtxQx3sGqQGm7xPi0FVtl9StrX7KDek7vFb/UYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlyKDqbAZrhBIahnIfbCebQOjozXH4YYloAEvc1R4Gk=;
 b=C4iHz9NcRu/RhSLIXSI88Zp1+hrRIlvs5z+YO9bpWounMr7G9X9ZET4Eq6TkCkfmZbHyovigkYpaAMvqf3KpiBcWO8ru3h7ueh78kX9kCqbaEMO+cxbTm9LS2QVHPJ7Q6e8RfXi8oxyrI8c043nvpvOo2GYdKvsV2TaqK53FUZE=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3947.eurprd04.prod.outlook.com (52.134.67.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 02:27:36 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e%4]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 02:27:36 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>,
        "jan.tuerk@emtrion.com" <jan.tuerk@emtrion.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/4] watchdog: Add i.MX7ULP watchdog support
Thread-Topic: [PATCH V2 2/4] watchdog: Add i.MX7ULP watchdog support
Thread-Index: AQHVUOzJdlx/RURMR0y8AoMZ6GYoIacENvGAgAAEkICAALI+IA==
Date:   Wed, 21 Aug 2019 02:27:36 +0000
Message-ID: <DB3PR0402MB391612986F147D70D1486F34F5AA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
 <20190812085321.13823-2-Anson.Huang@nxp.com>
 <20190820153155.GA19394@roeck-us.net> <20190820154815.GA20033@roeck-us.net>
In-Reply-To: <20190820154815.GA20033@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5a03c27-ba70-4662-525b-08d725df219b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3947;
x-ms-traffictypediagnostic: DB3PR0402MB3947:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB39474312E14D9F0D4F166C5BF5AA0@DB3PR0402MB3947.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(486006)(476003)(102836004)(478600001)(6506007)(74316002)(53936002)(446003)(99286004)(76176011)(14454004)(2906002)(7696005)(54906003)(256004)(11346002)(26005)(3846002)(6116002)(186003)(8676002)(81156014)(81166006)(9686003)(86362001)(44832011)(8936002)(71200400001)(71190400001)(6916009)(33656002)(7416002)(6246003)(4326008)(66446008)(64756008)(66556008)(66946007)(66476007)(25786009)(55016002)(52536014)(6436002)(5660300002)(66066001)(305945005)(229853002)(76116006)(316002)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3947;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MOMOqGC4dWHYl3t7ywejYyNy2/KqJMS3YxoTU/pVs8eAKR/Hrqv9Wg+o60oMCB4qRdpyl2P1yM4lgpArVDaNXkYhZJfuz/IxG3U0CJ8N33y6Db4FfvoHRSMuKs8IpoVGu7rxCA0MnCF31LCg3QKVXIIcPlMABGlilK2L56BiDLCsY30s5hfwL319qq/3HeJZmNwSfJpvOZUc3UZr+A4j/Nzn8wZKS8AWHLqONcBMalelGtfN/siDIlVC7kOFoPAWR+gXrZYkM7WF/MH5oGQ15AkGEJ+xuJacgfcByWDkO9QRzgzq/S+/PW6HgKGncsTZU4qQmMB8GKu4teAt2Yau7qOc/PZb5UsRZAPo5cHRqQBPsoK+fSJuftBBc3Hh9yRQ5jDMd2Sqlq29IF6QTYJzrhCmjJs7l/1WVEPGS8cdjas=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a03c27-ba70-4662-525b-08d725df219b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 02:27:36.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3RjipqG/BthxjETIsc30HKFlvUflsthM7axOL7E5bm3u4NnopBYQzAbgUB9bZH8uP7g3D/H9Mp5wJUgisHXgOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3947
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwODozMTo1NUFNIC0wNzAw
LCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDA0OjUz
OjE5UE0gKzA4MDAsIEFuc29uLkh1YW5nQG54cC5jb20NCj4gd3JvdGU6DQo+ID4gPiBGcm9tOiBB
bnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGUgaS5NWDdV
TFAgV2F0Y2hkb2cgVGltZXIgKFdET0cpIG1vZHVsZSBpcyBhbiBpbmRlcGVuZGVudCB0aW1lcg0K
PiA+ID4gdGhhdCBpcyBhdmFpbGFibGUgZm9yIHN5c3RlbSB1c2UuDQo+ID4gPiBJdCBwcm92aWRl
cyBhIHNhZmV0eSBmZWF0dXJlIHRvIGVuc3VyZSB0aGF0IHNvZnR3YXJlIGlzIGV4ZWN1dGluZyBh
cw0KPiA+ID4gcGxhbm5lZCBhbmQgdGhhdCB0aGUgQ1BVIGlzIG5vdCBzdHVjayBpbiBhbiBpbmZp
bml0ZSBsb29wIG9yDQo+ID4gPiBleGVjdXRpbmcgdW5pbnRlbmRlZCBjb2RlLiBJZiB0aGUgV0RP
RyBtb2R1bGUgaXMgbm90IHNlcnZpY2VkDQo+ID4gPiAocmVmcmVzaGVkKSB3aXRoaW4gYSBjZXJ0
YWluIHBlcmlvZCwgaXQgcmVzZXRzIHRoZSBNQ1UuDQo+ID4gPg0KPiA+ID4gQWRkIGRyaXZlciBz
dXBwb3J0IGZvciBpLk1YN1VMUCB3YXRjaGRvZy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IFJldmlld2VkLWJ5
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4NCj4gDQo+IFdhaXQsIEkg
aGF2ZSB0byB3aXRoZHJhdyB0aGF0Lg0KPiANCj4gV2l0aCBjbGtfcHJlcGFyZV9lbmFibGUoKSwg
eW91J2xsIGFsc28gbmVlZCB0byBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpDQo+IG9uIHJl
bW92ZS4gQW4gZWFzeSB3YXkgdG8gZG8gdGhpcyBhbmQga2VlcCB0aGUgY29kZSBzaW1wbGUgd291
bGQgYmU6DQo+IA0KPiBzdGF0aWMgdm9pZCBpbXg3dWxwX3dkdF9jbGtfZGlzYWJsZV91bnByZXBh
cmUodm9pZCAqZGF0YSkgew0KPiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEpOw0KPiB9DQo+
IA0KPiBzdGF0aWMgaW50IGlteDd1bHBfd2R0X3Byb2JlKC4uLikNCj4gew0KPiAJLi4uDQo+IAly
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaW14N3VscF93ZHQtPmNsayk7DQo+IAlpZiAocmV0KQ0K
PiAJCXJldHVybiByZXQ7DQo+IAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LA0K
PiBpbXg3dWxwX3dkdF9jbGtfZGlzYWJsZV91bnByZXBhcmUpOw0KPiAJaWYgKHJldCkNCj4gCQly
ZXR1cm4gcmV0Ow0KPiAJLi4uDQo+IA0KDQpBaCwgeWVzLCBJIGFkZGVkIHRoZSBlcnJvciBoYW5k
bGUgYnV0IG1pc3NlZCB0aGUgcmVtb3ZlIGNhc2UsIHRoYW5rcyBmb3IgeW91ciBraW5kbHkNCnN1
Z2dlc3Rpb24sIHBsZWFzZSBoZWxwIHJldmlldyBWMy4NCg0KVGhhbmtzLA0KQW5zb24uDQo=
