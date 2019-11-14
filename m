Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45C1FC56E
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Nov 2019 12:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfKNLej (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Nov 2019 06:34:39 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:24394 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNLej (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Nov 2019 06:34:39 -0500
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
IronPort-SDR: CdhrfENzEh5hF0aDdyt3m0CWS2wJdtMZBrJfB9hv+mhBuwyPcD+6Fycn04JmcCUHkEYkH1tZqu
 v2dFqEnPvO5mzYoJ2v5ez8yAxJRir97zsfAiBQtBzd320sHbfkv6cfgNlDQHEq/mIQFBko7Ko3
 mn9cpsUzGSpPV1xIJ8vnyi9pzaEJvmhK8fNhl1Tg5ra1qqzUx3sDihVLzSEvB5OoiNNYN1nofR
 xZCMDvBCpizWas+dqVhYJo7hVPll+zsRkPpb0XYO9w2Nguu7v+P9HTPSn51aFIe/aKuHlp1xcE
 Y20=
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; 
   d="scan'208";a="58377431"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Nov 2019 04:34:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 Nov 2019 04:34:36 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 14 Nov 2019 04:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9YIxtQY1r4AiYJyg5ozNSzHm0PDBABzweShFvuno+TRb1fFi1sf13UMLBBE861C89TrgSvi7xh8sPblPu6QFgg2qhEi0m1ZQzlhXYHforTUWKymPgZXhUn83RLW3Go4W7up8N/yr7ttUuzPnCE719ZTbf6SfDz1XugXd4JU/fuMUmGMGC/bSbuRFCeDnWelOb06JNn7e79GAAgtt3zDRt2N8nzFELYNYlrQFJitlOyvka3/QtiQozTqLokrE0vywfJp3LS1u197WtafRkVvhfsMlIj8BP+pgRszF9KKgOSEmX+If1fhLi661cH7URip4RSu2Z1wU9JJcmcMdLP6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sad7QnhP7tB8I+ZWOKI6hFEEO3HOqswEiqMHVpjCN7g=;
 b=naJdL5FnI12wzS1yemwzyMXV3YR7Qy9rfEgfObmgNmUdEJDAI+GPIa/NYjp0MabDXuJ9gYKKSfG32Es7Pphb+n5BaQVww2sjZFsctLU32ohIBVwVkws2bl8+r9hqrFaTkGt8YZ+8813229oDlDSgGoLJim1qzUHQMTdBaXCIsygtEzmiNWwbeouVqDGjNk5Tr8J6HMPrHqE+sjIBTmEXn1ERo/muBNl121EYl8ETdPGke9XlQ7htQVYXfYiGfoAlhSxBDTGqJsB1EdClikgaHta3szhXftEaWY7G0sSX03xmM2UOnawlsS0TbRBj6acMy79vGrCWN+fzw2wdlagHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sad7QnhP7tB8I+ZWOKI6hFEEO3HOqswEiqMHVpjCN7g=;
 b=BAPg3jk0ZhmUiYK5xkOaGsPIlh7Pk6MeiCWTXYtDafLhZly6wJM54WEGKbaIFn26c8a2lRwzaPZxKwO79jHVKtbVg/yEs8EpSqI4kCFy9RQPP/bTKgY+2R8GWZiG0a09FqHXzhEx8pfyciBtr1tx4Y/0+Ue3gjj1BWz27QJflyk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1434.namprd11.prod.outlook.com (10.172.36.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Thu, 14 Nov 2019 11:34:31 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2430.027; Thu, 14 Nov 2019
 11:34:31 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <wim@linux-watchdog.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
Thread-Topic: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit
 definitions
Thread-Index: AQHVmIlu6IftJNh+5UamBWHFg3A6OqeHjkGAgAL/mQA=
Date:   Thu, 14 Nov 2019 11:34:31 +0000
Message-ID: <70ba833e-2acc-7b5a-ca29-1ae9476eb0f5@microchip.com>
References: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
 <e34df163-60f5-35c6-05c6-845d70143fd9@roeck-us.net>
In-Reply-To: <e34df163-60f5-35c6-05c6-845d70143fd9@roeck-us.net>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::47) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191114133424250
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dd6441e-6e5a-4976-4a43-08d768f69dad
x-ms-traffictypediagnostic: DM5PR11MB1434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1434F873F049A503F758E48AE8710@DM5PR11MB1434.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:366;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(396003)(39850400004)(136003)(346002)(366004)(376002)(189003)(199004)(305945005)(316002)(8936002)(2906002)(229853002)(81166006)(81156014)(8676002)(66946007)(2501003)(31696002)(71200400001)(110136005)(99286004)(71190400001)(256004)(14444005)(66066001)(2616005)(6246003)(476003)(5660300002)(11346002)(446003)(486006)(6512007)(6506007)(53546011)(26005)(36756003)(386003)(6486002)(6436002)(25786009)(52116002)(76176011)(102836004)(7736002)(31686004)(86362001)(2201001)(14454004)(6116002)(3846002)(66556008)(64756008)(66446008)(478600001)(186003)(66476007)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1434;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9oXZCaF+KgOecN5qwqdh2RJ8o/wDJibvZLtErFxEP4TxA/NhOwB1gmx4jZ0HMeZ1caB0Mu3QIua6iXSb7oHgwH029jaHmXDFNtWznMue/wZoWZ0ah7WjCKpofhWelgRRKfzy1bztCl6X+MBFvC2eAZ1+T4X5teocOo8qgqXcHfxV4Zp7KIcX/BvQXiEyatv6IZQ8k0iASgEUSHxE9LJfBR+37OEua5QpaNaoY2yB5P4BDl8Fed+wwTEETVGKo7+ePyGKEB3vMeHkfhn8MM3Nm5WPoCQ9FezLuROWWKDu/VHXeK+TSR9XgkF0T1hqv9xvg1iEUkM/4/E1GgHDqVgN+O7LeYVpRmuaNtkNqqKQtavq6d7KGmdXwK0wSc7DyGid0LkimbyCPR5Vh2nxlGJ8OeMRkDaQ/G6n+uLCQNo4QAlK2LdIEmh3Wy/MkAkpXC2u
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E7552BC5C6A0C40A3012ECEC66640A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd6441e-6e5a-4976-4a43-08d768f69dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 11:34:31.5846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2yaMac5ngmS/bhqQT9fF23pL1VXtHufG3rvH+PZoh0TauSTaixdhk/nsHrsazi5I4pejC3o1Q6KUwCMfy7JgRxxeN9OqapeQBH8uFzOEj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDEyLjExLjIwMTkgMTU6NDcsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQoNCj4gDQo+IE9u
IDExLzExLzE5IDQ6MTMgQU0sIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+
IEZyb206IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+DQo+
PiBDbGVhbnVwIHRoZSBtYWNybyBkZWZpbml0aW9ucyB0byB1c2UgQklUIGFuZCBhbGlnbiB3aXRo
IHR3byBzcGFjZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4u
aHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBu
ZXcgcGF0Y2ggYXMgcmVxdWVzdGVkIGZyb20gcmV2aWV3IG9uIE1MDQo+Pg0KPj4gwqAgZHJpdmVy
cy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaCB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2F0OTFzYW05X3dkdC5o
IA0KPj4gYi9kcml2ZXJzL3dhdGNoZG9nL2F0OTFzYW05X3dkdC5oDQo+PiBpbmRleCAzOTA5NDFj
Li4yY2E1ZmM1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQu
aA0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaA0KPj4gQEAgLTE0LDIz
ICsxNCwyMyBAQA0KPj4gwqAgI2RlZmluZSBBVDkxX1dEVF9IDQo+PiDCoCAjZGVmaW5lIEFUOTFf
V0RUX0NSwqDCoMKgwqDCoMKgwqAgMHgwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogV2F0Y2hk
b2cgQ29udHJvbCANCj4+IFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZcKgwqDCoMKgwqDCoMKgIEFU
OTFfV0RUX1dEUlNUVMKgwqDCoMKgwqDCoMKgICgxwqDCoMKgIDw8IDApwqDCoMKgwqDCoMKgwqAg
LyogUmVzdGFydCAqLw0KPj4gLSNkZWZpbmXCoMKgwqDCoMKgwqDCoCBBVDkxX1dEVF9LRVnCoMKg
wqDCoMKgwqDCoCAoMHhhNSA8PCAyNCnCoMKgwqDCoMKgwqDCoCAvKiBLRVkgDQo+PiBQYXNzd29y
ZCAqLw0KPj4gKyNkZWZpbmXCoCBBVDkxX1dEVF9XRFJTVFTCoMKgwqAgQklUKDApwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBSZXN0YXJ0ICovDQo+IA0KPiBVc2luZyBCSVQoKSByZXF1aXJlcyBp
bmNsdWRpbmcgbGludXgvYml0cy5oLg0KDQoNCkhpIEd1ZW50ZXIsDQoNClRoZSBDIGZpbGVzIGlu
Y2x1ZGUvd2lsbCBpbmNsdWRlIHRoZSBiaXRzLmggYXMgdGhlIGRyaXZlcnMgdXNlIHRoaXMgDQpk
ZWZpbml0aW9uIGhlYWRlciwgb3IsIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQgPw0K
DQpUaGFua3MsDQpFdWdlbg0KDQo+IA0KPj4gKyNkZWZpbmXCoCBBVDkxX1dEVF9LRVnCoMKgwqDC
oMKgwqDCoCAoMHhhNSA8PCAyNCnCoMKgwqDCoMKgwqDCoCAvKiBLRVkgUGFzc3dvcmQgKi8NCj4+
IMKgICNkZWZpbmUgQVQ5MV9XRFRfTVLCoMKgwqDCoMKgwqDCoCAweDA0wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBXYXRjaGRvZyBNb2RlIFJlZ2lzdGVyICovDQo+PiAtI2RlZmluZcKgwqDCoMKg
wqDCoMKgIEFUOTFfV0RUX1dEVsKgwqDCoMKgwqDCoMKgICgweGZmZiA8PCAwKcKgwqDCoMKgwqDC
oMKgIC8qIENvdW50ZXIgDQo+PiBWYWx1ZSAqLw0KPj4gLSNkZWZpbmXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEFUOTFfV0RUX1NFVF9XRFYoeCnCoMKgwqAgKCh4KSAmIEFUOTFfV0RUX1dEVikNCj4+
IC0jZGVmaW5lwqDCoMKgwqDCoMKgwqAgQVQ5MV9XRFRfV0RGSUVOwqDCoMKgwqDCoMKgwqAgKDHC
oMKgwqDCoCA8PCAxMinCoMKgwqDCoMKgwqDCoCAvKiBGYXVsdCANCj4+IEludGVycnVwdCBFbmFi
bGUgKi8NCj4+IC0jZGVmaW5lwqDCoMKgwqDCoMKgwqAgQVQ5MV9XRFRfV0RSU1RFTsKgwqDCoCAo
McKgwqDCoMKgIDw8IDEzKcKgwqDCoMKgwqDCoMKgIC8qIFJlc2V0IA0KPj4gUHJvY2Vzc29yICov
DQo+PiAtI2RlZmluZcKgwqDCoMKgwqDCoMKgIEFUOTFfV0RUX1dEUlBST0PCoMKgwqAgKDHCoMKg
wqDCoCA8PCAxNCnCoMKgwqDCoMKgwqDCoCAvKiBUaW1lciANCj4+IFJlc3RhcnQgKi8NCj4+IC0j
ZGVmaW5lwqDCoMKgwqDCoMKgwqAgQVQ5MV9XRFRfV0RESVPCoMKgwqDCoMKgwqDCoCAoMcKgwqDC
oMKgIDw8IDE1KcKgwqDCoMKgwqDCoMKgIC8qIFdhdGNoZG9nIA0KPj4gRGlzYWJsZSAqLw0KPj4g
LSNkZWZpbmXCoMKgwqDCoMKgwqDCoCBBVDkxX1dEVF9XRETCoMKgwqDCoMKgwqDCoCAoMHhmZmYg
PDwgMTYpwqDCoMKgwqDCoMKgwqAgLyogRGVsdGEgDQo+PiBWYWx1ZSAqLw0KPj4gLSNkZWZpbmXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFUOTFfV0RUX1NFVF9XREQoeCnCoMKgwqAgKCgoeCkgPDwg
MTYpICYgQVQ5MV9XRFRfV0REKQ0KPj4gLSNkZWZpbmXCoMKgwqDCoMKgwqDCoCBBVDkxX1dEVF9X
RERCR0hMVMKgwqDCoCAoMcKgwqDCoMKgIDw8IDI4KcKgwqDCoMKgwqDCoMKgIC8qIERlYnVnIA0K
Pj4gSGFsdCAqLw0KPj4gLSNkZWZpbmXCoMKgwqDCoMKgwqDCoCBBVDkxX1dEVF9XRElETEVITFTC
oMKgwqAgKDHCoMKgwqDCoCA8PCAyOSnCoMKgwqDCoMKgwqDCoCAvKiBJZGxlIA0KPj4gSGFsdCAq
Lw0KPj4gKyNkZWZpbmXCoCBBVDkxX1dEVF9XRFbCoMKgwqDCoMKgwqDCoCAoMHhmZmYgPDwgMCnC
oMKgwqDCoMKgwqDCoCAvKiBDb3VudGVyIFZhbHVlICovDQo+PiArI2RlZmluZcKgIEFUOTFfV0RU
X1NFVF9XRFYoeCnCoMKgwqAgKCh4KSAmIEFUOTFfV0RUX1dEVikNCj4+ICsjZGVmaW5lwqAgQVQ5
MV9XRFRfV0RGSUVOwqDCoMKgIEJJVCgxMinCoMKgwqDCoMKgwqDCoCAvKiBGYXVsdCBJbnRlcnJ1
cHQgRW5hYmxlICovDQo+PiArI2RlZmluZcKgIEFUOTFfV0RUX1dEUlNURU7CoMKgwqAgQklUKDEz
KcKgwqDCoMKgwqDCoMKgIC8qIFJlc2V0IFByb2Nlc3NvciAqLw0KPj4gKyNkZWZpbmXCoCBBVDkx
X1dEVF9XRFJQUk9DwqDCoMKgIEJJVCgxNCnCoMKgwqDCoMKgwqDCoCAvKiBUaW1lciBSZXN0YXJ0
ICovDQo+PiArI2RlZmluZcKgIEFUOTFfV0RUX1dERElTwqDCoMKgwqDCoMKgwqAgQklUKDE1KcKg
wqDCoMKgwqDCoMKgIC8qIFdhdGNoZG9nIERpc2FibGUgKi8NCj4+ICsjZGVmaW5lwqAgQVQ5MV9X
RFRfV0REwqDCoMKgwqDCoMKgwqAgKDB4ZmZmIDw8IDE2KcKgwqDCoMKgwqDCoMKgIC8qIERlbHRh
IFZhbHVlICovDQo+PiArI2RlZmluZcKgIEFUOTFfV0RUX1NFVF9XREQoeCnCoMKgwqAgKCgoeCkg
PDwgMTYpICYgQVQ5MV9XRFRfV0REKQ0KPj4gKyNkZWZpbmXCoCBBVDkxX1dEVF9XRERCR0hMVMKg
wqDCoCBCSVQoMjgpwqDCoMKgwqDCoMKgwqAgLyogRGVidWcgSGFsdCAqLw0KPj4gKyNkZWZpbmXC
oCBBVDkxX1dEVF9XRElETEVITFTCoMKgwqAgQklUKDI5KcKgwqDCoMKgwqDCoMKgIC8qIElkbGUg
SGFsdCAqLw0KPj4gLSNkZWZpbmUgQVQ5MV9XRFRfU1LCoMKgwqDCoMKgwqDCoCAweDA4wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBXYXRjaGRvZyBTdGF0dXMgDQo+PiBSZWdpc3RlciAqLw0KPj4g
LSNkZWZpbmXCoMKgwqDCoMKgwqDCoCBBVDkxX1dEVF9XRFVORsKgwqDCoMKgwqDCoMKgICgxIDw8
IDApwqDCoMKgwqDCoMKgwqAgLyogV2F0Y2hkb2cgDQo+PiBVbmRlcmZsb3cgKi8NCj4+IC0jZGVm
aW5lwqDCoMKgwqDCoMKgwqAgQVQ5MV9XRFRfV0RFUlLCoMKgwqDCoMKgwqDCoCAoMSA8PCAxKcKg
wqDCoMKgwqDCoMKgIC8qIFdhdGNoZG9nIA0KPj4gRXJyb3IgKi8NCj4+ICsjZGVmaW5lIEFUOTFf
V0RUX1NSwqDCoMKgwqDCoMKgwqAgMHgwOMKgwqDCoMKgwqDCoMKgIC8qIFdhdGNoZG9nIFN0YXR1
cyBSZWdpc3RlciAqLw0KPj4gKyNkZWZpbmXCoCBBVDkxX1dEVF9XRFVORsKgwqDCoMKgwqDCoMKg
IEJJVCgwKcKgwqDCoMKgwqDCoMKgIC8qIFdhdGNoZG9nIFVuZGVyZmxvdyAqLw0KPj4gKyNkZWZp
bmXCoCBBVDkxX1dEVF9XREVSUsKgwqDCoMKgwqDCoMKgIEJJVCgxKcKgwqDCoMKgwqDCoMKgIC8q
IFdhdGNoZG9nIEVycm9yICovDQo+PiDCoCAjZW5kaWYNCj4+DQo+IA0K
