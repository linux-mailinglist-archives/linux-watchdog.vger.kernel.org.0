Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EE73562A
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 07:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbfFEFVa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 01:21:30 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:50164
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfFEFV3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 01:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+P1rUhPdpWbH6AehaxnQYdh0gbds2lu8ypgDyvLquI=;
 b=MJeI1UVYVOZhqQm8HOSVwAGERl/29IjwN2YNHmRgPhL94Fv/Ff4aWKhRdcgFTQacSYRBj0MSIuL9npjG8XMT8r7MnYQ7YWdjTIn4Eqhc5VaroFWh0Mc9xxr/ooCAKXq/30G3Nz1iFvgh6xI0v0dxuUYb5n/r0T3mLke3Y1PccV8=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3187.jpnprd01.prod.outlook.com (52.134.248.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 05:21:25 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 05:21:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Topic: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Index: AQHVG1zI8ElkBbHmPUyC2M5jmUFab6aMhgVQ
Date:   Wed, 5 Jun 2019 05:21:24 +0000
Message-ID: <OSAPR01MB308977BC79D432867DB23CB8D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11077d7a-e259-4c21-e574-08d6e975a79a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3187;
x-ms-traffictypediagnostic: OSAPR01MB3187:
x-microsoft-antispam-prvs: <OSAPR01MB31874676A2F0ED436269634DD8160@OSAPR01MB3187.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39860400002)(199004)(189003)(316002)(2501003)(66476007)(66946007)(3846002)(66066001)(76116006)(102836004)(25786009)(66446008)(68736007)(486006)(64756008)(2201001)(66556008)(7736002)(52536014)(256004)(6116002)(6246003)(73956011)(86362001)(71200400001)(71190400001)(110136005)(5660300002)(74316002)(53546011)(33656002)(8936002)(305945005)(54906003)(55016002)(478600001)(6436002)(2906002)(6506007)(229853002)(8676002)(81166006)(26005)(4326008)(186003)(9686003)(53936002)(81156014)(14454004)(7696005)(476003)(446003)(99286004)(76176011)(558084003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3187;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kWMP+k/ESuIb1cLKcytuii8ZswBZYxGqqMrmZx5rmLc41ix5T1LFN76sVtHMVIsB3jccXo2DQchTy4k/HurvhIR7X3ed0AJFPFhQLBIJbBXoulL3w1GJaKabuOG/yKAu4kVkwogW5XhBRSDHfMxpswN+Fu5tfy4r9WdxnNTqfrDJqkISRhVChOrvpKXybpgCL9dm5T/oW9ucGZDuajK/7wlYvdmAhfFEXACXC6Kv4W+696m4p6I2jZOfuA5eLpa70oze3jFx0nf/tXK7cGKv9O8mIh0y6tQQi7n6vmWoyAjio38wueKCFGwshgSfp38AyLU/FSx/EfCMxHTqxNUKaXgKamhSFOESORwbMGid8tbT4DYpqexla3s+KSUH0iAh+gwVFx91KGYyaE+PO8KmsYiXYrxAfmnptb0rgY1YSHc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11077d7a-e259-4c21-e574-08d6e975a79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 05:21:24.9457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3187
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSwgU2VudDogV2VkbmVzZGF5LCBKdW5lIDUsIDIwMTkg
MjowNCBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0hdIHdhdGNoZG9nOiByZW5lc2FzX3dkdDogQWRkIGEg
ZmV3IGN5Y2xlcyBkZWxheQ0KDQpPb3BzLCBJIHNob3VsZCBoYXZlIHN1Ym1pdHRlZCBhcyAiUEFU
Q0ggdjMiIG9uIHRoZSBzdWJqZWN0Li4uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGlt
b2RhDQoNCg==
