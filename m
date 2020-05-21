Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1491DCFA9
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 May 2020 16:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgEUOZW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 May 2020 10:25:22 -0400
Received: from mail-eopbgr70087.outbound.protection.outlook.com ([40.107.7.87]:34612
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726973AbgEUOZW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 May 2020 10:25:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feiF4NAMdtkwBGd3rGymh+CiE4XBp3/DV7PdKzPc+/0IHfp3e28MunrI0+J8XMXbYW5/ICAQXhZT6Yv6HfKfa+g9rhs8kriV4uNeMZt4DuBLsdPwHyjguqF9iBe9wdzfp6EJM2pg1fh400S7X8eRzRvxNlvvj1qjuTjMH0atTGDC0UFC6i6ZK+ZKTIIUMKpLkLQUDa+wLK6CNRYsiaXZ/naj/qd0ovQ6Nig0Y9qtp+dxakb/7VQxYrydU6ME+WEe9+SKXcTp3DdOGglfOWZ1/inO2MyxfTnHS5ybPFkFFh/RrBQzcYgdIvZoy9RQG62V2Xk8SuPm6CaIrX1x5sEQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyFDcUf9R/Kjyc/bBZzn4y7CoMZdQUAmX3D1BBMIKEs=;
 b=YXKPpBLDpitCZ3TBzp/63ptFZkrQZ98F2psLXiLQW77eEW9hESq3WKM+UfJSaGX3Kpa11F7pdSqWHUEPkNFU6Cw36hSCXhFhWgxUBisztVy/6zPGRvnlQ69yhEgaIHdWjmZpkEvLJQ0Vw5KtlZTdkjTzFNmmXgosjfJb8cY5dq2+cii/9dstkHOyerfNieN8U8wbUMEqLmZiY1hudHdFtr0Klh4FUT/kOC2+EwLD1UWR/WsAHnObYJ4OIbohOCmKub5/vUxyXrnjJeu38cE9W6fgrbgL/eRQz2gBtW65DAOJ8bk9Zn9CkGLAXY3zScrLTUGsi7vGwVIvDyCMutHA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyFDcUf9R/Kjyc/bBZzn4y7CoMZdQUAmX3D1BBMIKEs=;
 b=HMdYWqglNXQiN7TPPfGrMeSkNLKpcnh6P7X1s3hGEMWtY7fZ4g41CY7tCqmAkNhlNOiBr6SMS0FyDU8mrlDtG3P/DpdSNpgJKEZLFmJZYXD9Dq4VJadgWGdCGkC+8cPbVJM9m8e61aBn0WGrAil/VyvteTxOWDzpAMwOSwVF2LA=
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com (2603:10a6:20b:2a::21)
 by AM6PR05MB5109.eurprd05.prod.outlook.com (2603:10a6:20b:60::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 14:25:19 +0000
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3]) by AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3%5]) with mapi id 15.20.3000.034; Thu, 21 May 2020
 14:25:19 +0000
From:   Michael Shych <michaelsh@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v4 0/4] support watchdog with longer timeout period
Thread-Topic: [PATCH v4 0/4] support watchdog with longer timeout period
Thread-Index: AQHWIh5tVtrzRBGJ90CKWZXbdHOj+qiZqsCAgAABdICAGQWXcA==
Date:   Thu, 21 May 2020 14:25:19 +0000
Message-ID: <AM6PR05MB6168698F8A3D49F0EF61EFF0D9B70@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
 <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
