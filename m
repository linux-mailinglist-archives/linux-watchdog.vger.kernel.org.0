Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9D963C7D
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfGIUJF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:09:05 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:12361
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729572AbfGIUJF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTDCrGgYqTursVTZk0NA5QNY5zfdzr0WjcyIiu+2TIw=;
 b=Mm09PM4J2dcvjfi0nK7bUc2A1w4fZLuUy9WQg4mwr4wutwjDnb40w/8mVNP80LzcZM4Igp63u8RxejD0vpQ/cXDPAoZKU81Sp6pSFDD4MOa0ELKTGesnQbGVJmkiPC1zXYpmDkCaOwK7Q+WF2jqBMj/GvRPoVSSkFPvFCSKzob0=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB3890.eurprd06.prod.outlook.com (52.133.58.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 20:09:02 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 20:09:02 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v3 0/4] watchdog: cadence_wdt: Support all available prescaler
 values
Thread-Topic: [PATCH v3 0/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVNpImP/MUpO2pL0WV8H0bwc/sTA==
Date:   Tue, 9 Jul 2019 20:09:02 +0000
Message-ID: <20190709200801.42313-1-tomas.melin@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0006.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::16) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.2
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d2f9e5-b0ff-48ce-d128-08d704a94954
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB3890;
x-ms-traffictypediagnostic: AM0PR06MB3890:
x-microsoft-antispam-prvs: <AM0PR06MB3890712A00F35488E24F0448FDF10@AM0PR06MB3890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(39850400004)(376002)(136003)(189003)(199004)(53936002)(256004)(2906002)(14444005)(86362001)(50226002)(6512007)(71190400001)(71200400001)(2616005)(26005)(102836004)(186003)(110136005)(478600001)(6116002)(3846002)(54906003)(476003)(6506007)(386003)(64756008)(36756003)(66446008)(66476007)(107886003)(66556008)(4326008)(305945005)(68736007)(52116002)(99286004)(4744005)(1076003)(5660300002)(81166006)(486006)(316002)(25786009)(66066001)(14454004)(8676002)(8936002)(81156014)(2501003)(7736002)(66946007)(6436002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB3890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yWtMPL/fmA+LscG+bar4mCuBBFkhS6fJD23h4XSJ6c6LjU0LoIHZvO3QK9a7JrhStin2PjRO+4Bjdw3Tq15ar6nVaurIY9W2FjtpGdf55b3n7NJWJDsyTXQTQOP9GLki92CeQ1ofoYw9vgr7QnCSItmV+gv1OB9kBslGB69jEKUzdWdnZCe2rz7U2Ua+g/rCVIgy988tJZcJHneNFIQ9dAbvuKVtnLEievOPW467HcZXios8dAQhbOvtCls2EQCameUkhI7O+hVQICUOoA1sCC397zFaXbDRFtmPp44PKoWzt+tJAz4qPk5yTuD/2xbYMnbSTyf9dZnVhiR73BQFWbuwCHkEgcrbji60x9ITpfiACQOTOnd+RRarQ2K3BEvc8uemPaSS85IIVUoLAj9Y4A73aPa3k+RGI8XFEHlncJs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d2f9e5-b0ff-48ce-d128-08d704a94954
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:09:02.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB3890
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cadence watchdog HW supports prescaler values of 8, 64, 512 and 4096,
currently only 512 and 4096 are used by driver.

This series adds support to select prescaler values of 8 and 64 for
lower input clock frequencies.

Changes v3:
- Rebased on v5.2
- Move entire clock init block earlier in probe
- Add check for clock rate not being 0
- Add clock rate in error message

Changes v2:
- Add calculation of actual min/max timeout values
- Validate input clock frequencies to not allow
  frequencies that would result in timeout granularity
  of > 1 second.

Tomas Melin (4):
  watchdog: cadence_wdt: Move clock detection eariler in probe
  watchdog: cadence_wdt: Calculate actual timeout limits
  watchdog: cadence_wdt: Group struct member init statements
  watchdog: cadence_wdt: Support all available prescaler values

 drivers/watchdog/cadence_wdt.c | 65 ++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 27 deletions(-)

--=20
2.17.2

