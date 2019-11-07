Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A880F2E7C
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2019 13:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388089AbfKGMvS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Nov 2019 07:51:18 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:34198 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733122AbfKGMvS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Nov 2019 07:51:18 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /n0qrCz4xafRieHbuYbzq7swH/AkMQ84pfDn4yxoZoLza+1LpIBuQKwc05YhHuQQUnb0dSgFhD
 Rj5qE3kqaS6PX+xwz8w3NKDko43X5Cb+335CaP8AYkzp8DmX7kKNp460nOBwdH8dEUF0UjGQFd
 CtgWC106QcpiGvWkmU6szcQ02AIQBWDsXM6OJZgOgLX9tdBvH9dyfdtGJ9OGn7czptOGO39YjD
 9kOzal1prOATq+69WKM/u5zCV4YrhONs1rMDS+NvnQtzlw+5F+W+VfmTWONA4aJXNsy69O/Ljh
 8AA=
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="57393785"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2019 05:51:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 7 Nov 2019 05:51:16 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 7 Nov 2019 05:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLhN264rEpNZK258izqNfbE6nfDAk6pHLeniUcEcK4mdxyWBwT+CfMMXtzxOisr/16TaSMrF2vorBRKRlhTPetG2ePeUrwEEnkj2VtoUZU2KeJJg59q0SP0thdJVTv7VhGsitsOEjKINDq13eLi0hRqpg7JZOUChhtSBzqF/vEBSiurEtvuNln4v+v4S0ji9zOCqQ+2jHqeTLUFNlBVOSfFbjXc+mvQkzr7KHiOh3+fQ1hdR7qk+KS27jA/bnOMFl5KYpp369InvUAoGf5xdi0FKV9U8Kfep+0qdOSeCQYPAm9m9sYZWmfI9XpsTnmR0TYtGvuuD8jPeBofs9RoL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFrRdD1/R0Wefr9SwtS70mNQP1aXDYysDXlOk7By3Uw=;
 b=jgYewyBGBrA0xGmV9SttnkEi1mi76DYgG0x1Abe/O+GEArbjeMI5DwcoBX9a+GYthd4wS1o6honQsENl9GBrPz2jPw+C7ABpSrJDED317/q/EW94VKSzSF55WlxhGhJ+QJJADxE8hzQ/5TBgJ4hroOHhMGIp3PeIDw1Fi9I4+d7xVvGyLWTSeCd5lJVU3PlrQdIvXQGkheAo5++A1kKF5McStIVI31UavunhrqN70BZSak+oHC4L+2pdpl+K+D1bPVzFic+aOr3saO7Hb8wx9C0T4e8yLSBp6vytjk0h8OskSK+ibGyn3vk3u8mSqUPjzH3VPA5mBSInfJoSByzNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFrRdD1/R0Wefr9SwtS70mNQP1aXDYysDXlOk7By3Uw=;
 b=TH1suZxd71XzfHGNxsOECnk6MjLszPOgdk1cY5EleroZDrS94gcxHsqDEQQk8m9yP5mmzbSM74hNT2v2zez3laj9vv9GkUQGPZezklnOw0s5oI+byvHtbH9zCNoK4t7rRolQpYVqzVX5D81dtE+tMSzuLrAT7Ix+YyXUbpYDYOc=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1388.namprd11.prod.outlook.com (10.168.107.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 12:51:15 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 12:51:15 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <robh+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Thread-Topic: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Thread-Index: AQHVh+/l2gK286N5pUWI+AtpzaiEg6dxqaQAgA4aiYA=
Date:   Thu, 7 Nov 2019 12:51:15 +0000
Message-ID: <28c6b394-ae88-f913-312e-6b38be1dc5a8@microchip.com>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
 <1571648890-15140-2-git-send-email-eugen.hristev@microchip.com>
 <20191029132831.GA5643@roeck-us.net>
In-Reply-To: <20191029132831.GA5643@roeck-us.net>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::45) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191107145109252
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15ce9a58-e627-4ba8-1ccf-08d763812cd9
x-ms-traffictypediagnostic: DM5PR11MB1388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB138854C2BBE8E7A1A1B3BC05E8780@DM5PR11MB1388.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(366004)(39860400002)(376002)(346002)(199004)(189003)(52116002)(6246003)(53546011)(6506007)(76176011)(386003)(66066001)(6116002)(102836004)(3846002)(316002)(6512007)(486006)(30864003)(81166006)(81156014)(476003)(5660300002)(86362001)(229853002)(25786009)(26005)(99286004)(31696002)(71200400001)(6436002)(186003)(11346002)(446003)(6916009)(4326008)(66946007)(54906003)(36756003)(6486002)(66556008)(256004)(305945005)(2906002)(8936002)(31686004)(64756008)(66476007)(7736002)(2616005)(14444005)(66446008)(14454004)(71190400001)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1388;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrBNUrxoQuxGTSNm+8ztFG8RlBRUn3G2ZnSTpstVplg69tfdYw4/odqIFhH6+50LUT43EYgqchgyZIhoG9WNgl2vpNRHQZf7osU5YbRZtRXo4qZTi9W+D7ILZV8WdNoIhWZIP1UPEsTDYps+Tj/96nY+I+666r01YAwP0VmTx8sUOYYs2fahd1LfeaFSqag250+NcQS93LJ6vxHHTU6XiRSHhWFEoA6XCIUP6mzMxOe9oy+clsrVERo3PusZMLf90F+/hkPKAHwCmELpQZbPAxfPY+dY81d7A/pFwZ+SnQOP8VKFzuYZtqSqDldr4Mkx1U7Qiq3haPgxXC8Z1BtyP8vbwiRN6yScqHSbGbn1Tk47EiItpqIWYcRCD+7DcnP2t2IgbJub851CxWB58KTUTLG0/AwKxY6W0+4L21J7q3I4SA5jFiFWuaZC/H5WEAnn
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B321725AF48D541885DE06E39F709BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ce9a58-e627-4ba8-1ccf-08d763812cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 12:51:15.2091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imJouWvK5Q+Rrxi4JZ2hnlyBwHq//SpafPYk5TNY/i66V6JEhrdLvzriuGlPoRMcLTbg8FjaUv+BWH8werCwyF85TnSmkI+PdL7RWtVLda8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1388
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDI5LjEwLjIwMTkgMTU6MjgsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQoNCj4gDQo+IE9u
IE1vbiwgT2N0IDIxLCAyMDE5IGF0IDA5OjE0OjA5QU0gKzAwMDAsIEV1Z2VuLkhyaXN0ZXZAbWlj
cm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZA
bWljcm9jaGlwLmNvbT4NCj4+DQo+PiBBZGQgc3VwcG9ydCBmb3IgU0FNOVg2MCBXRFQgaW50byBz
YW1hNWQ0X3dkdC4NCj4+IFRoaXMgbWVhbnMgdGhhdCB0aGlzIGRyaXZlciB3aWxsIGhhdmUgYSBw
bGF0Zm9ybSBkYXRhIHRoYXQgd2lsbA0KPj4gaG9sZCBkaWZmZXJlbmNlcy4NCj4+IEFkZGVkIGRl
ZmluaXRpb25zIG9mIGRpZmZlcmVudCBiaXRzLg0KPj4gVGhlIG9wcyBmdW5jdGlvbnMgd2lsbCBk
aWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIHR3byBoYXJkd2FyZSBibG9ja3MuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0K
Pj4gLS0tDQo+Pg0KPj4gSGVsbG8sDQo+Pg0KPj4gVGhpcyBpcyBhIHJld29yayBvZiB0aGUgc2Vw
YXJhdGUgc2FtOXg2MCB3YXRjaGRvZyBkcml2ZXIgaW50byBhIHNpbmdsZSBkcml2ZXINCj4+IHRo
YXQgc3VwcG9ydHMgYm90aCBoYXJkd2FyZSBibG9ja3MgKHNhbTl4NjAgYW5kIHNhbWE1ZDQpDQo+
PiBUaGlzIHdhcyBkb25lIGFzIHN1Z2dlc3RlZCBvbiB0aGUgb3JpZ2luYWwgcGF0Y2hlcyBvbiB0
aGUgbWFpbGluZyBsaXN0Lg0KPj4NCj4+IFRoYW5rcywNCj4+IEV1Z2VuDQo+Pg0KPj4gICBkcml2
ZXJzL3dhdGNoZG9nL2F0OTFzYW05X3dkdC5oIHwgIDE0ICsrKysrDQo+PiAgIGRyaXZlcnMvd2F0
Y2hkb2cvc2FtYTVkNF93ZHQuYyAgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9hdDkxc2Ft
OV93ZHQuaCBiL2RyaXZlcnMvd2F0Y2hkb2cvYXQ5MXNhbTlfd2R0LmgNCj4+IGluZGV4IDM5MDk0
MWMuLjdhMDUzZmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2F0OTFzYW05X3dk
dC5oDQo+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2F0OTFzYW05X3dkdC5oDQo+PiBAQCAtMjAs
NyArMjAsMTAgQEANCj4+ICAgI2RlZmluZSBBVDkxX1dEVF9NUgkJMHgwNAkJCS8qIFdhdGNoZG9n
IE1vZGUgUmVnaXN0ZXIgKi8NCj4+ICAgI2RlZmluZQkJQVQ5MV9XRFRfV0RWCQkoMHhmZmYgPDwg
MCkJCS8qIENvdW50ZXIgVmFsdWUgKi8NCj4+ICAgI2RlZmluZQkJCUFUOTFfV0RUX1NFVF9XRFYo
eCkJKCh4KSAmIEFUOTFfV0RUX1dEVikNCj4+ICsjZGVmaW5lCQlBVDkxX1NBTTlYNjBfUEVSSU9E
UlNUCUJJVCg0KQkJLyogUGVyaW9kIFJlc2V0ICovDQo+PiArI2RlZmluZQkJQVQ5MV9TQU05WDYw
X1JQVEhSU1QJQklUKDUpCQkvKiBNaW5pbXVtIFJlc3RhcnQgUGVyaW9kICovDQo+PiAgICNkZWZp
bmUJCUFUOTFfV0RUX1dERklFTgkJKDEgICAgIDw8IDEyKQkJLyogRmF1bHQgSW50ZXJydXB0IEVu
YWJsZSAqLw0KPj4gKyNkZWZpbmUJCUFUOTFfU0FNOVg2MF9XRERJUwkJQklUKDEyKQkJLyogRGlz
YWJsZSAqLw0KPj4gICAjZGVmaW5lCQlBVDkxX1dEVF9XRFJTVEVOCSgxICAgICA8PCAxMykJCS8q
IFJlc2V0IFByb2Nlc3NvciAqLw0KPj4gICAjZGVmaW5lCQlBVDkxX1dEVF9XRFJQUk9DCSgxICAg
ICA8PCAxNCkJCS8qIFRpbWVyIFJlc3RhcnQgKi8NCj4+ICAgI2RlZmluZQkJQVQ5MV9XRFRfV0RE
SVMJCSgxICAgICA8PCAxNSkJCS8qIFdhdGNoZG9nIERpc2FibGUgKi8NCj4+IEBAIC0zMyw0ICsz
NiwxNSBAQA0KPj4gICAjZGVmaW5lCQlBVDkxX1dEVF9XRFVORgkJKDEgPDwgMCkJCS8qIFdhdGNo
ZG9nIFVuZGVyZmxvdyAqLw0KPj4gICAjZGVmaW5lCQlBVDkxX1dEVF9XREVSUgkJKDEgPDwgMSkJ
CS8qIFdhdGNoZG9nIEVycm9yICovDQo+PiAgIA0KPj4gKyNkZWZpbmUgQVQ5MV9TQU05WDYwX1ZS
CQkweDA4CQkJLyogV2F0Y2hkb2cgVGltZXIgVmFsdWUgUmVnaXN0ZXIgKi8NCj4+ICsNCj4+ICsj
ZGVmaW5lIEFUOTFfU0FNOVg2MF9XTFIJCTB4MGMNCj4+ICsjZGVmaW5lCQlBVDkxX1NBTTlYNjBf
Q09VTlRFUgkoMHhmZmYgPDwgMCkJCS8qIFdhdGNoZG9nIFBlcmlvZCBWYWx1ZSAqLw0KPj4gKyNk
ZWZpbmUJCUFUOTFfU0FNOVg2MF9TRVRfQ09VTlRFUih4KQkoKHgpICYgQVQ5MV9TQU05WDYwX0NP
VU5URVIpDQo+PiArDQo+PiArI2RlZmluZSBBVDkxX1NBTTlYNjBfSUVSCQkweDE0CQkJLyogSW50
ZXJydXB0IEVuYWJsZSBSZWdpc3RlciAqLw0KPj4gKyNkZWZpbmUJCUFUOTFfU0FNOVg2MF9QRVJJ
TlQJCUJJVCgwKQkJLyogUGVyaW9kIEludGVycnVwdCBFbmFibGUgKi8NCj4+ICsjZGVmaW5lIEFU
OTFfU0FNOVg2MF9JRFIJCTB4MTgJCQkvKiBJbnRlcnJ1cHQgRGlzYWJsZSBSZWdpc3RlciAqLw0K
Pj4gKyNkZWZpbmUgQVQ5MV9TQU05WDYwX0lTUgkJMHgxYwkJCS8qIEludGVycnVwdCBTdGF0dXMg
UmVnaXN0ZXIgKi8NCj4+ICsNCj4gDQo+IFRob3NlIHRhYnMgYXJlIGdldHRpbmcgbWVzc3ksIGFu
ZCB0aGUgbWl4IG9mIEJJVCgpIGFuZCBzaGlmdCBpcyBtZXNzeSB0b28uDQo+IE1pbmQgY2xlYW5p
bmcgaXQgdXAgYSBiaXQgPyBFc3BlY2lhbGx5LCB0d28gdGFicyBhZnRlciAjZGVmaW5lIGRvZXNu
J3QgcmVhbGx5DQo+IGFkZCB2YWx1ZSAodXNlIHR3byBzcGFjZXMpLCBhbmQgdXNlIEJJVCgpIHRo
cm91Z2hvdXQgb3Igbm90IGF0IGFsbC4NCj4gDQo+PiAgICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc2FtYTVk
NF93ZHQuYw0KPj4gaW5kZXggZDE5M2E2MC4uYjkyYWZkNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9zYW1h
NWQ0X3dkdC5jDQo+PiBAQCAtMiw3ICsyLDcgQEANCj4+ICAgLyoNCj4+ICAgICogRHJpdmVyIGZv
ciBBdG1lbCBTQU1BNUQ0IFdhdGNoZG9nIFRpbWVyDQo+PiAgICAqDQo+PiAtICogQ29weXJpZ2h0
IChDKSAyMDE1IEF0bWVsIENvcnBvcmF0aW9uDQo+PiArICogQ29weXJpZ2h0IChDKSAyMDE1LTIw
MTkgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jLiBhbmQgaXRzIHN1YnNpZGlhcmllcw0KPj4gICAg
Ki8NCj4+ICAgDQo+PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPj4gQEAgLTExLDYgKzEx
LDcgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPj4gICAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPj4gKyNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPg0KPj4gICAj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9y
ZWJvb3QuaD4NCj4+IEBAIC0yNSwxMSArMjYsMTggQEANCj4+ICAgDQo+PiAgICNkZWZpbmUgV0RU
X1NFQzJUSUNLUyhzKQkoKHMpID8gKCgocykgPDwgOCkgLSAxKSA6IDApDQo+PiAgIA0KPj4gK3N0
cnVjdCBzYW1hNWQ0X3dkdF9kYXRhIHsNCj4+ICsJY29uc3QgdW5zaWduZWQgaW50CQlzYW05eDYw
X3N1cHBvcnQ7DQo+PiArfTsNCj4+ICsNCj4+ICAgc3RydWN0IHNhbWE1ZDRfd2R0IHsNCj4+IC0J
c3RydWN0IHdhdGNoZG9nX2RldmljZQl3ZGQ7DQo+PiAtCXZvaWQgX19pb21lbQkJKnJlZ19iYXNl
Ow0KPj4gLQl1MzIJCQltcjsNCj4+IC0JdW5zaWduZWQgbG9uZwkJbGFzdF9waW5nOw0KPj4gKwlz
dHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlCQl3ZGQ7DQo+PiArCWNvbnN0IHN0cnVjdCBzYW1hNWQ0X3dk
dF9kYXRhCSpkYXRhOw0KPj4gKwl2b2lkIF9faW9tZW0JCQkqcmVnX2Jhc2U7DQo+PiArCXUzMgkJ
CQltcjsNCj4+ICsJdTMyCQkJCWlyOw0KPj4gKwl1bnNpZ25lZCBsb25nCQkJbGFzdF9waW5nOw0K
Pj4gKwl1bnNpZ25lZCBpbnQJCQluZWVkX2lycToxOw0KPiANCj4gVGhpcyBjYW4gYmUgYSBib29s
LiBNYWtpbmcgaXQgYSBiaXQganVzdCBhZGRzIGNvbXBsZXhpdHkgdG8gdGhlIGNvZGUuDQo+IA0K
Pj4gICB9Ow0KPj4gICANCj4+ICAgc3RhdGljIGludCB3ZHRfdGltZW91dDsNCj4+IEBAIC03OCw3
ICs4NiwxMiBAQCBzdGF0aWMgaW50IHNhbWE1ZDRfd2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19k
ZXZpY2UgKndkZCkNCj4+ICAgew0KPj4gICAJc3RydWN0IHNhbWE1ZDRfd2R0ICp3ZHQgPSB3YXRj
aGRvZ19nZXRfZHJ2ZGF0YSh3ZGQpOw0KPj4gICANCj4+IC0Jd2R0LT5tciAmPSB+QVQ5MV9XRFRf
V0RESVM7DQo+PiArCWlmICh3ZHQtPmRhdGEtPnNhbTl4NjBfc3VwcG9ydCkgew0KPj4gKwkJd3Jp
dGVsX3JlbGF4ZWQod2R0LT5pciwgd2R0LT5yZWdfYmFzZSArIEFUOTFfU0FNOVg2MF9JRVIpOw0K
Pj4gKwkJd2R0LT5tciAmPSB+QVQ5MV9TQU05WDYwX1dERElTOw0KPj4gKwl9IGVsc2Ugew0KPj4g
KwkJd2R0LT5tciAmPSB+QVQ5MV9XRFRfV0RESVM7DQo+PiArCX0NCj4+ICAgCXdkdF93cml0ZSh3
ZHQsIEFUOTFfV0RUX01SLCB3ZHQtPm1yKTsNCj4+ICAgDQo+PiAgIAlyZXR1cm4gMDsNCj4+IEBA
IC04OCw3ICsxMDEsMTIgQEAgc3RhdGljIGludCBzYW1hNWQ0X3dkdF9zdG9wKHN0cnVjdCB3YXRj
aGRvZ19kZXZpY2UgKndkZCkNCj4+ICAgew0KPj4gICAJc3RydWN0IHNhbWE1ZDRfd2R0ICp3ZHQg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGQpOw0KPj4gICANCj4+IC0Jd2R0LT5tciB8PSBBVDkx
X1dEVF9XRERJUzsNCj4+ICsJaWYgKHdkdC0+ZGF0YS0+c2FtOXg2MF9zdXBwb3J0KSB7DQo+PiAr
CQl3cml0ZWxfcmVsYXhlZCh3ZHQtPmlyLCB3ZHQtPnJlZ19iYXNlICsgQVQ5MV9TQU05WDYwX0lE
Uik7DQo+PiArCQl3ZHQtPm1yIHw9IEFUOTFfU0FNOVg2MF9XRERJUzsNCj4+ICsJfSBlbHNlIHsN
Cj4+ICsJCXdkdC0+bXIgfD0gQVQ5MV9XRFRfV0RESVM7DQo+PiArCX0NCj4+ICAgCXdkdF93cml0
ZSh3ZHQsIEFUOTFfV0RUX01SLCB3ZHQtPm1yKTsNCj4+ICAgDQo+PiAgIAlyZXR1cm4gMDsNCj4+
IEBAIC0xMDksNiArMTI3LDE0IEBAIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfc2V0X3RpbWVvdXQo
c3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLA0KPj4gICAJc3RydWN0IHNhbWE1ZDRfd2R0ICp3
ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGQpOw0KPj4gICAJdTMyIHZhbHVlID0gV0RUX1NF
QzJUSUNLUyh0aW1lb3V0KTsNCj4+ICAgDQo+PiArCWlmICh3ZHQtPmRhdGEtPnNhbTl4NjBfc3Vw
cG9ydCkgew0KPj4gKwkJd2R0X3dyaXRlKHdkdCwgQVQ5MV9TQU05WDYwX1dMUiwNCj4+ICsJCQkg
IEFUOTFfU0FNOVg2MF9TRVRfQ09VTlRFUih2YWx1ZSkpOw0KPj4gKw0KPj4gKwkJd2RkLT50aW1l
b3V0ID0gdGltZW91dDsNCj4+ICsJCXJldHVybiAwOw0KPj4gKwl9DQo+PiArDQo+PiAgIAl3ZHQt
Pm1yICY9IH5BVDkxX1dEVF9XRFY7DQo+PiAgIAl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9XRFYo
dmFsdWUpOw0KPj4gICANCj4+IEBAIC0xNDMsOCArMTY5LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgd2F0Y2hkb2dfb3BzIHNhbWE1ZDRfd2R0X29wcyA9IHsNCj4+ICAgc3RhdGljIGlycXJldHVy
bl90IHNhbWE1ZDRfd2R0X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4+ICAg
ew0KPj4gICAJc3RydWN0IHNhbWE1ZDRfd2R0ICp3ZHQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShk
ZXZfaWQpOw0KPj4gKwl1MzIgcmVnOw0KPj4gICANCj4+IC0JaWYgKHdkdF9yZWFkKHdkdCwgQVQ5
MV9XRFRfU1IpKSB7DQo+PiArCWlmICh3ZHQtPmRhdGEtPnNhbTl4NjBfc3VwcG9ydCkNCj4+ICsJ
CXJlZyA9IHdkdF9yZWFkKHdkdCwgQVQ5MV9TQU05WDYwX0lTUik7DQo+PiArCWVsc2UNCj4+ICsJ
CXJlZyA9IHdkdF9yZWFkKHdkdCwgQVQ5MV9XRFRfU1IpOw0KPj4gKw0KPj4gKwlpZiAocmVnKSB7
DQo+PiAgIAkJcHJfY3JpdCgiQXRtZWwgV2F0Y2hkb2cgU29mdHdhcmUgUmVzZXRcbiIpOw0KPj4g
ICAJCWVtZXJnZW5jeV9yZXN0YXJ0KCk7DQo+PiAgIAkJcHJfY3JpdCgiUmVib290IGRpZG4ndCBz
dWNjZWVkXG4iKTsNCj4+IEBAIC0xNTcsMTMgKzE4OSwxNCBAQCBzdGF0aWMgaW50IG9mX3NhbWE1
ZDRfd2R0X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IHNhbWE1ZDRfd2R0ICp3
ZHQpDQo+PiAgIHsNCj4+ICAgCWNvbnN0IGNoYXIgKnRtcDsNCj4+ICAgDQo+PiAtCXdkdC0+bXIg
PSBBVDkxX1dEVF9XRERJUzsNCj4+ICsJaWYgKHdkdC0+ZGF0YS0+c2FtOXg2MF9zdXBwb3J0KQ0K
Pj4gKwkJd2R0LT5tciA9IEFUOTFfU0FNOVg2MF9XRERJUzsNCj4+ICsJZWxzZQ0KPj4gKwkJd2R0
LT5tciA9IEFUOTFfV0RUX1dERElTOw0KPj4gICANCj4+ICAgCWlmICghb2ZfcHJvcGVydHlfcmVh
ZF9zdHJpbmcobnAsICJhdG1lbCx3YXRjaGRvZy10eXBlIiwgJnRtcCkgJiYNCj4+ICAgCSAgICAh
c3RyY21wKHRtcCwgInNvZnR3YXJlIikpDQo+PiAtCQl3ZHQtPm1yIHw9IEFUOTFfV0RUX1dERklF
TjsNCj4+IC0JZWxzZQ0KPj4gLQkJd2R0LT5tciB8PSBBVDkxX1dEVF9XRFJTVEVOOw0KPj4gKwkJ
d2R0LT5uZWVkX2lycSA9IDE7DQo+PiAgIA0KPj4gICAJaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChucCwgImF0bWVsLGlkbGUtaGFsdCIpKQ0KPj4gICAJCXdkdC0+bXIgfD0gQVQ5MV9XRFRfV0RJ
RExFSExUOw0KPj4gQEAgLTE3NiwyMSArMjA5LDQ2IEBAIHN0YXRpYyBpbnQgb2Zfc2FtYTVkNF93
ZHRfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3Qgc2FtYTVkNF93ZHQgKndkdCkN
Cj4+ICAgDQo+PiAgIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfaW5pdChzdHJ1Y3Qgc2FtYTVkNF93
ZHQgKndkdCkNCj4+ICAgew0KPj4gLQl1MzIgcmVnOw0KPj4gKwl1MzIgcmVnLCB2YWw7DQo+PiAr
DQo+PiArCXZhbCA9IFdEVF9TRUMyVElDS1MoV0RUX0RFRkFVTFRfVElNRU9VVCk7DQo+PiAgIAkv
Kg0KPj4gICAJICogV2hlbiBib290aW5nIGFuZCByZXN1bWluZywgdGhlIGJvb3Rsb2FkZXIgbWF5
IGhhdmUgY2hhbmdlZCB0aGUNCj4+ICAgCSAqIHdhdGNoZG9nIGNvbmZpZ3VyYXRpb24uDQo+PiAg
IAkgKiBJZiB0aGUgd2F0Y2hkb2cgaXMgYWxyZWFkeSBydW5uaW5nLCB3ZSBjYW4gc2FmZWx5IHVw
ZGF0ZSBpdC4NCj4+ICAgCSAqIEVsc2UsIHdlIGhhdmUgdG8gZGlzYWJsZSBpdCBwcm9wZXJseS4N
Cj4+ICAgCSAqLw0KPj4gLQlpZiAod2R0X2VuYWJsZWQpIHsNCj4+IC0JCXdkdF93cml0ZV9ub3Ns
ZWVwKHdkdCwgQVQ5MV9XRFRfTVIsIHdkdC0+bXIpOw0KPj4gLQl9IGVsc2Ugew0KPj4gKwlpZiAo
IXdkdF9lbmFibGVkKSB7DQo+PiAgIAkJcmVnID0gd2R0X3JlYWQod2R0LCBBVDkxX1dEVF9NUik7
DQo+PiAtCQlpZiAoIShyZWcgJiBBVDkxX1dEVF9XRERJUykpDQo+PiArCQlpZiAod2R0LT5kYXRh
LT5zYW05eDYwX3N1cHBvcnQgJiYgKCEocmVnICYgQVQ5MV9TQU05WDYwX1dERElTKSkpDQo+PiAr
CQkJd2R0X3dyaXRlX25vc2xlZXAod2R0LCBBVDkxX1dEVF9NUiwNCj4+ICsJCQkJCSAgcmVnIHwg
QVQ5MV9TQU05WDYwX1dERElTKTsNCj4+ICsJCWVsc2UgaWYgKCF3ZHQtPmRhdGEtPnNhbTl4NjBf
c3VwcG9ydCAmJg0KPj4gKwkJCSAoIShyZWcgJiBBVDkxX1dEVF9XRERJUykpKQ0KPj4gICAJCQl3
ZHRfd3JpdGVfbm9zbGVlcCh3ZHQsIEFUOTFfV0RUX01SLA0KPj4gICAJCQkJCSAgcmVnIHwgQVQ5
MV9XRFRfV0RESVMpOw0KPj4gICAJfQ0KPj4gKw0KPj4gKwlpZiAod2R0LT5kYXRhLT5zYW05eDYw
X3N1cHBvcnQpIHsNCj4+ICsJCWlmICh3ZHQtPm5lZWRfaXJxKQ0KPj4gKwkJCXdkdC0+aXIgPSBB
VDkxX1NBTTlYNjBfUEVSSU5UOw0KPj4gKwkJZWxzZQ0KPj4gKwkJCXdkdC0+bXIgfD0gQVQ5MV9T
QU05WDYwX1BFUklPRFJTVDsNCj4+ICsNCj4+ICsJCXdkdF93cml0ZSh3ZHQsIEFUOTFfU0FNOVg2
MF9JRVIsIHdkdC0+aXIpOw0KPj4gKwkJd2R0X3dyaXRlKHdkdCwgQVQ5MV9TQU05WDYwX1dMUiwg
QVQ5MV9TQU05WDYwX1NFVF9DT1VOVEVSKHZhbCkpOw0KPj4gKwl9IGVsc2Ugew0KPj4gKwkJd2R0
LT5tciB8PSBBVDkxX1dEVF9TRVRfV0REKFdEVF9TRUMyVElDS1MoTUFYX1dEVF9USU1FT1VUKSk7
DQo+PiArCQl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9XRFYodmFsKTsNCj4+ICsNCj4+ICsJCWlm
ICh3ZHQtPm5lZWRfaXJxKQ0KPj4gKwkJCXdkdC0+bXIgfD0gQVQ5MV9XRFRfV0RGSUVOOw0KPj4g
KwkJZWxzZQ0KPj4gKwkJCXdkdC0+bXIgfD0gQVQ5MV9XRFRfV0RSU1RFTjsNCj4+ICsJfQ0KPj4g
Kw0KPj4gKwl3ZHRfd3JpdGVfbm9zbGVlcCh3ZHQsIEFUOTFfV0RUX01SLCB3ZHQtPm1yKTsNCj4+
ICsNCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gQEAgLTIwMSwxMyArMjU5LDE0
IEBAIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4+ICAgCXN0cnVjdCBzYW1hNWQ0X3dkdCAqd2R0Ow0KPj4gICAJdm9pZCBfX2lvbWVt
ICpyZWdzOw0KPj4gICAJdTMyIGlycSA9IDA7DQo+PiAtCXUzMiB0aW1lb3V0Ow0KPj4gICAJaW50
IHJldDsNCj4+ICAgDQo+PiAgIAl3ZHQgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKndkdCks
IEdGUF9LRVJORUwpOw0KPj4gICAJaWYgKCF3ZHQpDQo+PiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+
PiAgIA0KPj4gKwl3ZHQtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRl
dik7DQo+PiArDQo+PiAgIAl3ZGQgPSAmd2R0LT53ZGQ7DQo+PiAgIAl3ZGQtPnRpbWVvdXQgPSBX
RFRfREVGQVVMVF9USU1FT1VUOw0KPj4gICAJd2RkLT5pbmZvID0gJnNhbWE1ZDRfd2R0X2luZm87
DQo+PiBAQCAtMjI0LDE1ICsyODMsMTcgQEAgc3RhdGljIGludCBzYW1hNWQ0X3dkdF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICANCj4+ICAgCXdkdC0+cmVnX2Jhc2Ug
PSByZWdzOw0KPj4gICANCj4+IC0JaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAoZGV2LT5vZl9u
b2RlLCAwKTsNCj4+IC0JaWYgKCFpcnEpDQo+PiAtCQlkZXZfd2FybihkZXYsICJmYWlsZWQgdG8g
Z2V0IElSUSBmcm9tIERUXG4iKTsNCj4+IC0NCj4+ICAgCXJldCA9IG9mX3NhbWE1ZDRfd2R0X2lu
aXQoZGV2LT5vZl9ub2RlLCB3ZHQpOw0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0
Ow0KPj4gICANCj4+IC0JaWYgKCh3ZHQtPm1yICYgQVQ5MV9XRFRfV0RGSUVOKSAmJiBpcnEpIHsN
Cj4+ICsJaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAoZGV2LT5vZl9ub2RlLCAwKTsNCj4+ICsJ
aWYgKCFpcnEpIHsNCj4+ICsJCWRldl93YXJuKGRldiwgImZhaWxlZCB0byBnZXQgSVJRIGZyb20g
RFRcbiIpOw0KPj4gKwkJd2R0LT5uZWVkX2lycSA9IDA7DQo+IA0KPiBEb2VzIGl0IG1ha2Ugc2Vu
c2UgdG8gaWdub3JlIHRoYXQgPw0KDQpIaSBHdWVudGVyLA0KDQpDYW4geW91IGRldGFpbCB3aGF0
IGV4YWN0bHkgaXMgaWdub3JlZCA/DQoNCj4gDQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKHdkdC0+
bmVlZF9pcnEpIHsNCj4+ICAgCQlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBzYW1h
NWQ0X3dkdF9pcnFfaGFuZGxlciwNCj4+ICAgCQkJCSAgICAgICBJUlFGX1NIQVJFRCB8IElSUUZf
SVJRUE9MTCB8DQo+PiAgIAkJCQkgICAgICAgSVJRRl9OT19TVVNQRU5ELCBwZGV2LT5uYW1lLCBw
ZGV2KTsNCj4+IEBAIC0yNDQsMTEgKzMwNSw2IEBAIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgDQo+PiAgIAl3YXRjaGRvZ19p
bml0X3RpbWVvdXQod2RkLCB3ZHRfdGltZW91dCwgZGV2KTsNCj4+ICAgDQo+PiAtCXRpbWVvdXQg
PSBXRFRfU0VDMlRJQ0tTKHdkZC0+dGltZW91dCk7DQo+PiAtDQo+PiAtCXdkdC0+bXIgfD0gQVQ5
MV9XRFRfU0VUX1dERChXRFRfU0VDMlRJQ0tTKE1BWF9XRFRfVElNRU9VVCkpOw0KPj4gLQl3ZHQt
Pm1yIHw9IEFUOTFfV0RUX1NFVF9XRFYodGltZW91dCk7DQo+PiAtDQo+PiAgIAlyZXQgPSBzYW1h
NWQ0X3dkdF9pbml0KHdkdCk7DQo+PiAgIAlpZiAocmV0KQ0KPj4gICAJCXJldHVybiByZXQ7DQo+
PiBAQCAtMjY4LDggKzMyNCwyMSBAQCBzdGF0aWMgaW50IHNhbWE1ZDRfd2R0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4gICAN
Cj4+ICtzdGF0aWMgc3RydWN0IHNhbWE1ZDRfd2R0X2RhdGEgc2FtYTVkNF9jb25maWc7DQo+PiAr
DQo+PiArc3RhdGljIHN0cnVjdCBzYW1hNWQ0X3dkdF9kYXRhIHNhbTl4NjBfY29uZmlnID0gew0K
Pj4gKwkuc2FtOXg2MF9zdXBwb3J0ID0gMSwNCj4+ICt9Ow0KPiANCj4gVW5sZXNzIHRoZXJlIGlz
IHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgdGhlcmUgd2lsbCBiZSBvdGhlcg0KPiBjb25maWd1cmF0
aW9uIGRhdGEsIHBsZWFzZSBqdXN0IGFzc2lnbiB0aGUgZmxhZyB2YWx1ZSBkaXJlY3RseQ0KPiB0
byAuZGF0YSBhbmQgYWRkIGEgdmFyaWFibGUgdG8gc3RydWN0IHNhbWE1ZDRfd2R0IHRvIGFjY2Vz
cyBpdC4NCj4gUGxlYXNlIG1ha2UgdGhhdCB2YXJpYWJsZSBhIGJvb2wuDQoNClRoZXJlIHdpbGwg
YmUgbW9yZSBjb25maWd1cmF0aW9uIGRhdGEgZm9yIGZ1dHVyZSBwcm9kdWN0cywgYnV0IG5vdCBh
dCANCnRoaXMgbW9tZW50LiBEbyB0aGUgY2hhbmdlIG9yIGtlZXAgaXQgdGhpcyB3YXkgPw0KDQpJ
IHdpbGwgZG8gdGhlIG90aGVyIGNoYW5nZXMgYXMgcmVxdWVzdGVkLg0KVGhhbmtzIGZvciByZXZp
ZXdpbmcsDQoNCkV1Z2VuDQo+IA0KPj4gKw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzYW1hNWQ0X3dkdF9vZl9tYXRjaFtdID0gew0KPj4gLQl7IC5jb21wYXRpYmxlID0g
ImF0bWVsLHNhbWE1ZDQtd2R0IiwgfSwNCj4+ICsJew0KPj4gKwkJLmNvbXBhdGlibGUgPSAiYXRt
ZWwsc2FtYTVkNC13ZHQiLA0KPj4gKwkJLmRhdGEgPSAmc2FtYTVkNF9jb25maWcsDQo+PiArCX0s
DQo+PiArCXsNCj4+ICsJCS5jb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW05eDYwLXdkdCIsDQo+
PiArCQkuZGF0YSA9ICZzYW05eDYwX2NvbmZpZywNCj4+ICsJfSwNCj4+ICAgCXsgfQ0KPj4gICB9
Ow0KPj4gICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzYW1hNWQ0X3dkdF9vZl9tYXRjaCk7DQo+
IA0KPiANCg==
