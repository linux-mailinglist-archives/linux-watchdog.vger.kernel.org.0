Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D328A17B65
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 16:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbfEHOP0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 May 2019 10:15:26 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:39708 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbfEHOPZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 May 2019 10:15:25 -0400
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
X-IronPort-AV: E=Sophos;i="5.60,446,1549954800"; 
   d="scan'208";a="33789240"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 08 May 2019 07:15:24 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 8 May 2019 07:15:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/Xx5YEhkVZVHwnhYrprUn4r0hi1bHDxXgY040TgjqE=;
 b=Xmve6yXjOLui6N+bjWg68t3JwKG/LC2ULtvx5q52jgNAEmuytpu/GFdzWYPVoN6EM0ewow29o/JqrVRudXeQ+JwSW5MdMPeqY04gresZgKwiizpkBnshCshEpDzqi4Yo055cpTr9P9ciDrpEs/JYvTm+glUDXOqWMZYlcpnRj6A=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1898.namprd11.prod.outlook.com (10.175.92.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 14:15:03 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 14:15:03 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH] watchdog: sama5d4: fix WDD value to be always set to max
Thread-Topic: [PATCH] watchdog: sama5d4: fix WDD value to be always set to max
Thread-Index: AQHVBahu/JHAOFdIPEa7ks2ptdaG2g==
Date:   Wed, 8 May 2019 14:15:03 +0000
Message-ID: <1557324535-9050-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:803:104::44) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93658306-6273-4ab6-6198-08d6d3bf9036
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DM5PR11MB1898;
x-ms-traffictypediagnostic: DM5PR11MB1898:
x-microsoft-antispam-prvs: <DM5PR11MB1898CDF2EFCDB172BF8C099FE8320@DM5PR11MB1898.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(53936002)(86362001)(66446008)(73956011)(2501003)(71200400001)(71190400001)(476003)(8936002)(50226002)(66066001)(25786009)(68736007)(2616005)(4326008)(6486002)(14454004)(6436002)(66946007)(66476007)(66556008)(64756008)(107886003)(256004)(72206003)(2201001)(6512007)(478600001)(110136005)(102836004)(26005)(6506007)(186003)(6116002)(3846002)(486006)(316002)(386003)(305945005)(7736002)(2906002)(99286004)(52116002)(36756003)(81156014)(8676002)(5660300002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1898;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nlAngoE0nfyuSR3CJm84CYXyO/+ypYnUSpYOqt03TJ9OZzv01Yu4sqVNeHSqmGN4UlgnygrduB6cpPnbuEiSYUe744Mu71rap1Cl+1zx2926kjeZhrobNEiOaGGWUY0uibE+Ngt07l5MglYsSFoOwNXzXNKD8TwRGbTsY8mNwZbwLNJYfdOJBJ0F01WLpFbIltT8vZad8Ljnua2JlD8oa9Cgyix8RyKJXzHlHnsfwZfTiNjXIZPxdM7FRbpWwW1wxaBMAhvloax1bzYCcuK8WQDIVd96BHR3WhYz7iMy09fFX+sjNbE1MrxnxfUozuPn4gaw8gFC2KAd8QhGXjD+rvasm/U8J2FCt1JFo04qhJTE6VkGglDkXpvLmL9kFD/1cWluqZDUofPfcQSnUwLLZL75CDI7rqS9oSevIMU1gu0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 93658306-6273-4ab6-6198-08d6d3bf9036
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 14:15:03.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1898
X-OriginatorOrg: microchip.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpXREQg
dmFsdWUgbXVzdCBiZSBhbHdheXMgc2V0IHRvIG1heCAoMHhGRkYpIG90aGVyd2lzZSB0aGUgaGFy
ZHdhcmUNCmJsb2NrIHdpbGwgcmVzZXQgdGhlIGJvYXJkIG9uIHRoZSBmaXJzdCBwaW5nIG9mIHRo
ZSB3YXRjaGRvZy4NCg0KU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3Rl
dkBtaWNyb2NoaXAuY29tPg0KLS0tDQogZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jIHwg
NCArLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jIGIvZHJpdmVycy93
YXRjaGRvZy9zYW1hNWQ0X3dkdC5jDQppbmRleCAxZTkzYzFiLi5kNDk1MzM2IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jDQorKysgYi9kcml2ZXJzL3dhdGNoZG9n
L3NhbWE1ZDRfd2R0LmMNCkBAIC0xMTEsOSArMTExLDcgQEAgc3RhdGljIGludCBzYW1hNWQ0X3dk
dF9zZXRfdGltZW91dChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsDQogCXUzMiB2YWx1ZSA9
IFdEVF9TRUMyVElDS1ModGltZW91dCk7DQogDQogCXdkdC0+bXIgJj0gfkFUOTFfV0RUX1dEVjsN
Ci0Jd2R0LT5tciAmPSB+QVQ5MV9XRFRfV0REOw0KIAl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9X
RFYodmFsdWUpOw0KLQl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9XREQodmFsdWUpOw0KIA0KIAkv
Kg0KIAkgKiBXRERJUyBoYXMgdG8gYmUgMCB3aGVuIHVwZGF0aW5nIFdERC9XRFYuIFRoZSBkYXRh
c2hlZXQgc3RhdGVzOiBXaGVuDQpAQCAtMjUxLDcgKzI0OSw3IEBAIHN0YXRpYyBpbnQgc2FtYTVk
NF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiANCiAJdGltZW91dCA9
IFdEVF9TRUMyVElDS1Mod2RkLT50aW1lb3V0KTsNCiANCi0Jd2R0LT5tciB8PSBBVDkxX1dEVF9T
RVRfV0REKHRpbWVvdXQpOw0KKwl3ZHQtPm1yIHw9IEFUOTFfV0RUX1NFVF9XREQoV0RUX1NFQzJU
SUNLUyhNQVhfV0RUX1RJTUVPVVQpKTsNCiAJd2R0LT5tciB8PSBBVDkxX1dEVF9TRVRfV0RWKHRp
bWVvdXQpOw0KIA0KIAlyZXQgPSBzYW1hNWQ0X3dkdF9pbml0KHdkdCk7DQotLSANCjIuNy40DQoN
Cg==
