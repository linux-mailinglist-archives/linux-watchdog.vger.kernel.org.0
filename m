Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050A6CE4EB
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2019 16:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfJGORL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Oct 2019 10:17:11 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:8591 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGORL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Oct 2019 10:17:11 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: omg2YT47CKvJ02GmeBKUWMzVv55uV0TYovxXP4BkFBczeD7A0atDvfukWfeR4SFTAOnvY5MGHR
 UdEugJwCGlUyKMxvicTZ2sNRW2XojoEcW/5nD5t7nLcIwT/PCy/LG9OwAkKao2s1KTdz7n0M1y
 EgQbd7YOxVO+toiUfhkJobL1qGz8L+H52e3t3/3dPCbevxKTBMGJXXvwnz5hVKzjSMGypGXU29
 D39BDZkref4ot/sbdLki58Pk9CoBPQKex9KJ2PX9PjPRVobNqUOj+yFw57LBZtNVV9IcDkcYt6
 Fr4=
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; 
   d="scan'208";a="50681831"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2019 07:17:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Oct 2019 07:17:10 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 7 Oct 2019 07:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVzR1FjDHSYQP/sJ2K4+ny2xf9JTVWIMhkF3h2KNQxIc96Mb1O8A4ZfnxX8GzC4G+rQrsYwHJXuwP8hNE8I3jwdWiTvPUk7/9Gp6tg2w5weC1aHMKCr0YfPAuNnLhcCOGpUvOBySg3wIXBgyGXxCrrKciYF5D4lhelZk9lf4Kvq14y1OX+XPaRQ+TzKMnzwvESnDnHMpHkJeyjg9YuiIrhgsC+bDHUcId04F36ILM8YOhTFs5a0Eq4mIgDcyOjM2JlGkxkrPifB68U2lGj+7pKach5Xvfj1vuNhn8mjRDJdzsicsc1WVEwuu4rMRufERl8v6xzXDnPh9mTeVsq1CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnH1V09UE7UdGTxZFztDT6VrhYa1pDi9LtqE3OXRvRU=;
 b=Z7/Qq6WwQMYePOAuNtlRZPS2s44ciyef8LStliU0AcSnx6Y2UZngyzFQNw9MREMwr1GzUgPxX4Y5eimO7PJnk/NQW6w54nsW5aI/dQFpY/QS31otF0Y6LGpQaeCALNCT1+88lw40tUIvUBR+S9bn6YxGGCHsN8UUCN+biIAQWuyjhWS6kJJyAbUfw4dwVakB2QNY8YL0jMePIuHVomuTpT1mR8MkW7fckivj9zPGdBUu0yDmms+/+2SNDFfaAz6o1e11cjsXnjTvvvLh+PE6bdeqaEFkTGAcvrc40iy1hTtkZ2YWt1dr7SvFDU0ZeIVAjtVO9gP0/6c0EPT06PHcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnH1V09UE7UdGTxZFztDT6VrhYa1pDi9LtqE3OXRvRU=;
 b=e2W87CE1vaJKmWS/EUd2FkXqUtcO4g6mPnuOz+HgHELnLP+0yXd1geCu2i/GqPTZEIsE9q6AsS/Bq1Ak+RLBYfwgiSEnZtWHqdSi3gEERzOgrZ66HRozKkQPmFxRnxZHtcY4mO8WScs4OozAcdmP1qKMq+qeFabSzuoCEPVkjeM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1386.namprd11.prod.outlook.com (10.168.106.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 14:17:07 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2327.026; Mon, 7 Oct 2019
 14:17:07 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <alexandre.belloni@bootlin.com>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog
 timer driver
Thread-Topic: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog
 timer driver
Thread-Index: AQHVePP1mVCAVHNqYEKA4n6lujXEMadHVTuAgAeBQgCAAE9UAIAACneAgAAQAwA=
Date:   Mon, 7 Oct 2019 14:17:07 +0000
Message-ID: <f07d299f-574b-8f48-9412-c9a9b50ccd3a@microchip.com>
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
 <1570001371-8174-2-git-send-email-eugen.hristev@microchip.com>
 <e58a3ab5-69bc-cad3-5faa-ed00ff7906c7@roeck-us.net>
 <ab7b6b45-5e6f-100d-51af-a82ac325d948@microchip.com>
 <a9adf20c-f730-a7e9-a826-59216c17f03d@roeck-us.net>
 <20191007131348.GH4254@piout.net>
In-Reply-To: <20191007131348.GH4254@piout.net>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0060.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::22) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191007171124760
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 784933f9-b5ea-498b-2f3d-08d74b310911
x-ms-traffictypediagnostic: DM5PR11MB1386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB138675662C32FA3CD5ACE77AE89B0@DM5PR11MB1386.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(110136005)(2616005)(102836004)(6436002)(11346002)(8936002)(54906003)(476003)(5660300002)(52116002)(305945005)(36756003)(486006)(81166006)(81156014)(6486002)(6246003)(31686004)(8676002)(99286004)(2906002)(26005)(6512007)(107886003)(4326008)(446003)(71190400001)(256004)(25786009)(66476007)(66556008)(66446008)(31696002)(386003)(53546011)(66066001)(71200400001)(14454004)(186003)(64756008)(86362001)(3846002)(316002)(229853002)(66946007)(7736002)(76176011)(478600001)(6116002)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1386;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HK24lH1fFOtWOaiboUnreUg4jKhTltI7q2VA9bNx6s23yZIeyF8rL5+pInnvw2hAqbf0M5GFkRYdDFTnzGylG+A9FITGVmh72FGQViaqDRXNHT8nf1Taki4BAfjqfsFn2CJ/+xGYbClvsYcGt69K4WYevRP/fGQfG8WDq6gX6fMdX02g0xOpCbF0/YEGW2Lf96k30xj19JNbwyaACkgWr8kmCBWxWSQE8RPEG5qVy/kFvZnhvC44WQB31X2ajtiKaSOWJ6TiX3luSk1x0GenDmhlYLy2KVfGKI/8ba/ed92gLFJE0W9mjgedpf+w39nG4p/O1mDPcU9PamCOvnXzpHiTlodNeQOMOq8Huf3zvJB7ECXn/xGdIBR7RPL9IyJNpqli9FtCGJAzdzDbR4h8Bv4er4PmIFriuCLXvGYSloA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CADD20031B0D44993430B4B4818B0D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 784933f9-b5ea-498b-2f3d-08d74b310911
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:17:07.5725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8Cw+Ld4Jk5SFpyo7IacVYMHwTzG00lngVtt2Rg9gIvY655GCgcipy6Xfg4zYqy6HKrJK+BeG8r7Nx1ux9Lx637R0fabLv3BkF8pRCRJJ7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1386
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDA3LjEwLjIwMTkgMTY6MTQsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KDQo+IA0K
PiBPbiAwNy8xMC8yMDE5IDA1OjM2OjM4LTA3MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+PiBP
biAxMC83LzE5IDEyOjU4IEFNLCBFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+
PiBbIC4uLiBdDQo+Pj4gSGVsbG8gR3VlbnRlciwNCj4+Pg0KPj4+IFRoYW5rIHlvdSBmb3IgdGhl
IGZlZWRiYWNrLg0KPj4+IEFmdGVyIHJldmlld2luZyB0aGlzLCBjYW4geW91IHBsZWFzZSBndWlk
ZSBtZSB0b3dhcmRzIG9uZSBvZiB0aGUNCj4+PiBwb3NzaWJsZSB0d28gZGlyZWN0aW9uczogbWVy
Z2UgdGhpcyBkcml2ZXIgd2l0aCBzYW1hNWQ0X3dkdCAsIGFuZCBoYXZlIGENCj4+PiBzaW5nbGUg
ZHJpdmVyIHdpdGggc3VwcG9ydCBmb3IgYm90aCBoYXJkd2FyZSBibG9ja3M7IG9yLCBoYXZlIHRo
aXMNCj4+PiBkcml2ZXIgc2VwYXJhdGVseSAsIGFzIGluIHRoaXMgcGF0Y2ggc2VyaWVzPw0KPj4+
DQo+Pg0KPj4gSSBub3RpY2VkIHRoZSBzaW1pbGFyaXRpZXMuIEkgZG9uJ3Qga25vdyBpZiBpdCBt
YWtlcyBzZW5zZSB0byByZWNvbmNpbGUNCj4+IHRoZSB0d28gZHJpdmVyczsgaXQgc2VlbXMgdG8g
bWUgdGhlIG5ldyBjaGlwIHVzZXMgdGhlIHNhbWUgYmFzaWMgY29yZSB3aXRoDQo+PiBlbmhhbmNl
bWVudHMuIEluIGdlbmVyYWwsIEkgcHJlZmVyIGEgc2luZ2xlIGRyaXZlciwgYnV0IG9ubHkgaWYg
dGhlIHJlc3VsdA0KPj4gZG9lc24ndCBlbmQgdXAgYmVpbmcgYW4gaWYvZWxzZSBtZXNzLiBVbHRp
bWF0ZWx5LCBpdCBpcyByZWFsbHkgeW91ciBjYWxsDQo+PiB0byBtYWtlLg0KPj4NCj4gDQo+IE1v
c3QgaWYgbm90IGFsbCB5b3VyIGNvbW1lbnRzIHdlcmUgYWxyZWFkeSBhZGRyZXNzZWQgaW4gdGhl
IG90aGVyDQo+IGRyaXZlci4gVGhlIG1haW4gZGlmZmVyZW5jZSBpbiB0aGUgcmVnaXN0ZXIgaW50
ZXJmYWNlIGlzIHRoZSBsb2NhdGlvbiBvZg0KPiB0aGUgY291bnRlciB0aGF0IG9ubHkgcmVhbGx5
IGFmZmVjdHMgc2FtYTVkNF93ZHRfc2V0X3RpbWVvdXQgYW5kIHRoYXQNCj4gY291bGQgYmUgYWJz
dHJhY3RlZCBhd2F5IGJ5IHVzaW5nIGEgZGlmZmVyZW50IHN0cnVjdCB3YXRjaGRvZ19vcHMuDQo+
IEludGVycnVwdCBlbmFibGluZyBpcyBhbHNvIGRvbmUgZGlmZmVyZW50bHksIEkgZG9uJ3QgdGhp
bmsgaXQgaGFzIGEgaHVnZQ0KPiBpbXBhY3QuDQo+IA0KDQpUaGFuayB5b3UgR3VlbnRlciBhbmQg
QWxleGFuZHJlLA0KDQpJIHdpbGwgc3RhcnQgd29ya2luZyBvbiBhIHYyIHdpdGggYSBtZXJnZWQg
ZHJpdmVyLg0KDQpUaGFua3MgYWdhaW4sDQpFdWdlbg0K
