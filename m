Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9021850C
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2019 08:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfEIGF5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 May 2019 02:05:57 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:43774 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEIGF5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 May 2019 02:05:57 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,448,1549954800"; 
   d="scan'208";a="29738518"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 08 May 2019 23:05:56 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 8 May 2019 23:05:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nm1JMbpmGdWJCF3Ve/sJh27Ed620DPL4MeIriGZU+E=;
 b=dzedssQZfo1hUlze28U5oQsLoHFI7p6GmQP+mJ+opha5ov8L6sot2TBpwaC6uDZV4o8nW1Oxzes1qCbCpg7VkmwYfh05vbFj0aRtapXNl0ae66uUFHCAHaPorEjIYZEF3My+q8YRjnHOfpkA/11GYdyv/Rhpm8fFFoYFBC9BHvk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0027.namprd11.prod.outlook.com (10.164.155.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 9 May 2019 06:04:51 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 06:04:51 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux@roeck-us.net>
CC:     <Nicolas.Ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] watchdog: sama5d4: fix WDD value to be always set to max
Thread-Topic: [PATCH] watchdog: sama5d4: fix WDD value to be always set to max
Thread-Index: AQHVBahu/JHAOFdIPEa7ks2ptdaG2qZhbGKAgADhN4A=
Date:   Thu, 9 May 2019 06:04:51 +0000
Message-ID: <5fa08492-a2c1-0ebb-9399-4aa6519c358e@microchip.com>
References: <1557324535-9050-1-git-send-email-eugen.hristev@microchip.com>
 <20190508163405.GB5495@roeck-us.net>
