Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E472329C3
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 04:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgG3CEz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 22:04:55 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:63289
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726319AbgG3CEz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 22:04:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfZ2qcQOpkad3ivGqS4Dya51xpCd5VLVwogkDnDLGHigtrAB4WiY9OvnE2IQk0CeocFCk3tsHjCNB8ZjBkaXWDuu4Fuhn15z53yWYXePz4Qi/JojWwvqGUqn16aP8/Uf7EGRxsLhzj9gTsBQ8WKYppuN9c9Wrzr3GEiZzweM42joERm+/BZlrrdBvQkazsqnUP9xncOi6dKSWZAjvRCqScYddvXZSiEhSs7HHR24ZsG2stjhreC/nBM5kkTSCH37z1kmQbeQ91zE+VaRudBkPmJD1NjURYSecvWvgr9NB1i43G1nS55D6BjL2G9UJBRWC4ZcV3uWcnnl7afKdu+lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oiYiY2utQPpdM+k/kstqJyDNJNqrLvqUck4O03IKxo=;
 b=XCzaSJBUt1CsNnEVKwqD3qzElavHEMqKSy7ugcUuNnAA9WM99DiDLJYlSuKiKIOpNI/ZZ+XCi9BR1Fy/oakTOP32R3ntjdKUueWnpezOGzPRcBoA9fKhlEDqZSilW/U+DHeI1wpZiujwi4dSoi2+ZpSmy3hYVsmtfsdE0u5FkwvESV3/fFs9VLYk1zWa23bBLHOMTLbWCV7TwX3eUvmoyB+JvW99zt79D65UWYwD8Jou4Wc3dq+OC9gC6db5Nfs9zyWmWQoihHd71HSkTc7Bk2eQtW6avolqeYV2+fW2k2uc3XoIg7KTDk9FaAZYnsOhaCQBT+6f0U/QJqW+UBu6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oiYiY2utQPpdM+k/kstqJyDNJNqrLvqUck4O03IKxo=;
 b=n7xHfNNqIE3hTUrQvcvQBkib7Od8dA7kyJB3Ng0ZIjOHY75bgCraRQMPXsnk9Qdu2XLgF7rXIMNu6K59MFhWCiLOsVt7Y5eFOnbgyU79gup4m7ENIvF4VNTr6svUnYjQtzvaxjXUHa6hBywMBF8ZHmosxeC+735XczBj0oS5ddg=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 02:04:50 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 02:04:50 +0000
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
Subject: RE: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Topic: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makeq5iAgAAD5LCAAAWAAIAAqz9Q
Date:   Thu, 30 Jul 2020 02:04:49 +0000
Message-ID: <DB3PR0402MB39160847702DC46B32D84EA4F5710@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <a7461ad9-cc73-d38b-d1a8-c1fe49b2031c@roeck-us.net>
 <DB3PR0402MB391641A2991A7651B72283D0F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <2e962b44-d1eb-f060-f1d2-a079322d4c22@roeck-us.net>