In-Reply-To: <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [109.186.42.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d37d8e5-7def-49f7-6fc2-08d7fd92c9ff
x-ms-traffictypediagnostic: AM6PR05MB5109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB51090098381F9A4BADE77433D9B70@AM6PR05MB5109.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KjulBpjLoFBISOJU98mXl4dzyxqtrw3BA+6hI3ydHy9Knz0r0eczzT5BpZsglqtIQu98jcXryvC2RvINFSjzQiH03fzYAdC1JjCEwX1wkkmcYaaFIgZ0fCLfKyUMC6UTCSu0c5zwTbeb6m3sHUOWV5bNmBuK6jKbTx/BR2j1xzXfZqpHnwm3uTYmhJky7cAJW1vM68JKtV8AiewdocNN3SccyB3zw67Y08Mm5eObBY70Gq93HUhmeCJATMXti1qD2wTNfnn2ONy0PFensRLfJlOYgpMD156JURNetQA2KAnQhNZivR84gNtDKTIHeP2RZerSSkgxzWxrKYDwCm+yXcMV6k48ARVYcNo5gtkoPMGVTQA9r/eiqk5Vyr8IrOs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6168.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(107886003)(71200400001)(478600001)(26005)(4326008)(5660300002)(53546011)(6506007)(186003)(7696005)(66446008)(64756008)(66946007)(8676002)(54906003)(8936002)(9686003)(110136005)(316002)(86362001)(52536014)(55016002)(33656002)(2906002)(66556008)(76116006)(66476007)(148743002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mBQCvarxd8lZqv1aCq11vRyd9fhveaR/5G5lgoh+AWtwMgSkFJcdekrVor0kkwHD6OsLt3KUt05/hl1ju9v0hS2hxZM8+UvU+ZOLR05Sbf11PwXhpuEVP/+P3Iphhs0xlPp8DqRzF4O4JMcD4ZvsWrgLqnAQwihgBnQqfwXVJWCVHuCxxJdrS6uIyfJLvV29fKHEGrazPgrlSX18mXfzm+XdzpZtpedIwzUmAPbI+LdFVwpy05LjTOPPmo/Q3BWmp4azYGFmG+1HGezorSYVxoaFE3a1TBj9SLbIzb4uesL1gppW2zjeAup6mhaeFYh41bGnx6mhjVGsPP10+Bp2ajMpTKkb11PXh5AJdRufIf120lotYU9xIQNTpR0idyrTstW1NoriEdj72GlLzafuXDF8oVGURovlbFM44W2lsld+NHbivC0MYaboKcrM0XSXOJumFDAayuVmn0Xt+ndjcVQwD4ghMM1C7cTfBq3v5I1bGpDjqj3T2SqbVI7sa7nG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d37d8e5-7def-49f7-6fc2-08d7fd92c9ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 14:25:19.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q46Zho7p/zIrMQtOnxycOgNvAoN4IBBmXcDTdRoj4wjwNQOUOQR9CCcfsaCzdEmG6arv3yk20+T297ph9H0UwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5109
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgQW5keSwgR3VlbnRlciwNCg0KRGlkIHlvdSB1bmRlcnN0YW5kIHRvIHdoaWNoIGJyYW5jaCBp
dCB3aWxsIGJlIGJldHRlciB0byB0YWtlIHRoaXMgcGF0Y2hzZXQ/DQoNClRoYW5rcywNCiAgIE1p
Y2hhZWwuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2
Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkg
NSwgMjAyMCA3OjE0IFBNDQo+IFRvOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
DQo+IENjOiBNaWNoYWVsIFNoeWNoIDxtaWNoYWVsc2hAbWVsbGFub3guY29tPjsgV2ltIFZhbiBT
ZWJyb2VjayA8d2ltQGxpbnV4LQ0KPiB3YXRjaGRvZy5vcmc+OyBBbmR5IFNoZXZjaGVua28gPGFu
ZHlAaW5mcmFkZWFkLm9yZz47IERhcnJlbiBIYXJ0DQo+IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz47
IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgUGxhdGZvcm0gRHJpdmVyDQo+IDxwbGF0
Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZz47IFZhZGltIFBhc3Rlcm5haw0KPiA8dmFk
aW1wQG1lbGxhbm94LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwLzRdIHN1cHBvcnQg
d2F0Y2hkb2cgd2l0aCBsb25nZXIgdGltZW91dCBwZXJpb2QNCj4gDQo+IE9uIFR1ZSwgTWF5IDUs
IDIwMjAgYXQgNzowOSBQTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3Rl
Og0KPiA+IE9uIDUvNC8yMCA3OjE0IEFNLCBtaWNoYWVsc2hAbWVsbGFub3guY29tIHdyb3RlOg0K
PiA+ID4gRnJvbTogTWljaGFlbCBTaHljaCA8bWljaGFlbHNoQG1lbGxhbm94LmNvbT4NCj4gDQo+
ID4gPiBNaWNoYWVsIFNoeWNoICg0KToNCj4gPiA+ICAgcGxhdGZvcm1fZGF0YS9tbHhyZWc6IHN1
cHBvcnQgbmV3IHdhdGNoZG9nIHR5cGUgd2l0aCBsb25nZXIgdGltZW91dA0KPiA+ID4gICAgIHBl
cmlvZA0KPiA+ID4gICBwbGF0Zm9ybS94ODY6IG1seC1wbGF0Zm9ybTogc3VwcG9ydCBuZXcgd2F0
Y2hkb2cgdHlwZSB3aXRoIGxvbmdlcg0KPiA+ID4gICAgIHRpbWVvdXQNCj4gPiA+ICAgd2F0Y2hk
b2c6IG1seC13ZHQ6IHN1cHBvcnQgbmV3IHdhdGNoZG9nIHR5cGUgd2l0aCBsb25nZXIgdGltZW91
dA0KPiA+ID4gICAgIHBlcmlvZA0KPiA+ID4gICBkb2NzOiB3YXRjaGRvZzogbWx4LXdkdDogQWRk
IGRlc2NyaXB0aW9uIG9mIG5ldyB3YXRjaGRvZyB0eXBlIDMNCj4gPiA+DQo+ID4gPiAgRG9jdW1l
bnRhdGlvbi93YXRjaGRvZy9tbHgtd2R0LnJzdCAgIHwgIDEwICsrKysNCj4gPiA+ICBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9tbHgtcGxhdGZvcm0uYyAgfCAxMDYNCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gPiAgZHJpdmVycy93YXRjaGRvZy9tbHhfd2R0LmMgICAgICAgICAg
IHwgIDczICsrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gIGluY2x1ZGUvbGludXgvcGxh
dGZvcm1fZGF0YS9tbHhyZWcuaCB8ICAgNSArLQ0KPiANCj4gPiBHdWVzcyB0aGUgYmlnIHF1ZXN0
aW9uIGlzIG5vdyB3aGljaCBicmFuY2ggdG8gdXNlIHRvIHRha2UgdGhpcyBzZXJpZXMuDQo+ID4g
VGhvdWdodHMsIGFueW9uZSA/DQo+IA0KPiBjb3VudCh3YXRjaGRvZykgPSA4DQo+IGNvdW50KHBs
YXRmb3JtKSA9IDYNCj4gDQo+IFRob3VnaHRzPw0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2Fy
ZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