In-Reply-To: <20190508163405.GB5495@roeck-us.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0120.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::22) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190509090009158
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 475a828b-78d8-4cf9-678e-08d6d4443fcb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DM5PR11MB0027;
x-ms-traffictypediagnostic: DM5PR11MB0027:
x-microsoft-antispam-prvs: <DM5PR11MB002786C7BE93EA91D932E2E2E8330@DM5PR11MB0027.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(53936002)(31686004)(6246003)(478600001)(446003)(72206003)(2906002)(76176011)(102836004)(53546011)(73956011)(6506007)(386003)(26005)(6486002)(186003)(68736007)(4326008)(11346002)(5660300002)(66556008)(64756008)(66946007)(66476007)(66446008)(25786009)(6116002)(6512007)(486006)(3846002)(86362001)(14454004)(81156014)(81166006)(6436002)(71190400001)(8676002)(71200400001)(316002)(8936002)(7736002)(31696002)(66066001)(54906003)(6916009)(305945005)(476003)(52116002)(2616005)(99286004)(229853002)(256004)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0027;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g3wj3NydAmygsxt9/IOt/Z7kzvCkfLbvQx20pVyJXxj1uV50MrlG0KSqpoCnAJiLp9VlNMekGtpcmPT/w1omxG48idL+mHs93McWIEa5BWa1ahDwRcyXRKahlqDiTEOQSCR/9XArugp+E+E827xoeI1z9HH2AJCaZ+I3OHe3lQMIbhcb281PEU+O3EG/7TYOTjM1FZ8/jxCuFs/AraqYEIQh8cvtIJ/tMctyGdEyv2TBAOQ3SuzDTM0o72/YrjAIqfZ7DtPPUg2e8PX5Lf6WBEhVNAkefX1m0U+JL+zeyWcWhPw7rRtE4nch0zECbmVvO4Z2bpRCXt2q1DnpIyuMhf1KmoiETLg++4e6WnBstANFJzLymm2NOuBcURP1jwrWbO6pq33BuWmjvPRDe3SLKJSpBDeSthuPGsq9rHr1l0s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CBDBF6FD9780E489D1CE63BD08C6BEF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 475a828b-78d8-4cf9-678e-08d6d4443fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 06:04:51.5715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0027
X-OriginatorOrg: microchip.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDA4LjA1LjIwMTkgMTk6MzQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIFdlZCwg
TWF5IDA4LCAyMDE5IGF0IDAyOjE1OjAzUE0gKzAwMDAsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlw
LmNvbSB3cm90ZToNCj4+IEZyb206IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9j
aGlwLmNvbT4NCj4+DQo+PiBXREQgdmFsdWUgbXVzdCBiZSBhbHdheXMgc2V0IHRvIG1heCAoMHhG
RkYpIG90aGVyd2lzZSB0aGUgaGFyZHdhcmUNCj4+IGJsb2NrIHdpbGwgcmVzZXQgdGhlIGJvYXJk
IG9uIHRoZSBmaXJzdCBwaW5nIG9mIHRoZSB3YXRjaGRvZy4NCj4+DQo+IE5vdCBzdXJlIHdoeSBz
ZXR0aW5nIFdERCB0byB0aGUgc2FtZSB2YWx1ZSBhcyBXRFYgd291bGQgZG8gdGhhdCwNCj4gYnV0
IG9uIHRoZSBvdGhlciBzaWRlIGl0IGxvb2tzIGxpa2Ugc2V0dGluZyBXREQgdG8gYW55dGhpbmcg
YnV0DQo+IHRoZSBtYXhpbXVtIGRvZXNuJ3QgYWRkIGFueSB2YWx1ZSBlaXRoZXIsIHNvDQoNCkl0
J3MgYSBoYXJkd2FyZSBpc3N1ZS4NCk5vcm1hbGx5LCBzZXR0aW5nIGEgV0REIGxvd2VyIHdvdWxk
IGFsbG93IHRoZSBzeXN0ZW0gZm9yIGEgbGl0dGxlIHRpbWUgDQp0byBwcmludCBvdXQgc29tZXRo
aW5nLCBiZWZvcmUgdGhlIGluZXZpdGFibGUgcmVzZXQgaGFwcGVucy4uLg0KSW4gb3VyIGNhc2Us
IHNldHRpbmcgV0REIGxvd2VyIHRoYW4gbWF4IHdvdWxkIG5vdCBhbGxvdyBhIHNpbmdsZSANCndh
dGNoZG9nIGZlZWQsIGFzIHRoZSBmaXJzdCBhdHRlbXB0IHRvIHdyaXRlIHRoZSBDUiB3b3VsZCB0
cmlnZ2VyIHRoZSByZXNldC4NClRoaXMgYnVnIHdhcyBub3Qgb2J2aW91cyBiZWNhdXNlIHRoZSBk
cml2ZXIgd2FzIGFsd2F5cyBzZXR0aW5nIGJvdGggV0REIA0KYW5kIFdEViB0byBtYXguLi4gdW50
aWwgdGltZW91dC1zZWMgcHJvcGVydHkgY2FtZSB1cCBpbiBEVCB3aGljaCBjaGFuZ2VzIA0KdGhp
cy4NCg0KRXVnZW4NCj4gDQo+IFJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+DQo+IA0KPiBHdWVudGVyDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJp
c3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMv
d2F0Y2hkb2cvc2FtYTVkNF93ZHQuYyB8IDQgKy0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
d2F0Y2hkb2cvc2FtYTVkNF93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYw0K
Pj4gaW5kZXggMWU5M2MxYi4uZDQ5NTMzNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvc2FtYTVkNF93ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5j
DQo+PiBAQCAtMTExLDkgKzExMSw3IEBAIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfc2V0X3RpbWVv
dXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLA0KPj4gICAJdTMyIHZhbHVlID0gV0RUX1NF
QzJUSUNLUyh0aW1lb3V0KTsNCj4+ICAgDQo+PiAgIAl3ZHQtPm1yICY9IH5BVDkxX1dEVF9XRFY7
DQo+PiAtCXdkdC0+bXIgJj0gfkFUOTFfV0RUX1dERDsNCj4+ICAgCXdkdC0+bXIgfD0gQVQ5MV9X
RFRfU0VUX1dEVih2YWx1ZSk7DQo+PiAtCXdkdC0+bXIgfD0gQVQ5MV9XRFRfU0VUX1dERCh2YWx1
ZSk7DQo+PiAgIA0KPj4gICAJLyoNCj4+ICAgCSAqIFdERElTIGhhcyB0byBiZSAwIHdoZW4gdXBk
YXRpbmcgV0REL1dEVi4gVGhlIGRhdGFzaGVldCBzdGF0ZXM6IFdoZW4NCj4+IEBAIC0yNTEsNyAr
MjQ5LDcgQEAgc3RhdGljIGludCBzYW1hNWQ0X3dkdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPj4gICANCj4+ICAgCXRpbWVvdXQgPSBXRFRfU0VDMlRJQ0tTKHdkZC0+dGlt
ZW91dCk7DQo+PiAgIA0KPj4gLQl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9XREQodGltZW91dCk7
DQo+PiArCXdkdC0+bXIgfD0gQVQ5MV9XRFRfU0VUX1dERChXRFRfU0VDMlRJQ0tTKE1BWF9XRFRf
VElNRU9VVCkpOw0KPj4gICAJd2R0LT5tciB8PSBBVDkxX1dEVF9TRVRfV0RWKHRpbWVvdXQpOw0K
Pj4gICANCj4+ICAgCXJldCA9IHNhbWE1ZDRfd2R0X2luaXQod2R0KTsNCj4+IC0tIA0KPj4gMi43
LjQNCj4+DQo+IA0KPiANCg==