In-Reply-To: <2e962b44-d1eb-f060-f1d2-a079322d4c22@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32bb7136-a3be-47de-bafa-08d8342cf118
x-ms-traffictypediagnostic: DB7PR04MB5994:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5994D7E581DB2A164EC63AA3F5710@DB7PR04MB5994.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o+ecDpZdA1rumPf6OGW7hFH87is5li8XhMPrLdm092k3HRVYrBmV/CUJg0e/PKyJZE3GW8AKeQfTtVB1qP5CsQSNwI5k1w1ktNlxESOGH57opFwA+i7ghL8ip/jawkxJljxuCJcMSMc0Til9+YLA9ZWkzxvS8tgLjnyid50r0rBBi2bU43nq5S36KiEKMHlzHruSG9N1iMGEd77Prq/k/a2nkes5pDQqK8EWWgg5KAQs+u340LgRcKTeoFF3nplSW48PRhS+NABAvwtDdlCtK9PRcLFtRrVPuzngNZX5g4ySifgKTWug9ncsnsCc0rPA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(316002)(5660300002)(9686003)(55016002)(86362001)(83380400001)(53546011)(4326008)(6506007)(8936002)(71200400001)(33656002)(478600001)(110136005)(26005)(7696005)(66476007)(186003)(64756008)(66446008)(8676002)(44832011)(66556008)(76116006)(66946007)(2906002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Xt11CXQ5KzJ/4yEgRG2lQNlYT0DbmBLt6CBKlt9ZbyA7XipPZGGqIPY0JPKizU6pEbhH0j7FPVZIZvKBnPAHDv4mcnxXshFyhUCci0z30Z4+ye90u/gHPlqqSbzWpsvJ2K9iOwWGrdkemzzvh94apIDkipVltlN21aA0HDVEWr5eOLM6oVG4LYi+afK+3ZWTAtfp8iMzTaGiTDlk9s0r3F24IUL7Lk2nqBWWG0C80YozAwCc/DznujAIQTdaV/JduOuBFs9g4YbQrje8mQblJKn8InhagjBnVGQwzkVj0q8G+9YPHShLppJZCDejMRI8JEh3PaX4Au4kGdRI2JXmwun6z1T89/WvSutx82mztkOlnN8pGKFwKF6Z+M7ku18gE/WODBZv3rsSVvmHT3Vy1KanB21pkYtDuX/Hil4ImEnDglkvASyinaow+znpiVRpvkVHP7moaLUqCHDWImcDa/cQ2QXvmCaKymV9gTBtM3blbiMR/G0mFfSo1vyToUY+6PipXXx7PJlmLVS7bawIyC44QNEqnR3O271KHSf9PE9k1PuwRBo5MGlqPKBmjc0tHN8W6Ae+ey4Q5wvE3Aptmc74VYl3RLHs11IuLdOjZTvVqjlG962CT3Wkxambz1AQxyP/+8fJsZSza0pAf+xj2Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bb7136-a3be-47de-bafa-08d8342cf118
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 02:04:49.9711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMVAgTTc7BtQ5quZ6CpixZb607lGNI5H+KqXC1lPKNmqjtFoum3EASrwMNIZXWia5M2Ls9tO4Z7BDaqicEspoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzog
aW14N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZQ0KPiBmb3Igd2RvZyBvcGVyYXRp
b25zDQo+IA0KPiBPbiA3LzI5LzIwIDg6MzIgQU0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEhp
LCBHdWVudGVyDQo+ID4NCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvMl0gd2F0
Y2hkb2c6IGlteDd1bHA6IFN0cmljdGx5IGZvbGxvdyB0aGUNCj4gPj4gc2VxdWVuY2UgZm9yIHdk
b2cgb3BlcmF0aW9ucw0KPiA+Pg0KPiA+PiBPbiA3LzI4LzIwIDc6MjAgUE0sIEFuc29uIEh1YW5n
IHdyb3RlOg0KPiA+Pj4gQWNjb3JkaW5nIHRvIHJlZmVyZW5jZSBtYW51YWwsIHRoZSBpLk1YN1VM
UCBXRE9HJ3Mgb3BlcmF0aW9ucyBzaG91bGQNCj4gPj4+IGZvbGxvdyBiZWxvdyBzZXF1ZW5jZToN
Cj4gPj4+DQo+ID4+PiAxLiBkaXNhYmxlIGdsb2JhbCBpbnRlcnJ1cHRzOw0KPiA+Pj4gMi4gdW5s
b2NrIHRoZSB3ZG9nIGFuZCB3YWl0IHVubG9jayBiaXQgc2V0OyAzLiByZWNvbmZpZ3VyZSB0aGUg
d2RvZw0KPiA+Pj4gYW5kIHdhaXQgZm9yIHJlY29uZmlndXJhdGlvbiBiaXQgc2V0OyA0LiBlbmFi
ZWwgZ2xvYmFsIGludGVycnVwdHMuDQo+ID4+Pg0KPiA+Pj4gU3RyaWN0bHkgZm9sbG93IHRoZSBy
ZWNvbW1lbmRlZCBzZXF1ZW5jZSBjYW4gbWFrZSBpdCBtb3JlIHJvYnVzdC4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gQ2hhbmdlcyBzaW5jZSBWMToNCj4gPj4+IAktIHVzZSByZWFkbF9wb2xsX3Rp
bWVvdXRfYXRvbWljKCkgaW5zdGVhZCBvZiB1c2xlZXBfcmFuZ2VzKCkgc2luY2UNCj4gPj4+IElS
USBpcw0KPiA+PiBkaXNhYmxlZC4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cv
aW14N3VscF93ZHQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+PiBiL2RyaXZlcnMvd2F0Y2hk
b2cvaW14N3VscF93ZHQuYyBpbmRleCA3OTkzYzhjLi43ZDJiMTJlIDEwMDY0NA0KPiA+Pj4gLS0t
IGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+PiArKysgYi9kcml2ZXJzL3dh
dGNoZG9nL2lteDd1bHBfd2R0LmMNCj4gPj4+IEBAIC01LDYgKzUsNyBAQA0KPiA+Pj4NCj4gPj4+
ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4+PiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+
ID4+PiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+Pj4gICNpbmNsdWRlIDxsaW51eC9r
ZXJuZWwuaD4NCj4gPj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4+PiAgI2luY2x1
ZGUgPGxpbnV4L29mLmg+DQo+ID4+PiBAQCAtMzYsNiArMzcsNyBAQA0KPiA+Pj4gICNkZWZpbmUg
REVGQVVMVF9USU1FT1VUCTYwDQo+ID4+PiAgI2RlZmluZSBNQVhfVElNRU9VVAkxMjgNCj4gPj4+
ICAjZGVmaW5lIFdET0dfQ0xPQ0tfUkFURQkxMDAwDQo+ID4+PiArI2RlZmluZSBXRE9HX1dBSVRf
VElNRU9VVAkxMDAwMA0KPiA+Pj4NCj4gPj4+ICBzdGF0aWMgYm9vbCBub3dheW91dCA9IFdBVENI
RE9HX05PV0FZT1VUOw0KPiA+PiBtb2R1bGVfcGFyYW0obm93YXlvdXQsDQo+ID4+PiBib29sLCAw
MDAwKTsgQEAgLTQ4LDE3ICs1MCwzMSBAQCBzdHJ1Y3QgaW14N3VscF93ZHRfZGV2aWNlIHsNCj4g
Pj4+ICAJc3RydWN0IGNsayAqY2xrOw0KPiA+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBpbXg3dWxwX3dkdF93YWl0KHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG1hc2sp
IHsNCj4gPj4+ICsJdTMyIHZhbCA9IHJlYWRsKGJhc2UgKyBXRE9HX0NTKTsNCj4gPj4+ICsNCj4g
Pj4+ICsJaWYgKCEodmFsICYgbWFzaykpDQo+ID4+PiArCQlXQVJOX09OKHJlYWRsX3BvbGxfdGlt
ZW91dF9hdG9taWMoYmFzZSArIFdET0dfQ1MsIHZhbCwNCj4gPj4+ICsJCQkJCQkgIHZhbCAmIG1h
c2ssIDAsDQo+ID4+PiArCQkJCQkJICBXRE9HX1dBSVRfVElNRU9VVCkpOw0KPiA+Pj4gK30NCj4g
Pj4+ICsNCj4gPj4+ICBzdGF0aWMgdm9pZCBpbXg3dWxwX3dkdF9lbmFibGUoc3RydWN0IHdhdGNo
ZG9nX2RldmljZSAqd2RvZywgYm9vbA0KPiA+Pj4gZW5hYmxlKSAgew0KPiA+Pj4gIAlzdHJ1Y3Qg
aW14N3VscF93ZHRfZGV2aWNlICp3ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZG9nKTsNCj4g
Pj4+DQo+ID4+PiAgCXUzMiB2YWwgPSByZWFkbCh3ZHQtPmJhc2UgKyBXRE9HX0NTKTsNCj4gPj4+
DQo+ID4+PiArCWxvY2FsX2lycV9kaXNhYmxlKCk7DQo+ID4+PiAgCXdyaXRlbChVTkxPQ0ssIHdk
dC0+YmFzZSArIFdET0dfQ05UKTsNCj4gPj4+ICsJaW14N3VscF93ZHRfd2FpdCh3ZHQtPmJhc2Us
IFdET0dfQ1NfVUxLKTsNCj4gPj4+ICAJaWYgKGVuYWJsZSkNCj4gPj4+ICAJCXdyaXRlbCh2YWwg
fCBXRE9HX0NTX0VOLCB3ZHQtPmJhc2UgKyBXRE9HX0NTKTsNCj4gPj4+ICAJZWxzZQ0KPiA+Pj4g
IAkJd3JpdGVsKHZhbCAmIH5XRE9HX0NTX0VOLCB3ZHQtPmJhc2UgKyBXRE9HX0NTKTsNCj4gPj4+
ICsJaW14N3VscF93ZHRfd2FpdCh3ZHQtPmJhc2UsIFdET0dfQ1NfUkNTKTsNCj4gPj4+ICsJbG9j
YWxfaXJxX2VuYWJsZSgpOw0KPiA+Pj4gIH0NCj4gPj4+DQo+ID4+PiAgc3RhdGljIGJvb2wgaW14
N3VscF93ZHRfaXNfZW5hYmxlZCh2b2lkIF9faW9tZW0gKmJhc2UpIEBAIC03Miw3DQo+ID4+PiAr
ODgsMTIgQEAgc3RhdGljIGludCBpbXg3dWxwX3dkdF9waW5nKHN0cnVjdCB3YXRjaGRvZ19kZXZp
Y2UgKndkb2cpDQo+ID4+PiArew0KPiA+Pj4gIAlzdHJ1Y3QgaW14N3VscF93ZHRfZGV2aWNlICp3
ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZG9nKTsNCj4gPj4+DQo+ID4+PiArCWxvY2FsX2ly
cV9kaXNhYmxlKCk7DQo+ID4+PiArCXdyaXRlbChVTkxPQ0ssIHdkdC0+YmFzZSArIFdET0dfQ05U
KTsNCj4gPj4+ICsJaW14N3VscF93ZHRfd2FpdCh3ZHQtPmJhc2UsIFdET0dfQ1NfVUxLKTsNCj4g
Pj4+ICAJd3JpdGVsKFJFRlJFU0gsIHdkdC0+YmFzZSArIFdET0dfQ05UKTsNCj4gPj4+ICsJaW14
N3VscF93ZHRfd2FpdCh3ZHQtPmJhc2UsIFdET0dfQ1NfUkNTKTsNCj4gPj4NCj4gPj4gUGVyIHJl
ZmVyZW5jZSBtYW51YWwgKHNlY3Rpb24gNTkuNS40KSwgdGhlIHdhaXRzIGFyZSBub3QgcmVxdWly
ZWQNCj4gPj4gaGVyZSwgYW5kIG5laXRoZXIgaXMgdGhlIHVubG9jay4gRm9yIHByYWN0aWNhbCBw
dXJwb3NlcywgZGlzYWJsaW5nDQo+ID4+IGludGVycnVwdHMgaXMgdXNlbGVzcyBhcyB3ZWxsIHNp
bmNlIHRoZSByZWZyZXNoIHdyaXRlIG9wZXJhdGlvbiBpcyBqdXN0IGEgc2luZ2xlDQo+IHJlZ2lz
dGVyIHdyaXRlLg0KPiA+DQo+ID4gQ29ycmVjdCwgdGhlIGV4YW1wbGUgaW4gcmVmZXJlbmNlIG1h
bnVhbCBkb2VzIE5PVCBoYXZlIHRoaXMgZmxvdyBmb3INCj4gPiByZWZyZXNoLCBidXQgSSBjaGVj
a2VkIHdpdGggb3VyIGRlc2lnbiB0ZWFtIHllc3RvZGF5LCB0aGVpciB2YWxpZGF0aW9uDQo+ID4g
Y29kZSBpbmRlZWQgaGFzIHRoaXMgZmxvdywgdGhhdCBpcyB3aHkgSSBhZGRlZCBpdCBmb3IgcmVm
cmVzaCBvcGVyYXRpb24gYXMgd2VsbC4NCj4gDQo+IElmIGl0IGlzIG5lZWRlZCwgdGhleSdsbCBu
ZWVkIHRvIHVwZGF0ZSB0aGUgbWFudWFsLiBVcmdlbnRseS4NCj4gUmVhbGx5LCBtaXNzaW5nIHRo
ZSBpbmZvcm1hdGlvbiB0aGF0IHRoZSB3YXRjaGRvZyBtdXN0IGJlIHVubG9ja2VkIGluIG9yZGVy
DQo+IHRvIHJlZnJlc2ggdGhlIHRpbWVyIHdvdWxkIG5vdCBqdXN0IGJlIGJlIGEgbWlub3IgZmxh
dyBpbiB0aGUgbWFudWFsLiBFaXRoZXIgaXQNCj4gaXMgbmVlZGVkIGFuZCBtdXN0IGJlIG1lbnRp
b25lZCAoYmVjYXVzZSB0aGUgd2F0Y2hkb2cgd291bGQgb3RoZXJ3aXNlDQo+IHNpbXBseSBub3Qg
d29yayksIG9yIGl0IGlzbid0IG5lZWRlZCBhbmQgc2hvdWxkIG5vdCBiZSBkb25lLg0KPiANCg0K
UHJldmlvdXNseSwgdGhlIGd1eSBJIGNoZWNrZWQgdGhlIHJlZnJlc2ggZmxvdyBpcyB2YWxpZGF0
aW9uIGd1eSBhbmQgbG9va3MgbGlrZSBoaXMgYW5zd2VyDQppcyBOT1QgYWNjdXJhdGUsIGFuZCBJ
IGp1c3QgY2hlY2tlZCB3aXRoIHRoZSBTb0MgZGVzaWduIG93bmVyLCBhbmQgaGUgY29uZmlybWVk
IHRoYXQgdGhlDQpyZWZyZXNoIGRvZXMgTk9UIG5lZWQgdW5sb2NrIG9wZXJhdGlvbi4NCg0KSSB3
aWxsIGRyb3AgdGhlIHNlcXVlbmNlIGZvciByZWZyZXNoIG9wZXJhdGlvbiBpbiBWMy4NCg0KIg0K
SGkgQW5zb24sDQoNCkFzIHdlIHRhbGtlZCBpbiBJTSwgd2RnIHVubG9jayBhbmQgcmVmcmVzaCBh
cmUgdHdvIGRpZmZlcmVudCBvcGVyYXRpb25zLCBhbmQgdGhleSBkb27igJl0IGltcGFjdCBlYWNo
IG90aGVyLiBTbyB5b3UgY2FuIHJlZnJlc2ggd2RnIHdpdGhvdXQgdW5sb2NraW5nIGl0Lg0KIg0K
DQpUaGFua3MsDQpBbnNvbg0K
